---
title: "Linux Terminal Basics for Nubs"
date: 2020-08-15T14:15:28-05:00
tags:
  - Guide
  - Productivity
---

> I either find peace in the terminal or I find another friggin' error

When I first started with Linux, and especially the command line, It was difficult to find a truly optimal and comprehensive guide to these things. While most tutorials were nice and gave me a good starting point, they usually provided inefficient information or didn't showcase the most optimal commands/strategies. I am making this list as more of a dump for all of the things that I have learned about bash so far, which isn't too much compared to some but I like to think that I know something. So without further ado, here is my bash basics list to boost you up in the Linux elitist ladder. And as a final note, unless specified, these commands are being run from default (home) folder that your terminal puts you in.

## First, some things that you have to know before delving into the command line.
The Terminal is simply an interface to interact with your computer, by itself, it is nothing but an empty program. A terminal (in 99.99% of cases) needs a **Shell** to function. A shell is an interactive text interface for the user, and the **Terminal** is the tool most often used to run commands via the shell. There are many shells out there, thought this tutorial in specific will be focusing on the most is **Bash**, the most popular shell in use right now and the default shell of many UNIX based operating systems, including [MacOS](https://en.wikipedia.org/wiki/MacOS) and many [Linux](https://en.wikipedia.org/wiki/Linux) distributions. Bash allows you to run commands from other programs or utilities, common ones you'll mostly likely need are those from something like the [GNU Coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities), and any other programs you might use daily. Once you have familiarized yourself with these terms, you can get on to actually using the command line. And finally, and most likely **The Most Important Thing You Will Read Here**, you have to always be willing to read documentation and official manuals, don't go around annoying others for help. Places to look for when encountering issues can include:
  - The official manual of the program, accessed by running the man command for that program in the terminal
  - Searching through the Github issues of the program you are struggling with to find a similar or identical problem
  - Searching through online forums like [Stack Overflow](https://stackoverflow.com/)
  - Reading Wiki pages on amazing websites like the [ArchWiki](https://wiki.archlinux.org/)
  - Searching [Reddit](https://reddit.com) for similar problems or making a post about your own
Following these steps will lead you to your solution far more often than not.

## Second, some things I really wish I knew when starting off 


### Cool aliases
`..` is an alias for the parent folder of the directory you are currently working inside, and the word `.` is the alias for the folder currently occupied. These are useful to know as they can save you precious time typing in long directory paths when you are working with more advanced commands. These aliases can be used with just about any command so be careful with them.

`~` is an alias that stands for `/home/username`, with "username" being the user name of the currently active user. It can be used with many commands, so once again, be careful with what you do. If you are ever unsure, just remind yourself that it **directly** translates to `/home/username`, that'll help you get a bearing on the command you are about to run.


### Conditional execution

`&` is a character you can insert after a command and use to spawn command outputs in the background, and `&&` can be used to implement **Conditional Execution**, which means you can run multiple commands in succession, for example:
```sh
#command2 will only run if command1 has finished executing
command1 && command2
```
You can also do another kind of sequential execution in the command line, using the `||` function, this works in a similar way to `&&` but instead of running a command after the execution of the previous one, it runs a second command only if the first one failed to run, sort of like a "Plan B" if you will. Here is an example:
```sh
#command2 will only run if command1 fails for any reason
command1 || command2
```

## File Management Commands


`cd` stands for "change directory", you can use this command to enter and leave directories. It is not limited to neighboring directories, however, you can use `cd` to move from one side of your computer to another, provided you don't mess up typing in the names of folders. First thing to note is that a `/` is not necessary after a folder name:
```sh
#these 2 commands are the same
cd ~/folder1/folder2/
cd ~/folder1/folder2
```
You can use aliases previously mentioned before to navigate folders as well.
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
#this will move you back to home
cd ~/
```

`touch` is used (mostly) to create a new, empty file in the folder you are currently occupying, the filetype can vary based on name extension, for example, to create a new `css` file you would run
```sh
touch file.css
```
You can also use touch to create files in other folders:
```sh
touch ~/Documents/file.txt
```
while `touch` is a cool command, it can sometimes be a pain to type, so another alternative can be just to type `:>` instead, as it serves the same purpose:
```sh
#creates a new css file
:> newfile.css
```

`mv` is a command used to move files from one location to another, and because of this it can also be used to replace a file with another. It is also possible to change the name of a file when moving it .Example usage:
```sh
mv /usr/share/file.txt ~/Documents/newfile.txt
#mv can also be used to rename files
mv file.txt file2.txt
```

`cp` works the same way as `mv`, but instead of moving a file it creates a copy of the original file in the new location, and like `mv`, the resulting file can have  new name. Example usage:
```sh
cp ~/.local/bin/command /usr/bin/command2
#if name is not a concern, just specify resulting directory
cp ~/.local/bin/command /usr/bin
```

`rm` is another very useful, but dangerous command. It stands for "remove" and can be used to remove any 

#### Using the "*" character in file management
You can also use this basic RegEx character to make bulk file movement easier, for example, you can move every `.png` file in a folder somewhere else using the `*` character, for example, this command is moving every `.png` file from one folder to another. 
```sh
mv *.png ~/Pictures/stuff/
#once again, this is not limited to the current location
mv ~/usr/share/backgrounds/*.png ~/Pictures/stuff/
```
You can also pair `*` with `rm`, this can be very dangerous so make sure you are careful. Example
```sh
#this removes all png files in folder
rm *.png
```
However, unlike the other file management commands, `rm` cannot remove folders by default, this requires the use of a couple **Flags**, which are just letters/words you can attach to a command to unlock abilities that the command cannot do by default. For `rm` to be able to delete a whole folder, it requires the `-r` and `-f` flags, here is an example:
```sh
rm -r -f folder/
```
Though separating flags is not necessary, you can just combine them into one flag like this:
```sh
rm -rf folder/
```
Thus is how you can use `rm` to remove folders as well as individual files.

#### Permissions
Sometimes, your user may not have the necessary permissions to execute certain commands on a file or folder, this is because the owner of said file/folder is the **root user**, to obtain the abilities of the root user, you just have to place the word `sudo` behind your command. `sudo` stands for "Super User DO", and will allow you to run commands with elevated permissions, here is an example:
```sh
sudo rm -rf /
```
This command is a great showcase of the dangers of `sudo` as well. If you haven't already realized, this command will wipe every file and folder on your system. So whenever something requires you to be root to run a command, always make sure you know what you are doing, and always remember that there is a reason that there is a reason for a password to be between you and the execution of this command. Stay safe.

## Disk Management and Informational Commands

