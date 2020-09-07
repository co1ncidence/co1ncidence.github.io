---
title: "Linux and CLI, a 101"
date: 2020-08-15T14:15:28-05:00
tags:
  - Guide
  - Productivity
---

When I first started with Linux, and especially the command line, It was difficult to find a truly optimal and comprehensive guide to these things. While most tutorials were nice and gave me a good starting point, they usually provided inefficient information or didn't showcase the most optimal commands/strategies. I am making this list as more of a dump for all of the things that I have learned about bash so far, which isn't too much compared to some but I like to think that I know something. So without further ado, here is my bash basics list to boost you up in the Linux elitist ladder. And as a final note, unless specified, all of these commands are being run from the default (home) folder that your terminal puts you in.

> Always remember: RTFM: "Read The Fucking Manual"

---

## First, some Terminology and Tips
The Terminal is simply an interface to interact with your computer, by itself, it is nothing but an empty program. A terminal (in 99.99% of cases) needs a **Shell** to function. A shell is an interactive text interface for the user, and the **Terminal** is the tool most often used to run commands via the shell. There are many shells out there, thought this tutorial in specific will be focusing on the most is **Bash**, the most popular shell in use right now and the default shell of most [Linux](https://en.wikipedia.org/wiki/Linux) distributions. Bash allows you to run commands from other programs or utilities, common ones you'll mostly likely need are those from something like the [GNU Coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities), and any other programs you might use daily. Once you have familiarized yourself with these terms, you can get on to actually using the command line. And finally, and most likely **The Most Important Thing You Will Read Here**, you have to always be willing to read documentation and official manuals, don't go around annoying others for help. Some things to do when encountering issues can include:
  - The official manual of the program, accessed by running the man command for that program in the terminal
  - Searching through the GitHub issues of the program you are struggling with to find a similar or identical problem
  - Searching through online forums like [Stack Overflow](https://stackoverflow.com/)
  - Reading Wiki pages on amazing websites like the [ArchWiki](https://wiki.archlinux.org/)
  - Searching [Reddit](https://reddit.com) for similar problems or making a post about your own

**Following these steps will lead you to your solution far more often than not.**

---

## Second, Some Linux Basics
In this section I will be discussing some basics Linux concept, terminology, and tip/tricks that every user should know before they dive deeper into the operating system.

### The Linux File System
In Linux and other UNIX-based operating systems, almost everything is available to the user as a file or folder. This results in your system being essentially just one massive file system. Imagine it this way, your entire Linux install is one huge folder, called `/`, this folder contains everything your system and the programs on it need to function and work together. You can use the `tree` command on the base `/` folder to better visualize this:

![img](https://i.postimg.cc/pdVcT64b/image.png)

This command only shows the biggest, main folders on your system. Each of these is further subdivided into even more different folders and files. Going over the entire filesystem is an extremely daunting task, so I will just give a short briefing on the general purpose of each folder.

`/bin/`: This is a symlink, or symbolic link, to the `/usr/bin` folder, `bin` is short for binary. Binaries are the files that launch various programs on your computer, for example, Firefox will have it's binary here as `/usr/bin/firefox`

`/dev/`: This stands for "Device", and is where all the devices connected to your system have there appropriate files, this can contain drives or peripherals. You will find your hard disks and their partitions labeled as `/dev/sda-z|1-9`

`/etc/`: Originally stood for "etcetera", now this is where all of the global configuration files of all the programs on your system are stored, such as, for example, those used by your init system or display manager

`/home/`: This is where all of the home folders and files of all (normal) users on your system are, it is separated into folders with the usernames of said users, and contains specific files only accessible to said users. Here is where you will be spending around 90% of your time as a Linux user. Home folders usually contain the standard "Documents" or "Pictures" folders and the like, but also contain some important hidden folders, such as:
  - **.cache/**: this is where all of your users program's store their cache files
  - **.config/**: this is where all of your user-specific configuration files are stored
  - **.local/**: this is the same (in terms of function) as the **/usr/** folder but for your current user only
It is important to get to know your home folder well and to keep it nice and tidy, it is basically your main "workspace" on a Linux system

`/lib/ and /lib64`:

---

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
command1 && command2
```
You can also do another kind of sequential execution in the command line, using the `||` function, this works in a similar way to `&&` but instead of running a command after the execution of the previous one, it runs a second command only if the first one failed to run, sort of like a "Plan B" if you will. Here is an example:
```sh
# command2 will only run if command1 fails for any reason
command1 || command2
```

### Pipes In Bash
**Pipes** are things you can use to filter one command through another, thus allowing for things like controlling outputs of commands. Pipes have many uses so I recommend that you look more into them as there is no way I can go into full depth here. Here is an example of a pipe being used to filter the output of of `fc-list` through `grep` to only show fonts with a certain name.
```sh
fc-list | grep Roboto
```

### Sending command outputs to different places
The `>` character works in a similar fashion to pipes, but instead of filtering the command through another, it pushes the output to a file of your choice. The amount of `>`'s you use also makes a difference, for example, this command will print the word "hello" and push it as the first word in a new file called "file.txt":
```sh
echo "hello" > file.txt
```
Using two `>`'s provides a different result, instead of creating a new file containing the outputted words, it will append the output to an existing file that you point it to. A common example of this is when adding a heading to a GitHub README:
```sh
echo "# Heading" >> README.md
```

### Keyboard Shortcuts
Unknown to me for quite a while during my usage of the terminal in Linux was that there were many keyboard shortcuts that could be used to navigate and control text much faster in the command line. These are mostly inherited from some of the keyboard shortcuts in editors like `emacs`, from what I can tell. Here are the ones I find myself using most often:

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
export TERMINAL="st"
```
This would set the default terminal used by other programs to `st` instead of whatever I was using before. Many different programs have their own environment variables, though I don't recommend messing with them unless the manual you are reading asks you to do so.

### Shell Aliases

You may or not have noticed a file called `.bashrc` in your Home Directory. This file is the configuration file of the Bash Shell, and can be used to do some cool things, one of which is creating shell aliases. Shell aliases can be used to simplify long and complicated, or even simply hard-to-type commands into smaller ones. To add a shell alias, simply append a line following this syntax to the end of the `.bashrc` file, replacing the placeholder words with a word/command of your choice:

```sh
alias newcommand="long-and-annoying-old-command"
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
sleep 1600 && clear
```
**Lastly, make sure that you are acquainted with these 2 files, both are located in your home directory:** First, `.bash_history`, which contains the last 2000 commands you ran using bash, allowing you to identify the ones you want easily. Second, `.bashrc`, this is your bash configuration file, which can be used to make many different changes to your shell.

---

## File Management In The Command Line
You can use the `pwd` command to display what directory you are currently in, this is useful as a beginner to get a better feel of where you are in your system.

`cd` stands for "change directory", you can use this command to enter and leave directories. It is not limited to neighboring directories, however, you can use `cd` to move from one side of your computer to another, provided you don't mess up typing in the names of folders. First thing to note is that a `/` is not necessary after a folder name:
```sh
#these 2 commands are the same
cd ~/folder1/folder2/
cd ~/folder1/folder2
```
You can use the aliases previously mentioned to navigate folders as well.
```sh
#running this moves you to the parent folder
cd ..
#running this does nothing, as you are moving to the same folder
cd .
```
Finally, here are some examples of the `cd` command in use:
```sh
#this will place you in the polybar config folder
cd ~/.config/polybar/
#this will move you to your root directory
cd /
```
Another good thing to know is that running just `cd` will take you back you your home folder:
```sh
#no matter where you run this, it will take you back to home
cd
```

`ls` is one of the commands you will use the most, this command lists all of the files and folders in the current folder, allowing you to get a better idea of where you are. Here is an example of the `ls` command in use:

![img](https://i.postimg.cc/KjTJwSkL/image.png)

`touch` is used (mostly) to create a new, empty file in the folder you are currently occupying, the filetype can vary based on name extension, for example, to create a new `css` file you would run
```sh
touch file.css
```
You can also use touch to create files in other folders:
```sh
touch ~/Documents/file.txt
```

`mkdir` is like `touch`, but instead of creating a single file it creates an entire directory, and like `touch`, this can be used to create a folder anywhere on your system, provided you have the right permissions to do so, here is an example of the `mkdir` command:

```sh
mkdir folder/
```

`mv` is a command used to move files from one location to another, and because of this it can also be used to replace a file with another. It is also possible to change the name of a file when moving it. Example usage:

```sh
mv /usr/share/file.txt ~/Documents/newfile.txt
#mv can also be used to rename files
mv file.txt file2.txt
```

`cp` works the same way as `mv`, but instead of moving a file it creates a copy of the original file in the new location, and like `mv`, the resulting file can have new name. Example usage:
```sh
cp ~/.local/bin/command /usr/bin/command2
#if name is not a concern, just specify resulting directory
cp ~/.local/bin/command /usr/bin
```

You can use `cp` and `mv` with multiple files as well, for example, this is how you would move multiple image files from one folder to another:
```sh
cp 1.png 2.png 3.png ~/Pictures/
```
As you can see, all you have to do is list all the files you would like to copy/move with a space in between them, this will stage them all for transition.

`rm` is another very useful, but dangerous command. It stands for "remove" and can be used to remove any
However, unlike the other file management commands, `rm` cannot remove folders by default, this requires the use of a couple **Flags**, which are just letters/words you can attach to a command to unlock abilities that the command cannot do by default. For `rm` to be able to delete a whole folder, it requires the `-r` and `-f` flags, here is an example:
```sh
rm -r -f folder/
```
Though separating flags is not necessary, you can just combine them into one flag like this:
```sh
rm -rf folder/
#you can also use the "rmdir" command, though only on empty folders
rmdir folder/
```
Thus is how you can use `rm` to remove folders as well as individual files.

### Managing Files in Bulk using "File Globbing"

"File Globbing" is a term used to describe a method of directory management that makes use of many shells' in-built pattern searching capabilities. You can use these features to make it far easier to manage multiple files at the same time.

#### Bulk Management Using `*`
The `*` symbol, or asterisk, represents any string of characters possible, you can use it to easily clear directories of all of their contents. For example, running `rm *` inside of a folder will remove every file in that folder, since all of them have names that contain a character that can be represented with `*`. But what if you wanted to be more specific? Say that you have a folder filled with `.png` and `.jpg` image files, and you wanted to only get rid of all the pictures of a certain filetype, here is how you would do it:

```sh
# this will remove any file with the ".jpg" extension
rm *.jpg
# this will remove any file with the ".png" extension
rm *.png
```

This comes in very handy when cleaning out older directories. But it is not only limited to the removal of files, you can use `*` in conjunction with `mv`, `cp`, and just about any other file management command. Here are some more examples:

```sh
# this will copy all files to home dir.
cp * ~/
# this will move all "txt" files to parent dir.
mv *.txt ..
# this will remove all "png" files in your home dir
rm ~/*.png
```

### Elevating Permissions
Sometimes, your user may not have the necessary permissions to execute certain commands on a file or folder, this is because the owner of said file/folder is the **root user**, to obtain the abilities of the root user, you just have to place the word `sudo` behind your command. `sudo` stands for "Super User DO", and will allow you to run commands with elevated (or "root") permissions, here is an example:
```sh
sudo apt install firefox
```
 This command will install `firfox` on your system. You will almost always need root permission to install a package on your system. Root permissions can be very dangerous however, as you can very easily delete everything on your computer. So it is vital to remember that whenever something requires you to be root to run a command, always make sure you know what you are doing, and be aware that there is a reason that there is a reason for a password to be between you and the execution of this command. Stay safe.

`chmod` is a command that can be used to change the permissions a file has. These permissions include reading, writing, and changing whether a file can be executable or not. You can use `chmod` plus/minus a letter like this: `chmod +x` to add or remove a permission from a file. To view the permissions of all files and folders in your current directory, run the `ls` command with the `-l` flag:

![img](https://i.postimg.cc/FstPcR8x/image.png)

---

## File Viewing  and Output Control/Filtering
The `cat` command is one of the first to know when viewing files, running `cat` on a file which contains any sort of text will cause your terminal to output the full contents of your file, for example, running:
```sh
cat .bashrc
```
Will show you the contents of your `.bashrc` file, otherwise known as the bash shell configuration file, more about this later. `cat` is very useful when you want to look at certain content in a file but don't want to open it in your editor.
You may realize. Here is an example of the `cat` command being used:

![gif](https://i.postimg.cc/vmmXM6xG/out.gif)

However, that `cat` can be annoying when used on longer files, as you have to manually scroll back if you want to view any content near the beginning of the file. This is where another, very useful command comes in. The `less` command is similar to `cat`, but instead of just throwing all of the output at you and leaving you alone to manage it, `less` allows you to view the file in a scrolling window, with the top of the file being the beginning. You can then use the Up and Down arrow keys of J and K to navigate the file as you want. For those of you comfortable with them, Vim keybindings work in `less` as well. As you can see here, the experience is far more intuitive:

![gif](https://i.postimg.cc/Gps8kcZk/out.gif)

Sometimes, however, we have too much output of a command, one example of such a problematic command can be the `fc-list` command, which lists all fonts currently installed on your system. You can filter the output of this command using `grep`, an extremely powerful search utility. `grep` however, usually requires piping, which I talked about earlier. Here is a basic example of the usage of `grep`:

This command will have hundreds of lines of output, displaying all of your fonts:
```sh
fc-list
```

This command, however, will filter out every result and only show results containing the word "Roboto":
```sh
fc-list | grep Roboto
```
`grep` is not, however, limited to command outputs, it can also be used to filter out the lines of a file that word that you are looking for. For example, running `grep "hello" file.txt` will output all the lines of `file.txt` that contain the word "hello". `grep` has a myriad of flags that can be used to futher increase the usefulness of a command:
  - **B <number>** will show <number> of lines before the lines you searched for along with the results, providing some context
  - **C <number>** does the same thing as **B** but with the context lines being after instead of before
  - **E** will interpret the text you are searching for as a regular expression
  - **i** will search without being case sensitive
  - **l** this works when `grep` is used on a directory, printing out just the files containing the searched word instead of the lines
  - **r** will allow `grep` to search directories recursively, bringing results from subfolders as well
  - **v** inverts `grep`, printing out every line that doesn't contain the searched word

---

## Editing Files Using GNU Nano
Throughout your Linux journey, there will be many, and I mean many, times where you will have to make a quick edit to some configuration file of some sort. Editing these files with a visual editor can be a pain as you have to run the editor as root, find the file you want to edit, and then finally get to editing it. As a solution to this, computers running any GNU/Linux Distribution usually come with a terminal editor installed, called [Nano](https://en.wikipedia.org/wiki/GNU_nano). Nano is an editor that allows you to edit any text file through the terminal. Here is an example of me editing the `/etc/fstab` file using Nano (note the use of `sudo` to access this file):

![gif](https://i.postimg.cc/NFQKqRL4/out.gif)

Nano has many keyboard shortcuts and is a quite featured editor, though you will most likely only be using it for quick edits, as anything bigger would be better done in a real editor. The only real shortcut to know in Nano is **Ctrl + X**, this saves and exits the file, prompting you before doing so as well.

## Time In The Command Line
The `date` command can be used to quickly display the current date and time on the terminal, while this is cool it doesn't really have much of a use in day to day command line usage, it is more effective in scripts and programs, as a reliable way to get system time. Here is an example of the `date` command in use:

![img](https://i.postimg.cc/kg2BmJMk/image.png)

This is great output from a readability standpoint, but if you are writing a script, it is not easily parseable, pass the `-Im` flag along with `date` to get more usable output:

![img](https://i.postimg.cc/PxjxY1bj/image.png)

Another time related command you can use is `uptime`, this command outputs the amount of time the system has been on for, this can be helpful to know for a variety of reasons. By default, the `uptime` command has very messy output, so run it with the `-p` flag to make it more readable, here is an example:

![img](https://i.postimg.cc/MHZprxr3/image.png)

The `time` command can be used to measure how much time another program takes to open up, this can be useful when diagnosing problems regarding system performance issues. Here is an example of the `time` command being used to display the startup time of the Alacritty Terminal:

![img](https://i.postimg.cc/nVTz9jCy/image.png)

---

## Process Management in the Terminal

Processes in Linux are usually given certain `pid`'s, having this form of identification allows them to be easily tracked and managed, mostly this is used to take care of or kill problematic processes. There are 2 commands that can be used to find the `pid` of a program. You can use either `pidof` of `pgrep`. For the purposes of this guide, I will be using the `pgrep` command. Here is an example of me using `pgrep` to find the `pid` of MPV, a program that I know is currently running:

![img](https://i.postimg.cc/TP8Yvn4D/image.png)

Though, while this command is useful in a limited use case, you will most likely find it easier to just use the `pkill` command. `pkill` allows you to kill a process using a variety of signals, 15 to be exact. The only ones that really matter, however, are signals 9 and 15, otherwise known as `SIGKILL` and `SIGTERM` respectively. `SIGTERM` will kill a process off safely and slowly, but sometimes this is not enough, so you can use `SIGKILL` to immediately terminate it, but I recommend trying your best not to resort to that option, as it could cause problems. Different signals can be invoked using **Flags**. `pkill`, however, defaults to using the `SIGTERM` signal, so for 99% of your use cases just using `pkill` serves as enough, as shown in this example:

**Not much to see here, the process either dies or there is an error:**

![img](https://i.postimg.cc/PxTXPThf/image.png)

Another thing to take into account when dealing with running processes is memory usage, you can use the `free` command with the `-h` flag to display the amount of memory currently being used:

![img](https://i.postimg.cc/90Dvfn4F/image.png)

But what if you wanted to see an interactive interface from which you could manage processes and see their relative resource usage, a "task manager" if you will. One of the programs you will find yourself most frequently using is `htop`, while not normally included with most Linux Distros, it is a must have utility, a lightweight and easy to use terminal task manager. I suggest you check out the program's GitHub page if you want to learn more. For now, however, here is a screenshot of `htop`:

![img](https://i.postimg.cc/zGZ9Jpq8/image.png)

---

## Disk and storage management in the Terminal
To Display all of the disks on your system and all of the storage that has been used on them, use the `df` command with the `-h` flag to make it human readable:

![img](https://i.postimg.cc/XqBzWBhr/image.png)

If instead, you wanted to view all of the disks and their respective UUID's or other information, use the `lsblk` command with the `-f` flag, which allows displaying the UUID of each disk along with some other information.

![img](https://i.postimg.cc/hPTKbXj4/image.png)

You can use the `mount` command to mount a disk and access the files inside it. This is useful in recovery situations or when trying to save a computer from a live environment. For example, `sudo mount /dev/sda3` will mount the drive `sda3` for viewing/editing.

`du` can be used to display all directories in a location and the amount of space they use up. This command gets pretty detailed so I suggest that you look more into it yourself to learn.

## Networking on The Command Line

> This section assumes beforehand that you use networkmanager as your internet daemon


If unsure whether you are connected to the Internet, or if you just want to check whether a website will accept packet requests from you, you can use the `ping` command on it's domain and monitor network transfers:
```sh
#this will send continuous requests to google.com
ping google.com
```
You can use the `ping` command on any domain, local or public

If you wanted to connect to an Internet connection from the command line, the easiest way would be to use `nmtui`, a simple and easy to use interface for `networkmanager`, here is an example of me using `nmtui` to disconnect then reconnect to my home's Internet connection:

![gif](https://i.postimg.cc/3RkTyRVT/out.gif)

To view your I.P. Address and other basic network information, run the `ip addr` command. If you need more detailed information about your current connection, use `nmcli`.
