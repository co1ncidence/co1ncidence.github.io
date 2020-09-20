---
title: "An In Depth Look at My Workflow"
date: 2020-09-18T14:55:33-05:00
---

One of the things I find the most important when using a computer is effective workflow management. Getting the most efficient setup and being able to do my work as fast as possible while maintaining quality. In this post I will go over in detail the things I do in my setup to ensure that I have the most efficient working environment possible.

<!--more-->

### Table of Contents:
  1. [Software I Use](https://co1ncidence.github.io/posts/my-workflow/#software-i-use)
  2. [Window Management](https://co1ncidence.github.io/posts/my-workflow/#window-management)
  3. [Other Useful Keybinds](https://co1ncidence.github.io/posts/my-workflow/#other-useful-keybinds)
  4. [Dmenu-Ception](https://co1ncidence.github.io/posts/my-workflow/#dmenu-ception)
  5. [Effective and Minimal Note Taking](https://co1ncidence.github.io/posts/my-workflow/#effective-note-taking)
  6. [Compatibility With The Norm](https://co1ncidence.github.io/posts/my-workflow/#compatibility-with-the-norm)

## Software I use

To start things off, here is a basic overview of some of my productivity software:

**Distro:** Manjaro Linux

**Window Manager:** Openbox

**Terminal:** Simple Terminal

**Browser:** Ungoogled-Chromium

**Menu Manager:** Dmenu

**Editor:** NeoVim

**Other Software:** Zathura, LibreOffice, XournalPP, SkanLite

You may be confused about some of the choices I've made here, mainly those regarding my distribution and window manager. The reason I run Manjaro is for printer compatibility, which I simply could *not* get working on Arch Linux. And I use Openbox because it does exactly what I need it to, manages windows without getting in my way. While not being very workflow oriented out of the box, and with just a few tweaks and scripts we can get Openbox to be even more efficient than a standard tiling window manager.

## Window management

To overcome Openbox's strange default workflow, I have implement a mix of efficient [vim-based keybinds](https://www.maketecheasier.com/cheatsheet/vim-keyboard-shortcuts/) to make window management easier. I have all of the window placement, resizing, and movement that I could want from most tiling window managers but at a minimal level, thus removing any unnecessary features. Most of this window management is achieved using [wmutils](https://github.com/wmutils/core) in correspondence with [sxhkd](https://github.com/baskerville/sxhkd). One thing to note is that due to my limited (14 inches) screen real estate, I rarely ever have more than 2 or 3 windows on my screen. A lot of my window management workflow and keybind choices revolve around this condition.

#### Workspaces

**Super + h/l** will move me between relative workspaces.

**Alt + Shift + h/l** will move the current window between relative workspaces.

#### Manipulating Windows

**Super + c** will center the current window, helps with bringing windows quickly into a focused position.

**Super + j/k** will toggle a window as maximized, both keys do either action so as to reduce any margin of error.

#### Manual Window Resizing

**Alt + h/j/k/l** will resize a window, one set resizes outwards, and the other resizes inwards. My resizing is extremely fast as well, because I have `xset r rate 250 50` set in my Xorg configuration, which applies considerable acceleration to any repeated actions.

**Ctrl + Shift + h/j/k/l** will snap a window to any of the 4 cardinal directions, this helps with laying out multiple windows side by side or top to bottom.

## Other Useful Keybinds

#### Apps

  - **Super + Return** will open my terminal
  - **Super + i** will open my browser
  - **Super + e** will open ranger in a terminal window

#### Screenshots and Video

  - **Alt + Shift + e** screenshot by selection, copies to clipboard
  - **Alt + Shift + s** screenshot by selection and save it to a folder
  - **Alt + Shift + d** screenshot by selection with 50px padding
  - **Alt + Shift + t** will begin recording my entire screen in 60fps
  - **Alt + Shift + r** manually select a region of my screen to record

## Dmenu-Ception

While normally just used for launching applications, `dmenu` can also be used to create custom menus that run whichever commands you want them to. Here is an example of a menu that I use as a password manager. I point it to a directory that contains my passwords and, to put it simply, `dmenu` will copy those passwords to my clipboard:

```sh
#!/bin/sh

dir="$HOME/usr/doc/sav/pass"

pass=$(ls -1 "$dir" | dmenu -fn "Recursive Mono Linear Static")

[ -f "$dir/$pass" ] && xclip -sel clip "$dir/$pass"
```

Now here is where it gets interesting. You can point a `dmenu` script to another `dmenu` script, this allows you to essentially navigate a directory of menus. I have such a setup here for opening up certain school documents and folders with ease:

![gif](https://i.postimg.cc/0QPnnyC0/out.gif)

## Effective Note Taking

On the topic of little useful scripts, here is one that I came up with called `n` that makes quick and easy note taking almost trivial:

```sh
#!/bin/sh

printf '%s\n' "$(date +'%a/%d %I:%M'): $*" >> ~/var/notes/notes.html
```

Here is an example of this script in use:

```sh
[$] n Finish writing a blogpost
```

This command will append the sentence `Finish writing a blogpost` to the end of a specified notes file. Not only that, but the note entry will be prefixed by a date and time. This makes identifying and marking off old notes much easier. Here is what a notes file would look like:

```html
Wed/16 08:02: Relearn Quadratics
Wed/16 08:03: Finish Covid essays
<!-- Wed/16 08:03: Watch Linux TED talks and use as labs -->
<!-- Thu/17 09:43: do Khan Academy auto-tests -->
<!-- Thu/17 11:26: Learn github-cli tool because cool -->
Thu/17 02:29: Finish windows blog post
<!-- Thu/17 06:48: Remove bliss window decor -->
<!-- Fri/18 02:40: Make some kind of trash folder -->
Fri/18 05:18: Find more TED talks
Fri/18 05:19: Do a writing center appointment
Fri/18 05:19: Write workflow blog post
Fri/18 07:41: Find out which labs to complete
<!-- Sat/19 10:03: Find out how to use custom website fonts -->
<!-- Sat/19 03:48: Finalize website dark mode -->
Sat/19 03:48: Finish shell scripting course
```

Putting the notes in HTML format also allows me to easily, and visually, comment out entries that I have marked as done. And by using the fantastic `vim-commentary` plugin, this is as simple as pressing `gcc` on a line. To supplement this, I have aliases to quickly access this notes file as well as one to reveal only the undone entries of it. The simplicity of this setup allows for almost infinite extensibility. So, in theory, I should be able to adapt this "semi-workflow" to just about any situation.

## Compatibility With The Norm
