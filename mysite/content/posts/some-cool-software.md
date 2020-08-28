---
title: "Some of My Favorite Software"
date: 2020-08-17T10:43:39-05:00
tags:
  - Opinion
  - Software
  - Showcase
---

This is a list of some of the best software that I have come across in my journey using Linux. I highly recommend that you try them out and maybe even give the developers a well earned star on Github to show your support :)

> Links to the software's Github page are in the headers

## [Maim](https://github.com/naelstrof/maim), the better screenshot tool
One of the most important pieces of software you can have is something to capture you display, while [scrot](https://github.com/dreamer/scrot) does the job quite well, it has issues with selecting areas and windows, which is where Maim comes in, it does basically the same thing as scrot but without any of the rendering and selection issues. Also, every screenshot you see on this blog was taken using Maim.

> **Fun fact:** bind this command in your hotkey daemon's config and you can use it to easily take and paste screenshots:
>
> `maim -s -u | xclip -selection clipboard -t image/png`

![picture-of-sxiv](https://i.imgur.com/6T1WTMF.png#float-right)
## [SXIV](https://github.com/muennich/sxiv), Simple X Image Viewer
Many image viewers out there are usually needlessly large programs with unnecessary features, SXIV aims to just be a simple image viewer for X. And it does just that. You can zoom, pan, have a thumbnail mode, and just about anything you really need.

## [Giph](https://github.com/phisch/giph), Simple .gif Recorder
Exactly what it claims to be, Giph a simple little utility that makes use of FFmpeg's recording abilities to make it easy to record gifs of all, or sections of your screen. You can even use slop to select a section of your screen and then output it as a gif file, which is very convenient. And, like with maim, every gif that you see on this blog was recorded using Giph.

Hi phisch **:)**

## [Lyrebird](https://github.com/chxrlt/lyrebird), Voice Changer For Linux
Just looking at the UI of this program, you can easily tell what it is. You simply select which effect to apply then toggle the application, it couldn't possibly get simpler to use. It works really good too, with there being minimal to none amounts of audible distortion and/or lag in input time when using this to change your voice.

![picture-of-lyrebird](https://i.imgur.com/FNQWNFu.png)

![picture-of-cfm](https://i.postimg.cc/50ty9BYj/image.png#float-right)
## [cfm](https://github.com/WillEccles/cfm), Cactus File Manager
We've all used things like Ranger at some point, but sometimes you just need a small little file browser to get around directories quickly or make a quick change to a file. cfm is great for things like this, since it doesn't have any unnecessary features and thus remains very fast. It also looks a bit nicer than [fff](https://github.com/dylanaraps/fff), it's main "competitor, with its nice little indentation effects and stuff.

## [Ripcord](https://cancel.fm/ripcord/), Lightweight Discord/Slack Client
If you've used the normal Discord electron client, you are most likely aware of how resource intensive and bloated it can be, especially when it comes to ram usage. This is where Ripcord comes in, it is ridiculously lightweight and has most of the features you could want as well, including some very snappy movement via keybinds. It also has customizable colors out of the box.

![picture-of-ripcord](https://i.postimg.cc/xCjJJr7f/image.png)

## [Qalc](https://github.com/Qalculate/libqalculate), Stupidly Powerful CLI Calculator
The days of having to turn to Google or some proprietary Internet service just for the sake of getting some quick maths done is over. With Qalc, not only can you easily do any number of regular mathematical operations, you can also do a number of verbose calculations for things like unit conversions. You may not get what I mean so here is an example:

![picture-of-qalc](https://i.postimg.cc/J4FbfhFb/image.png)

And, if you aren't up for doing math in the terminal, there is also an equally powerful [GUI Version](http://qalculate.github.io/).
