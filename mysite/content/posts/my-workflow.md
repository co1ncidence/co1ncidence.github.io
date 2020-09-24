---
title: "An In Depth Look at My Workflow"
date: 2020-09-18T14:55:33-05:00
---

One of the things I find most important when using a computer is effective workflow management. Getting the most efficient setup and being able to do my work as fast as possible while maintaining quality. In this post I will go over some of the things I do in my setup to ensure that I have the most efficient working environment possible.

<!--more-->

## Table of Contents:
  1. [Software I Use](#software-i-use)
  2. [Window Management](#window-management)
  3. [Useful Keybinds](#useful-keybinds)
  4. [Dmenu-Ception](#dmenu-ception)
  5. [Effective and Minimal Note Taking](#effective-note-taking)
  6. [My Workflow and School](#my-workflow-and-school)
  6. [Final Note](#final-note)

## Software I use

To start things off, here is a basic overview of some of my productivity software:

- **Distro:** Manjaro Linux
- **Window Manager:** Openbox
- **Terminal:** Simple Terminal
- **Editor:** NeoVim
- **Browser:** Ungoogled-Chromium
- **Menu Manager:** Dmenu
- **Other Software:** Zathura, LibreOffice, Xournal++, SkanLite

You may be confused about some of the choices I've made here, mainly those regarding my distribution and window manager. The reason I run Manjaro is for printer compatibility, which I simply could *not* get working on Arch Linux. And I use Openbox because it does exactly what I need it to, manages windows without getting in my way. While not being very workflow oriented out of the box, and with just a few tweaks and scripts we can get Openbox to be even more efficient than a standard tiling window manager.

## Window management

To overcome Openbox's strange default workflow, I have implemented a mix of efficient [vim-based keybinds](https://www.maketecheasier.com/cheatsheet/vim-keyboard-shortcuts/) to make window management easier. I have all of the window placement, resizing, and movement that I could want from most tiling window managers but at a minimal level, thus removing any unnecessary features. Most of this window management is achieved using [wmutils](https://github.com/wmutils/core) in correspondence with [sxhkd](https://github.com/baskerville/sxhkd). One thing to note is that due to my limited (14 inches) screen real estate, I rarely ever have more than 2 or 3 windows on my screen. A lot of my window management workflow and keybind choices revolve around this condition.

### Workspaces

**Super + h/l** will move me between relative workspaces.

**Alt + Shift + h/l** will move the current window between relative workspaces.

### Manipulating Windows

**Super + c** will center the current window, helps with bringing windows quickly into a focused position.

**Super + j/k** will toggle a window as maximized, both keys do either action so as to reduce any margin of error.

### Manual Window Resizing

**Alt + h/j/k/l** will resize a window, one set resizes outwards, and the other resizes inwards. My resizing is extremely fast as well, this is because I have `xset r rate 250 50` set in my Xorg configuration, which applies considerable acceleration to any repeated actions.

**Ctrl + Shift + h/j/k/l** will snap a window to any of the 4 cardinal directions, this helps with laying out multiple windows side by side or top to bottom.

## Useful Keybinds

I find that one of the most essential parts to maintaining efficiency is by having a keyboard based workflow, so, in keeping with this, I've made sure that the actions that I find myself doing most are all bound to keypresses, so I can do them quickly instead of having to waste time using a mouse.

### Apps

  - **Super + Return** will open my terminal
  - **Super + i** will open my browser
  - **Super + e** will open ranger in a terminal window

### Screenshots and Video

  - **Alt + Shift + e** screenshot by selection, copies to clipboard
  - **Alt + Shift + s** screenshot by selection and save it to a folder
  - **Alt + Shift + d** screenshot by selection with 50px padding
  - **Alt + Shift + t** will begin recording my entire screen in 60fps
  - **Alt + Shift + r** manually select a region of my screen to record

### Other things

  - **Super + o/p** will raise and lower my volume
  - **Super + Up/Down** will raise and lower my screen brightness
  - **Super + bracketright/left** will play the next/previous song in mpd
  - **Super + backslash** will toggle mpd playback
  - **Super + q** will show a nice info notification:
    + This removes any need for a space wasting bar

![img](https://i.postimg.cc/g2t3w86X/what.png)

### Dmenu bindings

  - **Super + b** will open up my school menu tree
  - **Super + m** will open up the meme menu
  - **Super + n** will open up my [password menu](https://github.com/cdown/passmenu)
  - **Super + s** will open up a menu of fonts, each will launch a typing test with the font I choose:

![img](https://i.postimg.cc/6pFyJ0v0/what.png)

## Dmenu-Ception

While normally just used for launching applications, `dmenu` can also be used to create custom menus that run whichever commands you want them to. Here is an example of a menu that I use as a password manager. I point it to a directory that contains my passwords and, to put it simply, `dmenu` will copy those passwords to my clipboard:

```sh
#!/bin/sh

dir="$HOME/usr/doc/sav/pass"

pass=$(ls -1 "$dir" | dmenu -fn "Recursive Mono Linear Static")

[ -f "$dir/$pass" ] && xclip -sel clip "$dir/$pass"
```

Now here is where it gets interesting. You can point a `dmenu` script to another `dmenu` script, this allows you to essentially navigate a directory of menus. I have such a setup here (which I can initiate with **Super +b**) for opening up certain school documents and folders with ease:

![gif](https://i.postimg.cc/Z5YKGQnp/what.gif)

## Effective Note Taking

On the topic of little useful scripts, here is one that I came up with called `note` that makes quick and easy note taking almost trivial:

```sh
#!/bin/sh

printf '%s\n' "$(date +'%a/%d %I:%M'): $*" >> ~/var/notes/notes.html
```

Here is an example of this script in use:

```sh
[$] note Finish writing a blogpost
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

Putting the notes in HTML format also allows me to easily, and visually, comment out entries that I have marked as done. And by using the fantastic `vim-commentary` plugin, this is as simple as pressing `gcc` on a line. To supplement this, I have aliases to quickly access this notes file as well as one to reveal only the undone entries of it. The simplicity of this setup allows for almost infinite extensibility. So, in theory, **I should be able to adapt this "semi-workflow" to just about any situation.**

## My Workflow and School

As a college student, **using Linux can be scary.** You never know when you might not be able to do something your fellow students can. Perhaps your distro is missing a package or you forgot to install some drivers. While a lot of these things can be taken care of before a semester, sometimes you need to fix things on the spot. Thankfully, however, I was able to integrate my workflow with my college's requirements without too much of a headache. Here are some of the things I did to keep up with my professor's requirements:

### Easy-To-Miss Software requirements

When you are as stressed about minimalism in computing as I am sometimes, you may end up accidentally forgetting to implement a feature that may not seem important but actually is. These things can include:

  - Installed and working printer drivers
  - Software that can use your printers scanner
  - Knowing how to mount and unmount USB drives
  - Enabling HDMI support for monitors and projectors
  - And being familiar with shitty college websites

While some of these things may seem like common sense, I frequently check on my ability to do them so I don't miss out on a crucial moment. For example, I always make sure I have **SkanLite** installed in case I ever need to scan a physical document for submission.

### Managing All My Files

One thing I always make sure I have is an intuitive, easy to navigate, and well organized directory tree for all my documents. I prefer to follow a Semantic directory structure, which lets me break down categories into more categories, thus making even the most obscure files and folders trivial to find. Here is a quick overview of my current documents directory:

```sh
[$] tree -d -L 3
.
├── bok
├── sav
│   ├── keepass
│   └── pass
└── sch
    ├── doc
    │   ├── pdf
    │   ├── png
    │   ├── ppt
    │   └── txt
    ├── engl-1302
    │   ├── assignments
    │   ├── doc
    │   ├── essays
    │   ├── labs
    │   └── reqs
    ├── huma-1301
    │   ├── assignments
    │   └── doc
    └── precalc
```

As you can see, I like to keep everything organized **in human readable fashion in their own specific places,** while also keeping directory names small and simple. Organizing classes by their own folders is also handy, as to not mix up rubrics or other teacher-given documents.

### Composition, Writing Essays in MLA

While most people are used to writing their college essays in something like **Microsoft Word** or **LibreOffice**, I personally am not a fan of them. Rich text editing is tedious and most of the time inefficient as well. I much prefer to use proper markup formatters like [LaTeX](https://www.latex-project.org/) and [Markdown](https://daringfireball.net/projects/markdown/). To summarize my reasoning, here is a meme one of my friends made on this topic:

![img](https://i.postimg.cc/fTwJHKwn/latex.png)

Now while learning LaTeX can be a hard thing, especially while you may be trying to study for an upcoming exam, utilizing it for something like an MLA formatted essay is almost trivial. I've been using **LaTeX in NeoVim** for quite some time now and have even managed to integrate it with my menu workflow shown before. And for MLA formatting I simply use a [LaTeX MLA template](https://wso.williams.edu/wiki/index.php/LaTeX_MLA_Template), thus all I need to do is write name/date and start typing away. The MLA template I use also has a simple to use bibliography system with a predefined "Works Cited" page, so I have no worries regarding properly citing my sources or formatting them into my essay. Once I'm done I can simple run a command like this to make my document ready for submission:

```sh
[$] pdflatex essay.tex essay.pdf
```

And *Voila*, I have successfully written an MLA essay and now can send it to my teachers for grading!

### Browser

While I've always loved and used Firefox, It often has compatibility issues with some of my **shittily designed school websites.** To make up for this I am using [ungoogled-chromium](https://github.com/eloston/ungoogled-chromium/) as my main browser, it works (as far as I can tell) exactly like the normal chromium browser but without all of the malicious Google code. It has had not compatibility issues for me so far, and is also quite a bit faster than other browsers that I've tried.

Here are the browser extensions I use:
  - Vimium C
  - Ublock origin
  - Reddit Enhancement Suite
  - HTTPS Everywhere
  - H264ify

Most of these are pretty common except Vimium C, I use it because it helps me move my Vim keybindings into my browser as well, making moving around tabs and just any sort of navigation in general extremely simple.

## Final Note

So there it is, a rather simple overview of some of the things that boost up my daily workflow. I hope that you found some of these things interesting and maybe even took some inspiration from them.
