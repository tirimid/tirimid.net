---
layout: default
title: medioed
---

# medioed

## The idea

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

## Installing medioed

Go to [the GitHub](https://github.com/tirimid/medioed). Clone the repository and
enter the cloned directory by doing:

```
$ git clone https://github.com/tirimid/medioed
$ cd medioed
```

At this point you will need to have [mincbuild](mincbuild.md) installed, as that
is the buildsystem I used for medioed. Actually, my desire to make medioed was a
big reason I even created mincbuild to begin with. Anyway, once you have
mincbuild installed, you can build medioed. Run:

```
$ mincbuild
```

... and the project will be built, assuming the compilation suceeds. If it
doesn't, check your toolchain and see if you can edit the `mincbuild.conf` to
make it work.

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

At this point, no more setup is necessary.

## Using medioed

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

more stuff will be added here eventually...

## Configuring and customizing medioed

stuff will be added here eventually...
