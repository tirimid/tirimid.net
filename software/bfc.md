---
layout: default
title: BFC
date_published: 2024-02-11
date_latest_revision: 2024-03-15
author: tirimid
---

# What is BFC?

BFC, or (B)rain(F)uck (C)ompiler, is a Brainfuck compiler capable of taking
Brainfuck source files and producing from them GNU-as-compatible assembly files
encompassing equivalent functionality. I made this project because my friend and
I wanted to make brainfuck interpreters, but I decided that too many of those
already existed. And while many brainfuck compilers also exist, there are
substantially fewer of those than there are interpreters.

It only supports an x86_64 Linux target, but the underlying architecture is
designed in such a way that it should be fairly trivial to expand it to other
targets. I am not supporting / working on BFC anymore but still decided to write
this article in case someone wants to read some learned experience on
implementing a Brainfuck compiler.

BFC is free software.

# Installing and using

First, clone the source from the [GitHub repo](https://github.com/tirimid/bfc),
build the project using [mincbuild](mincbuild.md), and install it.

```
$ git clone https://github.com/tirimid/bfc
$ mincbuild
# ./install.sh
```

This process will install the compiled `bfc` binary to `/usr/bin`. To uninstall
it you can either manually delete it, or run:

```
# ./uninstall.sh
```

After installation, you can run BFC in the following ways:

1. Generate an assembly source file from a Brainfuck source file:
   ```
   $ bfc input.bf output.s
   ```
2. Generate an object file from a Brainfuck source file (this will invoke GNU
   assembler on the system from `/usr/bin/as` after initial compilation):
   ```
   $ bfc -o input.bf output.o
   ```
3. Generate an executable binary from a Brainfuck source file (this will invoke
   GNU assembler, `/usr/bin/as`, and then GNU linker, `/usr/bin/ld`, after
   initial compilation):
   ```
   $ bfc -bo input.bf output
   ```

This is all detailed in the help menu displayed upon running:

```
$ bfc -h
```

# How jump labels are generated (implementation of '[' and ']')

This is probably the only thing that caused me any headache while implementing
BFC, so I will document it here in case any prospective Brainfuck compiler
implementors want to save themself the struggle.

The thing is, this is actually very simple; you just need to think about it in
the proper way.

Start by assigning every conditional ('[' and ']', which I shall call condbegin
and condend respectively) its own "index" or "value" within the source. For
example, take this short piece of Brainfuck code:

```
>++++++++ [A <+++++++++>- ]B <.
>++++ [C <+++++++>- ]D <+.
```

I have suffixed each conditional with a letter-comment name. So when I refer to
"condbegin A", I am talking about the one on the first line, on the left.

Imagine assigning each of these conditionals a unique index:

* A has index 0
* B has index 1
* C has index 2
* D has index 3

When writing out the compiled assembly you will refer to each of these
conditionals by their number indices - BFC does this in hexadecimal to save
space in files many conditionals.

Now imagine you are currently at condbegin A, and you need to decide whether to
jump to condend B. The way this is done in Brainfuck is that if the value at the
current position of the data pointer is 0, then you perform the jump. Otherwise,
the block is executed. The minimum to fulfill this would be two jump labels, and
a conditional jump instruction, something like this:

```
    cmpb $0, (%r13) // BFC uses `r13` to store the data pointer.
    je .Lce_1
.Lcb_0: // BFC uses `cb_` as a prefix for condbegin jump labels.
    // ...
.Lce_1: // BFC uses `ce_` as a prefix for condend jump labels.
```

Assuming a well-formed program - you can assume, upon entering a condbegin, that
there will be at least N + 1 condend labels following it, where N is the number
of other condbegin labels that follow it. This is because every condbegin must
have a condend to terminate it.

Thus, you can just take the current jump label which you're in upon encountering
a condbegin (you can either store this as compiler state or determine it by
seeking backwards through the file and counting all instances of '[' and ']'),
and run through the source until you have found N + 1 condend labels.

Then, you can conditionally jump to the label with index J + 2N + 1, where J is
the index of the encountered condbegin label and N is the minimum number of
other condbegin labels encountered before a condend label.

In practice, what BFC does is it creates a variable, `nests_rem`, and assigns it
an initial value of 1. It also creates a variable called `jmplabel` with the
currently stored label value, as described above. Then, it runs through the
Brainfuck source from the current point; incrementing `nests_rem` if the current
character is '[', and decrementing `nests_rem` if it is ']'. In either case, if
the character is either '[' or ']', `jmplabel` is incremented. As soon as
`nests_rems` reaches zero, this algorithm terminates. By the end of this
process, `jmplabel` is the index of the destination of the conditional jump. BFC
doesn't need to worry about whether the label with this index actually exists
yet, since it knows that it will inevitably be generated later in a well-formed
program.

In the case of encountering a condend, you can simply follow this procedure but
seek backwards through the source instead of forwards, and increment `nests_rem`
in the case of a ']', decrementing it in the case of a '['.

BFC also adds jump label prefixes for readability when the generation is
complete (i.e. `cb_XXXX`, `ce_XXXX`), but this is actually not necessary. Every
label has a unique index anyway, so the label prefixes are not required.

# Implementation-specific limitations

* Depending on what Brainfuck specification you read, you will see several
  definitions for what to do if the data pointer leaves the acceptable range of
  cells. Generally, the pointer should either wrap around to the other end or
  the compiler / interpreter should facilitate behavior which gives the
  Brainfuck source the impression that it has unlimited space (i.e. by
  allocating more space for cells). BFC does not do this, it simply outputs an
  error and terminates.
* Only an x86_64 Linux target is supported.
* Generation of Intel-syntax assembly is not supported.
* The compiler operates directly based on the Brainfuck source rather than
  creating some sort of optimization-friendly intermediary, although this isn't
  *necessarily* a bad thing for a language as simple as Brainfuck.

# How you could improve on the design of BFC

Most obviously, you can try to solve the problems described above in your
implementation.

As a short note, try to look at optimizations you implement and optimize them
further. Actually, one thing I missed when initially implementing compiler
optimizations (which I won't add now since I'm not working on BFC anymore) is
the way data increments and decrements interact.

See, one optimization I implemented was something like "increment shortening".
That is, something like the following code:

```
    // equivalent to Brainfuck `++++`.
.Lcb_0:
    incb (%r13)
    incb (%r13)
    incb (%r13)
    incb (%r13)
    // ...
```

... would get optimized to:

```
    // equivalent to Brainfuck `++++`.
.Lcb_0:
    addb $4, (%r13)
    // ...
```

... which is not only more efficient in terms of speed, but also in terms of
generated filesize. This optimization works by literally scanning the Brainfuck
source and counting how many consecutive `+`s occur at a specific point in the
code. But, actually, this can be taken further. You could have a counter
variable keeping track of the current "increment amount" and *also* count `-`s.

BFC doesn't do this, but it should be absolutely trivial to implement in your
own compiler.

For instance, this code:

```
    // equivalent to Brainfuck `+++--`.
.Lcb_0:
    inb (%r13)
    inb (%r13)
    inb (%r13)
    decb (%r13)
    decb (%r13)
    // ...
```

... could trivially be optimized to:

```
    // equivalent to Brainfuck `+++--`.
    // three increments and two decrements is mathematically equivalent to one
    // increment.
.Lcb_0:
    addb $1, (%r13)
    // ...
```

The compiler could even be made to check for a special case of +/-1 and generate
an `incb` / `decb` instead of an `addb` / `subb`, if such an instruction would
be more efficient in the targeted instruction set.
