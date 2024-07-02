---
layout: default
title: medioed
date_published: 2024-02-04
date_latest_revision: 2024-03-31
author: tirimid
---

# The idea

medioed stands for (Medio)cre Text (Ed)itor. As the name suggests, it is a
mediocre text editor for Linux systems. It doesn't have any particularly
advanced features, but it is still perfectly usable for general, low-scale text
editing. It builds to a standalone binary with no external dependencies in the
filesystem. The idea behind medioed is to create a sort of "decluttered GNU
Emacs" from scratch which supports only the features which I personally am
likely to use. It's a project to create *my* perfect text editor.

Relative to other, more popular, text editors, medioed is fairly minimalist.
Although probably not as minimalist as some people may like, since the only
qualifier for whether something is added is my personal taste in text editors,
rather than some consistent design principle.

medioed is free software.

# Installing medioed

Go to [the GitHub](https://github.com/tirimid/medioed). Clone the repository and
enter the cloned directory by doing:

```
$ git clone https://github.com/tirimid/medioed
$ cd medioed
```

At this point you will need to have either [mincbuild](mincbuild.md) or Make
installed. Mincbuild is the buildsystem I used for medioed. Actually, my desire
to make medioed was a big reason I even created mincbuild to begin with. Anyway,
once you have one of the two installed, you can build medioed.

Run:

```
$ mincbuild
```

... or:

```
$ make
```

... and the project will be built, assuming the compilation suceeds. If it
doesn't, check your toolchain and see if you can edit the `mincbuild.conf` or
`Makefile` to make it work.

Once you have built the project, you can install the `medioed` binary to your
system. To do this, run the following:

```
# ./install.sh
```

And if you ever want to uninstall it, run:

```
# ./uninstall.sh
```

The default installation location will be at `/usr/bin`, and you can change this
by editing the `install.sh` and `uninstall.sh` scripts - or you can install the
binary manually if you have some kind of special procedure for it, since all the
scripts do is a file copy / deletion.

At this point, no more setup is strictly necessary.

## Optional dependencies

The actual medioed program itself has no dependencies. However, for the manpage
viewer label integration, it opens a pipe to `man` using `popen()`. Nothing bad
will happen if Man isn't present on the system - you just won't be able to use
the feature. This makes Man an optional dependency (although it should be
present on all sane Linux systems anyway).

# Using medioed

## Command line

After installation, you can run `medioed` in your terminal in a few different
ways. Either you can run it on its own, with no arguments, or you can run it
with an arbitrary number of arguments (which represent the files which will be
opened in buffers upon program startup). You can then also specify any of the
following options:

* `-c`: Any files passed as arguments will be created if they don't exist. If
  they already exist, they will simply be opened normally, as if the flag hasn't
  been passed
* `-d`: stderr will be redirected to a file specified in the source code. By
  default, it will be called `medioed.log`. This is only useful for development
  and debugging changes made to the source code
* `-r`: Any opened external files will be treated as read-only and you will be
  unable to edit them. This includes files passed as command line arguments and
  those opened from within medioed using the C-x C-f keybind.

And also `-h`, which will simply display usage information in a more terse way.

## Interactive mode

Running medioed opens an interactive mode text editor in the terminal.

Medioed, being inspired by GNU Emacs, is modeless - unlike Vim. A lot of the
keybinds are also based on GNU Emacs. Any printing character you enter (which
isn't part of a keybind) will be written to the current selected buffer.

Files written from / read to buffers are assumed to be in UTF-8, implemented
through the use of C locales and wide characters. Buffer editing is performed
through wide character operations.

### Frames and buffers

The editor has a system of frames and buffers. Buffers represent the underlying
textual data buffers in memory - so when you read a file, it is written into a
buffer. Buffers also store information like data source (file, freshly created,
etc.) and a limited undo history. Frames, on the other hand, represent the
actual visible "windows" presented to the user. Frames are bound to buffers, and
are the thing which allow the user to interact with a buffer. Frames and buffers
should have a 1:1 correspondence in practice, but are technically different.
Frames store information like cursor position and syntax highlighting mode
(local mode).

### Local and global modes

"Local mode" is just the name for the syntax highlighting settings. When using
Markdown syntax highlighting, you are in the `md` local mode. Local modes are
called that because they are local to every frame, and do not reset when you
switch between them. In the source, local mode "X" is implemented in
`src/hl/hl_X.c`, and made visible to the editor in `src/conf.c`.

"Global mode" is the name for a collection of functions which hook into specific
editor events, like key presses or editor updates. Only one global mode can be
active at a time, hence the name. When you switch to a frame which requests a
specific global mode, the current active global mode quits and the new one
initializes. In practice, the global modes currently only make use of the init
hook, where they add their own mode-specific keybindings to the global set.
These keybindings are used to handle indentation, smart parenthetical insertion
and deletion, and in some cases other quality-of-life things.

In short: local modes are syntax highlighters, global modes provide programming
language tooling in the editor.

### Supermodal interaction

Some aspects of the editor completely ignore the active global and local modes.
These are: the prompt and the label. There can only be a single prompt or label
active at a time, and the user interacts with them "directly", partially
bypassing the usual keyboard input system. That is, when you issue C-f to the
prompt, it prevents the main keyboard system from treating it as a bind. The
only thing that the keyboard system still does is record the keypress for macro
purposes, if macro recording is active.

### Cheatsheet - Important keybinds

To get a comprehensive list of keybinds, consult `src/conf.c` and the source
file for the individual global mode you wish to see (`src/mode/mode_X.c`). There
are also a few prompt and label specific keybinds which you can see
comprehensively in `src/prompt.c` and `src/label.c` What follows is a few
select, important keybinds a beginner user ought to know.

Basic:

* C-x C-c: quit medioed
* C-c M-g g: change active globalmode
* C-c M-g l: change active localmode

Prompt:

* C-g: quit
* C-f: forward one character
* C-b: back one character
* BACKSPC: delete one character, backwards from cursor

Label:

* C-g: quit
* C-n: scroll down one line
* C-p: scroll up one line

Cursor:

* C-f: forward one character
* M-f: forward one word
* C-b: back one character
* M-b: back one word
* C-a: start of current line
* C-e: end of current line
* C-n: next line
* C-p: previous line

Buffer:

* RET: create new line at cursor
* C-d: delete one character, forwards from cursor
* M-BACKSPC: delete one word, backwards from cursor
* BACKSPC: delete one character, backwards from cursor
* C-x C-f: read file into buffer
* C-x u: undo last linear series of changes
* C-x C-s: write buffer to source file
* C-c n: create new scrap buffer

Frame:

* C-x b: next frame
* C-c b: previous frame
* C-x k: kill active frame

### Macros

Much like many other things in medioed, the macro system is inspired by that of
GNU Emacs. By default, a macro is *not* recording. To begin recording a macro,
press F3 - now, you will see that, at the bottom of the screen, your keypress
history will be recorded. Once you have set the base for your macro, press F4 to
stop recording. When you are not recording, and if a macro has already *been*
recorded, you may press F4 to execute it. Macro execution in medioed works by
feeding the recorded inputs back into the keyboard system, as if the user has
entered them again.

Try not to enter ridiculously long macros, as there is a limit on size (512
keypresses). Exceeding this limit will simply result in a truncated macro
recording, with the end part missing.

# Configuring and customizing medioed

stuff will be added here eventually...
