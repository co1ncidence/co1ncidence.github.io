---
title: "Linux and CLI, a 101"
date: 2020-08-15T14:15:28-05:00
tags:
  - Guide
  - Productivity
---

When I first started with Linux, and especially the command line, It was difficult to find a truly optimal and comprehensive guide to everything I needed to know. While most tutorials were decent and gave me a good starting point, they usually provided insufficient information or didn't showcase the most optimal commands and strategies. I am making this list as more of a dump for all of the things that I have learned about Linux and the Command Line so far. While my knowledge isn't too much compared to some, I like to think that I know something. So without further ado, here is my guide to help boost you up in the Linux elitist ladder:

<!--more-->

> Always remember: **RTFM** - "Read The F***ing Manual"

## First, some Terminology and Tips
The Terminal is simply an interface to interact with your computer, by itself, it is nothing but an empty program. A terminal (in 99.99% of cases) needs a **Shell** to function. A shell is an interactive text interface for the user, and the **Terminal** is the tool most often used to run commands via the shell. There are many shells out there, thought this tutorial in specific will be focusing on the most is **Bash**, the most popular shell in use right now and the default shell of most [Linux](https://en.wikipedia.org/wiki/Linux) distributions, if you are on macOS and thus use **ZSH**, don't worry, everything here will still apply, just replace all instances of the word "bash" with "zsh". Bash allows you to run commands from other programs or utilities, common ones you'll mostly likely need are those from something like the [GNU Coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities), and any other programs you might use daily. Once you have familiarized yourself with these terms, you can get on to actually using the command line. Here is what you will usually see when you open up a terminal:

```sh
# This is a comment, these will guide you along
[user@hostname $] <-- The Prompt, where you enter commands
# For the purposes of this guide, I will shorten the prompt to:
[$] echo 'command'
```

And finally, and most likely **The Most Important Thing You Will Read Here**, you have to always be willing to read documentation and official manuals when encountering a problem or struggling to learn something. Don't go around annoying others for help. Some common things to do when having issues include:
  - Reading the official manual of the program, accessed by running the "man" command for that program in the terminal
  - Searching through the [GitHub](https://github.com) issues of the program you are struggling with
  - Searching through online forums like [Stack Overflow](https://stackoverflow.com/)
  - Reading Wiki pages on amazing websites like the [ArchWiki](https://wiki.archlinux.org/)
  - Searching [Reddit](https://reddit.com) for similar problems or making a post about your own

**If you follow these steps and effectively search  for solutions, you will learn far better and faster than any other way.**

## Second, Some Linux Basics
In this section I will be discussing some basic Linux concepts, terminology, and tip/tricks that every user should know before they dive deeper into the operating system.

### The Linux File System
In Linux and other UNIX-based operating systems, almost everything is available to the user as a file or folder. This results in your system being essentially just one massive file system. Imagine it this way, your entire Linux install is one huge folder, called `/`, this folder contains everything your system and the programs on it need to function and work together. You can use the `tree` command on the base `/` folder to better visualize this:

```sh
[$] tree -d -L 1
.
├── bin -> usr/bin
├── boot
├── dev
├── etc
├── home
├── lib -> usr/lib
├── lib64 -> usr/lib
├── lost+found
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin -> usr/bin
├── srv
├── sys
├── tmp
├── usr
└── var
```

This command only shows the biggest, main folders on your system. Each of these is further subdivided into even more different folders and files. Going over the entire filesystem is an extremely daunting task, so I will just give a short briefing on the general purpose of each folder:

`/bin/`: This is a symlink, or symbolic link, to the `/usr/bin/` folder, I will go over **/usr/** as a whole in a bit.

`/dev/`: This stands for "Device", and is where all the devices connected to your system have there appropriate files, this can contain drives or peripherals. You will find your hard disks and their partitions labeled as `/dev/sda-z|1-9`.

`/etc/`: Originally stood for "etcetera", now this is where all of the global configuration files of all the programs on your system are stored, such as, for example, those used by your init system or display manager:

`/home/`: This is where all of the home folders and files of all (normal) users on your system are, it is separated into folders with the usernames of said users, and contains specific files only accessible to said users. Here is where you will be spending around 90% of your time as a Linux user. Home folders usually contain the standard **Documents** or **Pictures** folders and the like, but also contain some important hidden folders, such as:
  - **.cache/**: this is where all of your users program's store their cache files
  - **.config/**: this is where all of your user-specific configuration files are stored
  - **.local/**: this is the same (in terms of function) as the **/usr/** folder but for your current user only.
It is important to get to know your home folder well and to keep it nice and tidy, it is basically your main "workspace" on a Linux system.

`/lib/ and /lib64/`: These are both symlinks to **/usr/lib/**, which we will discuss later.

`/lost+found/`: This is an interesting folder, it is where the recovered bit's and pieces of other corrupted files can be found. In general, however, you will never need to go near here.

`/mnt/`: This is where USB drives and other mounted devices, and their contents, can be found. It will usually be empty if you don't have any external storage devices mounted.

`/opt/`: This is where third party software and configurations are installed. You will usually find things like proprietary drivers and program files over here.

`/proc/`: This is another special folder, since if it a virtual directory it doesn't actually contain any physical files, but instead just bits and pieces of varying system information and statistics. Most of the files in here contain information regarding either your kernel or running processes.

`/root/`: This is the equivalent of **/home** but for the root user. Once again this is something that you will rarely mess with as most of the time on your machine is spend as a normal user, not root.

`/run/`: Being one of the newest directories in the Filesystem, this is where some applications store transient files, such as sockets and/or process ID's.

`/sbin/`: While symlinked to **/usr/bin**, it also serves as the place where certain system administration binaries are stored, or in other words, commands only the root user should be allowed to run.

`/srv/`: This is where service data is stored, such as files for websites you visit. It is always changing and not anything you would ever have to mess with.

`/sys/`: This is where certain system information is stored in variable files. Things like your battery percentage or brightness level can be found here.

`/tmp/`: This is another interesting folder, it is called "tmp" because it is a temporary filesystem, or, in simple terms, a folder that cleans itself every time you restart your computer. Many programs dump temporary files here to save space.

`/usr/`: This, in essence, can be called the "home directory of your whole system", or, more specifically, the equivalent of **/home/.local/** but for all users on the computer. It contains a few folders, each which serve their own purpose:

```sh
[$] tree -d -L 1 /usr/
/usr
├── bin
├── include
├── lib
├── lib32
├── lib64 -> lib
├── local
├── sbin -> bin
├── share
└── src
```
  - **bin/**, this is where all the global binaries on your system are stored. For example, when you install Firefox, it creates a file in this folder called "Firefox", which is executed every time you run the browser. The same applies to just about every other program or command on your system
  - **include/**, This directory "includes" all necessary headers that C compilers use at compile time. It is not somewhere you will ever find yourself, so we won't go any deeper
  - **lib/, lib32/, and lib64/**, These are where the libraries of all languages and programs of your system go. These files are often stored for later use by programs and their developers, and aren't something you would ever usually need to touch
  - **local/**, This is basically a clone of **/usr/** but for local purposes, these files are usually only accessible to certain users, usually the administrator of the system
  - **sbin/**, This is just a symlink to **bin/**, which we discussed before
  - **share/**, This is the equivalent of **.local/share** but for the system as a whole. Many programs and architectures make use of the global files here. Out of all the **/usr** directories mentioned so far, this is the only one you might have to actually spend time in
  - **src/**, A folder not found on every distribution, this usually contains important source code for certain Kernel objects, not something you will usually ever need to worry about though.

`/var/`: The last of the root directories, it's name stand for "variable(s)". It contains constantly changing files and information that programs use. It is also writable unlike **/usr/**, which makes it a useful and safe place to store things like system logs, which can be found in **/var/log/** and so on.

There we have it, the Linux filesystem in it's entirety. While it may seem confusing at first, there is quite a good bit of useful organization here, and as you continue to use your computer you will realize how little you really need to think about where something might be, as each folder has a pretty distinct purpose. Just remember to not go messing around in places that I mentioned you shouldn't be.

## Third, Getting to Know Bash
Here I will be explaining some simple bash concepts that will help speed you along your terminal journey, knowing these is necessary if you want to truly be efficient on the command line:

### Autocomplete
Bash has built in **tab-complete**, so instead of typing in entire long names of folders and/or programs, you can just type in a few letters and press the `tab` key, Bash will then auto-type the rest of the name for your. If there are multiple possibilities, Bash will just output them all, so you can choose the one you want.

### Global Aliases
`..` is an alias for the parent folder of the directory you are currently working inside, and the word `.` is the alias for the folder currently occupied. These are useful to know as they can save you precious time typing in long directory paths when you are working with more advanced commands. These aliases can be used with just about any command so be careful with them.

`~` is an alias that stands for `/home/username`, with "username" being the user name of the currently active user. It can be used with many commands, so once again, be careful with what you do. If you are ever unsure, just remind yourself that it **directly** translates to `/home/username`, that'll help you get a bearing on the command you are about to run.

`!!` is an alias for the last command run. For example, if you ran a command but forgot to add `sudo` or something, you can simply run `sudo !!` instead of typing out the whole of the previous command.

### Conditional Execution
`&` is a character you can insert after a command and use to spawn command outputs in the background, and `&&` can be used to implement **Conditional Execution**, which means you can run multiple commands in succession, for example:
```sh
# command2 will only run if command1 is successful
[$] command1 && command2
```
You can also do another kind of sequential execution in the command line, using the `||` function, this works in a similar way to `&&` but instead of running a command after the execution of the previous one, it runs a second command only if the first one failed to run, sort of like a "Plan B" if you will. Here is an example:
```sh
# command2 will only run if command1 fails for any reason
[$] command1 || command2
```

### Pipes In Bash
**Pipes** are things you can use to filter one command through another, thus allowing for things like controlling outputs of commands or sending then to different places. Pipes have many uses so I recommend that you look more into them as there is no way I can go into full depth here. Here is an example of a pipe being used to filter the output of of `fc-list` through `grep` to only show fonts with a certain name.

```sh
[$] fc-list | grep Roboto
```

### Sending command outputs to different places
The `>` character works in a similar fashion to pipes, but instead of filtering the command through another, it pushes the output to a file of your choice. The amount of `>`'s you use also makes a difference, for example, this command will print the word "hello" and push it as the first word in a new file called "file.txt":
```sh
[$] echo "hello" > file.txt
```
Using two `>`'s provides a different result, instead of creating a new file containing the outputted words, it will append the output to an existing file that you point it to. A common example of this is when adding a heading to a GitHub README:
```sh
[$] echo "# Heading" >> README.md
```

### Keyboard Shortcuts
Unknown to me for quite a while during my usage of bash was that there were many keyboard shortcuts that could be used to navigate and control text much faster in the command line. These are mostly inherited from some of the keyboard shortcuts in editors like `emacs`, from what I can tell. Here are the ones I find myself using most often:

`ctrl + arrow keys` will move the cursor one word in the respective direction

`ctrl + b/f` will move the cursor backwards and forwards respectively

`ctrl + w` will delete the previous word

`ctrl + h` works the same way as `backspace`

`ctrl + d` will delete the character under the cursor

`ctrl + a` moves the cursor all the way back to the prompt

`ctrl + u` will delete all text entered

`ctrl + r` will initiate a reverse search for previously entered commands

`ctrl + l` will clear everything in the terminal

`ctrl + n/p` will cycle you through previously entered commands

`ctrl + m/j`, both work the same way as `enter`

### Environment Variables
Environment variables are basically just global settings that different programs use to determine user preferences, they look something like this, a variable name followed by a `=` and the environment setting in quotes.
```sh
TERMINAL="alacritty"
```
Environment variables can be set using the `export` command, for example, if I wanted to change my `TERMINAL` variable to `st`, I would use this command:
```sh
[$] export TERMINAL="st"
```
This would set the default terminal used by other programs to `st` instead of whatever I was using before. Many different programs have their own environment variables, though I don't recommend messing with them unless the manual you are reading asks you to do so.

### Shell Aliases

You may or not have noticed a file called `.bashrc` in your Home Directory. This file is the configuration file of the Bash Shell, and can be used to do some cool things, one of which is creating shell aliases. Shell aliases can be used to simplify long and complicated, or even simply hard-to-type commands into smaller ones. To add a shell alias, simply append a line following this syntax to the end of the `.bashrc` file, replacing the placeholder words with a word/command of your choice:
```sh
[$] alias newcommand="long-and-annoying-old-command"
```
Once you've finished this (hopefully using Nano), simply save the file and restart your shell or terminal. Try typing in your new command, you will see that your chosen word behaves the same as that annoying command that you chose to replace.

The possibilities with shell aliases are almost infinite, but for some inspiration, here are some of the ones that I am currently using:
```sh
alias walls="cd ~/usr/pic/wallpapers/"
alias df="df -h /dev/sda3"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias c="clear"
alias class="cd ~/usr/doc/school/"
alias notes="cd ~/usr/doc/school/awo/"
alias t="todo.sh"
alias du="du -m | sort -n"
alias web="cd ~/git/co1ncidence.github.io/mysite/"
alias free="free -h"
alias epub="epy"
alias wset="hsetroot -cover"
alias r="ranger"
alias f="fff"
alias ff="shfm"
alias q="qalc"
alias ls="ls -CF --color=auto --group-directories-first"
alias scdl="scdl -l"
alias volume="amixer set Master"
```
Feel free to use any of them, and don't limit yourself, the possibilities with aliases are almost infinite!

### Various other cool things
You can use the `clear` command to clear everything in your terminal, usually used to give you a fresh working space. It is important to know what `clear` does not change anything regarding your working directory or it's contents, it just clears terminal output.

`set` can be used to temporarily set or unset certain global settings.

`reset` will restart your shell and terminal and make it behave as if you just opened it for the first time.

`sleep` is an especially cool command, it can be used in conjunction with `&&` to essentially but a command on a countdown, for example, running this command will tell your system to wait 1600 seconds before running the next command in the sequence:
```sh
[$] sleep 1600 && clear
```
**Lastly, make sure that you are acquainted with these 2 files, both are located in your home directory:** First, `.bash_history`, which contains the last 2000 commands you ran using bash, allowing you to identify the ones you want easily. Second, `.bashrc`, this is your bash configuration file, which can be used to make many different changes to your shell.

## File Management In The Command Line
You can use the `pwd` command to display what directory you are currently in, this is useful as a beginner to get a better feel of where you are in your system.

`cd` stands for "change directory", you can use this command to enter and leave directories. It is not limited to neighboring directories, however, you can use `cd` to move from one side of your computer to another, provided you don't mess up typing in the names of folders. First thing to note is that a `/` is not necessary after a folder name:
```sh
# these 2 commands are the same
[$] cd ~/folder1/folder2/
[$] cd ~/folder1/folder2
```
You can use the aliases previously mentioned to navigate folders as well.
```sh
# running this moves you to the parent folder
[$] cd ..
# running this does nothing, as you are moving to the same folder
[$] cd .
```
Finally, here are some examples of the `cd` command in use:
```sh
# this will place you in the polybar config folder
[$] cd ~/.config/polybar/
# this will move you to your root directory
[$] cd /
```
Another good thing to know is that running just `cd` will take you back you your home folder:
```sh
# no matter where you run this, it will take you back to home
[$] cd
```

`ls` is one of the commands you will use the most, this command lists all of the files and folders in the current folder, allowing you to get a better idea of where you are. Here is an example of the `ls` command in use:

```sh
[$] ls
etc/  git/  tmp/  usr/  var/
```

`touch` is used (mostly) to create a new, empty file in the folder you are currently occupying, the filetype can vary based on name extension, for example, to create a new `css` file you would run
```sh
[$] touch file.css
```
You can also use touch to create files in other folders:
```sh
[$] touch ~/Documents/file.txt
```

`mkdir` is like `touch`, but instead of creating a single file it creates an entire directory, and like `touch`, this can be used to create a folder anywhere on your system, provided you have the right permissions to do so, here is an example of the `mkdir` command:

```sh
[$] mkdir folder/
```

`mv` is a command used to move files  and folders from one location to another, it can also (indirectly) be used to replace a file with another. It is also possible to change the name of a file when moving it. Example usage:

```sh
[$] mv /usr/share/file.txt ~/Documents/newfile.txt
# mv can also be used to rename files
[$] mv file.txt file2.txt
```

`cp` works the same way as `mv`, but instead of moving a file it creates a copy of the original file in the new location, and like `mv`, the resulting file can have new name. Example usage:
```sh
[$] cp ~/.local/bin/command /usr/bin/command2
# if name is not a concern, just specify resulting directory
[$] cp ~/.local/bin/command /usr/bin
```

You can use `cp` and `mv` with multiple files as well, for example, this is how you would move multiple image files from one folder to another:
```sh
[$] cp 1.png 2.png 3.png ~/Pictures/
```
As you can see, all you have to do is list all the files you would like to copy/move with a space in between them, this will stage them all for transition.

`rm` is another very useful, but dangerous command. It stands for "remove" and can be used to remove any
However, unlike the other file management commands, `rm` cannot remove folders by default, this requires the use of a couple **Flags**, which are just letters/words you can attach to a command to unlock abilities that the command cannot do by default. For `rm` to be able to delete a whole folder, it requires the `-r` and `-f` flags, here is an example:
```sh
[$] rm -r -f folder/
```
Though separating flags is not necessary, you can just combine them into one flag like this:
```sh
[$] rm -rf folder/
# you can also use the "rmdir" command, though only on empty folders
[$] rmdir folder/
```
Thus is how you can use `rm` to remove folders as well as individual files.

### Managing Files in Bulk using "File Globbing"

"File Globbing" is a term used to describe a method of directory management that makes use of many shells' in-built pattern searching capabilities. You can use these features to make it far easier to manage multiple files at the same time.

#### Using `*`, the Wild Card
The `*` symbol, or "Wild Card", represents any string of characters possible, you can use it to easily all contents of a directory for certain actions. For example, running `rm *` inside of a folder will remove every file in that folder, since all of them have names that contain a character that can be represented with `*`. But what if you wanted to be more specific? Say that you have a folder filled with `.png` and `.jpg` image files, and you wanted to only get rid of all the pictures of a certain filetype, here is how you would do it:

```sh
# this will remove any file with the ".jpg" extension
[$] rm *.jpg
# this will remove any file with the ".png" extension
[$] rm *.png
```

This comes in very handy when cleaning out older directories. But it is not only limited to the removal of files, you can use `*` in conjunction with `mv`, `cp`, and just about any other file management command. Here are some more examples:

```sh
# this will copy all files to home dir.
[$] cp * ~/
# this will move all "txt" files to parent dir.
[$] mv *.txt ..
# this will remove all "png" files in your home dir
[$] rm ~/*.png
```

### Elevating Permissions
Sometimes, your user may not have the necessary permissions to execute certain commands on a file or folder, this is because the owner of said file/folder is the **root user**, to obtain the abilities of the root user, you just have to place the word `sudo` behind your command. `sudo` stands for "Super User DO", and will allow you to run commands with elevated (or "root") permissions, here is an example:
```sh
[$] sudo apt install firefox
```
 This command will install `firefox` on your system. You will almost always need root permission to install a package. Root permissions can be very dangerous however, as you can very easily delete something important or break your installation. So it is vital you always make sure you know what you are doing when asked to run a command as root, and be aware that there is a reason that there is a reason for a password to be between you and the execution of this command.

`chmod` is a command that can be used to change the permissions a file or folder has. These permissions include reading, writing, and changing whether a file can be executable or not. You can use `chmod` plus/minus a letter like this: `chmod +x` to add or remove a permission from a file. To view the permissions of all files and folders in your current directory, run the `ls` command with the `-l` flag:

`chown` is like `chmod`, but instead of changing a file or folders permissions, it transfers ownership of that target to a user that you specify.

```sh
[$] ls -l
total 20
drwxr-xr-x 33 co1ncidence co1ncidence 4096 Sep  8 16:58 etc/
drwxr-xr-x  7 co1ncidence co1ncidence 4096 Sep  7 00:08 git/
drwxr-xr-x  3 co1ncidence co1ncidence 4096 Sep  8 18:16 tmp/
drwxr-xr-x  8 co1ncidence co1ncidence 4096 Sep  7 23:46 usr/
drwxr-xr-x 10 co1ncidence co1ncidence 4096 Sep  8 17:06 var/
```

## File Viewing  and Output Control/Filtering
The `cat` command is one of the first to know when viewing files, running `cat` on a file which contains any sort of text will cause your terminal to output the full contents of your file, for example, running:
```sh
[$] cat .bashrc
```
Will show you the contents of your `.bashrc` file, otherwise known as the bash shell configuration file, more about this later. `cat` is very useful when you want to look at certain content in a file but don't want to open it in your editor.
You may realize. Here is an example of the `cat` command being used:

![gif](https://i.postimg.cc/26DM7wqq/out.gif)

However, that `cat` can be annoying when used on longer files, as you have to manually scroll back if you want to view any content near the beginning of the file. This is where another, very useful command comes in. The `less` command is similar to `cat`, but instead of just throwing all of the output at you and leaving you alone to manage it, `less` allows you to view the file in a scrolling window, with the top of the file being the beginning. You can then use the Up and Down arrow keys of J and K to navigate the file as you want. For those of you comfortable with them, Vim keybindings (like `j` and `k`) work in `less` as well. As you can see here, the experience is far more intuitive:

![gif](https://i.postimg.cc/dtxfxvkc/out.gif)

Sometimes, however, we have too much output of a command, one example of such a problematic command can be the `fc-list` command, which lists all fonts currently installed on your system. You can filter the output of this command using `grep`, an extremely powerful search utility. `grep` however, usually requires piping, which I talked about earlier. Here is a basic example of the usage of `grep`:

This command will have hundreds of lines of output, displaying all of your fonts:
```sh
[$] fc-list
```

This command, however, will filter out every result and only show results containing the word "Roboto":
```sh
[$] fc-list | grep Roboto
```
`grep` is not, however, limited to command outputs, it can also be used to filter out the lines of a file that word that you are looking for. For example, running `grep "hello" file.txt` will output all the lines of `file.txt` that contain the word "hello". `grep` has a myriad of flags that can be used to futher increase the usefulness of a command:
  - **B <number>** will show <number> of lines before the lines you searched for along with the results, providing some context
  - **C <number>** does the same thing as **B** but with the context lines being after instead of before
  - **E** will interpret the text you are searching for as a regular expression
  - **i** will search without being case sensitive
  - **l** this works when `grep` is used on a directory, printing out just the files containing the searched word instead of the lines
  - **r** will allow `grep` to search directories recursively, bringing results from subfolders as well
  - **v** inverts `grep`, printing out every line that doesn't contain the searched word

## Editing Files Using GNU Nano
Throughout your Linux journey, there will be many, and I mean many, times where you will have to make a quick edit to some configuration file of some sort. Editing these files with a visual editor can be a pain as you have to run the editor as root, find the file you want to edit, and then finally get to editing it. As a solution to this, computers running any GNU/Linux Distribution usually come with a terminal editor installed, called [Nano](https://en.wikipedia.org/wiki/GNU_nano). Nano is an editor that allows you to edit any text file through the terminal. Here is an example of me editing the `/etc/fstab` file using Nano (note the use of `sudo` to access this file):

![gif](https://i.postimg.cc/RVyPTRyM/out.gif)

Nano has many keyboard shortcuts and is a quite featured editor, though you will most likely only be using it for quick edits, as anything bigger would be better done in a real editor. The only real shortcut to know in Nano is **Ctrl + X**, this saves and exits the file, prompting you before doing so as well.

## Time In The Command Line

The `date` command can be used to quickly display the current date and time on the terminal, while this is cool it doesn't really have much of a use in day to day command line usage, it is more effective in scripts and programs, as a reliable way to get system time. Here is an example of the `date` command in use:

```sh
[$] date
Tue Sep  8 07:05:54 PM CDT 2020
```

This is great output from a readability standpoint, but if you are writing a script, it is not easily parseable, pass the `-Im` flag along with `date` to get more usable output:

```sh
[$] date -Im
2020-09-08T19:06-05:00
```

Another time related command you can use is `uptime`, this command outputs the amount of time the system has been on for, this can be helpful to know for a variety of reasons. By default, the `uptime` command has very messy output, so run it with the `-p` flag to make it more readable, here is an example:

```sh
[$] uptime
19:07:20 up  4:20,  1 user,  load average: 0.52, 0.74, 0.59
[$] uptime -p
up 4 hours, 20 minutes
```

The `time` command can be used to measure how much time another program takes to open up, this can be useful when diagnosing problems regarding system performance issues. Here is an example of the `time` command being used to display the startup time of the `st` Terminal:

```sh
[$] time st
st  0.08s user 0.01s system 7% cpu 1.199 total
```

## Process Management in the Terminal

Processes in Linux are usually given certain `pid`'s, having this form of identification allows them to be easily tracked and managed, mostly this is used to take care of or kill problematic processes. There are 2 commands that can be used to find the `pid` of a program. You can use either `pidof` of `pgrep`. For the purposes of this guide, I will be using the `pgrep` command. Here is an example of me using `pgrep` to find the `pid` of MPV, a program that I know is currently running:

```sh
[$] pgrep mpv
24935
```

Though, while this command is useful in a limited use case, you will most likely find it easier to just use the `pkill` command. `pkill` allows you to kill a process using a variety of signals, 15 to be exact. The only ones that really matter, however, are signals 9 and 15, otherwise known as `SIGKILL` and `SIGTERM` respectively. `SIGTERM` will kill a process off safely and slowly, but sometimes this is not enough, so you can use `SIGKILL` to immediately terminate it, but I recommend trying your best not to resort to that option, as it could cause problems. Different signals can be invoked using **Flags**. `pkill`, however, defaults to using the `SIGTERM` signal, so for 99% of your use cases just using `pkill` serves as enough, as shown in this example:

**Not much to see here, the process either dies or there is an error:**

```sh
[$] pkill alacritty
[$]
```

Another thing to take into account when dealing with running processes is memory usage, you can use the `free` command with the `-h` flag to display the amount of memory currently being used:

```sh
[$] free -h
              total        used        free      shared  buff/cache   available
Mem:          7.7Gi       659Mi       402Mi       523Mi       6.6Gi       6.2Gi
Swap:         7.9Gi       0.0Ki       7.9Gi
```

But what if you wanted to see an interactive interface from which you could manage processes and see their relative resource usage, a "task manager" if you will. One of the programs you will find yourself most frequently using is `htop`, while not normally included with most Linux Distros, it is a must have utility, a lightweight and easy to use terminal task manager. I suggest you check out the program's GitHub page if you want to learn more. For now, however, here is a screenshot of `htop`:

![img](https://i.postimg.cc/RVkRt0Jh/image.png)

## Disk and storage management in the Terminal
To Display all of the disks on your system and all of the storage that has been used on them, use the `df` command with the `-h` flag to make it human readable:

```sh
[$] df -h
Filesystem      Size  Used Avail Use% Mounted on
dev             3.9G     0  3.9G   0% /dev
run             3.9G  1.5M  3.9G   1% /run
/dev/sda3       461G   19G  419G   5% /
tmpfs           3.9G  385M  3.5G  10% /dev/shm
tmpfs           4.0M     0  4.0M   0% /sys/fs/cgroup
tmpfs           3.9G  8.0K  3.9G   1% /tmp
/dev/sda1       512M  280K  512M   1% /boot/efi
tmpfs           785M  120K  785M   1% /run/user/1000
```

If instead, you wanted to view all of the disks and their respective UUID's or other information, use the `lsblk` command with the `-f` flag, which allows displaying the UUID of each disk along with some other information.

```sh
[$] lsblk -f
NAME   FSTYPE FSVER LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINT
sda
├─sda1 vfat   FAT32       FEC4-1212                             511.7M     0% /boot/efi
├─sda2 swap   1           6ba4d0ab-f397-46a7-9a02-e12e3271e70d                [SWAP]
└─sda3 ext4   1.0         eb40edc1-e302-4759-83b3-dadcdea05ef3  418.1G     4% /
```

You can use the `mount` command to mount a disk and access the files inside it. This is useful in recovery situations or when trying to save a computer from a live environment. For example, `sudo mount /dev/sda3` will mount the drive `sda3` for viewing/editing.

`du` can be used to display all directories in a location and the amount of space they use up. This command gets pretty detailed so I suggest that you look more into it yourself to learn.

## Networking on The Command Line

> This section assumes beforehand that you use networkmanager as your internet daemon


If unsure whether you are connected to the Internet, or if you just want to check whether a website will accept packet requests from you, you can use the `ping` command on it's domain and monitor network transfers:
```sh
# this will send continuous requests to google.com
[$] ping google.com
```
You can use the `ping` command on any domain, local or public

If you wanted to connect to an Internet connection from the command line, the easiest way would be to use `nmtui`, a simple and easy to use interface for `networkmanager`, here is an example of me using `nmtui` to disconnect then reconnect to my home's Internet connection:

![gif](https://i.postimg.cc/LXQk84MH/out.gif)

To view your I.P. Address and some other basic network information, run the `ip addr` command. If you need more detailed information about your current connection, use `nmcli`.
