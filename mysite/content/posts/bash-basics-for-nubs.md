---
title: "Linux Terminal Basics for Nubs"
date: 2020-08-15T14:15:28-05:00
tags:
  - Guide
  - Productivity
---

When I first started with Linux, and especially the command line, It was difficult to find a truly optimal and comprehensive guide to these things. While most tutorials were nice and gave me a good starting point, they usually provided inefficient information or didn't showcase the most optimal commands/strategies. I am making this list as more of a dump for all of the things that I have learned about bash so far, which isn't too much compared to some but I like to think that I know something. So without further ado, here is my bash basics list to boost you up in the Linux elitist ladder. And as a final note, unless specified, all of these commands are being run from the default (home) folder that your terminal puts you in.

> Stupid blockquote

## First, some things to note before delving into the command line:
The Terminal is simply an interface to interact with your computer, by itself, it is nothing but an empty program. A terminal (in 99.99% of cases) needs a **Shell** to function. A shell is an interactive text interface for the user, and the **Terminal** is the tool most often used to run commands via the shell. There are many shells out there, thought this tutorial in specific will be focusing on the most is **Bash**, the most popular shell in use right now and the default shell of many UNIX based operating systems, including [MacOS](https://en.wikipedia.org/wiki/MacOS) and many [Linux](https://en.wikipedia.org/wiki/Linux) distributions. Bash allows you to run commands from other programs or utilities, common ones you'll mostly likely need are those from something like the [GNU Coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities), and any other programs you might use daily. Once you have familiarized yourself with these terms, you can get on to actually using the command line. And finally, and most likely **The Most Important Thing You Will Read Here**, you have to always be willing to read documentation and official manuals, don't go around annoying others for help. Some places to look at when encountering issues can include:
  - The official manual of the program, accessed by running the man command for that program in the terminal
  - Searching through the Github issues of the program you are struggling with to find a similar or identical problem
  - Searching through online forums like [Stack Overflow](https://stackoverflow.com/)
  - Reading Wiki pages on amazing websites like the [ArchWiki](https://wiki.archlinux.org/)
  - Searching [Reddit](https://reddit.com) for similar problems or making a post about your own

**Following these steps will lead you to your solution far more often than not.**

## Second, some things I wish I knew when starting off:

This is just a collection of cool tips and tricks that'll help with fully optimizing your command line skills, expect this to be updated frequently as I learn more.

### Cool aliases:
`..` is an alias for the parent folder of the directory you are currently working inside, and the word `.` is the alias for the folder currently occupied. These are useful to know as they can save you precious time typing in long directory paths when you are working with more advanced commands. These aliases can be used with just about any command so be careful with them.

`~` is an alias that stands for `/home/username`, with "username" being the user name of the currently active user. It can be used with many commands, so once again, be careful with what you do. If you are ever unsure, just remind yourself that it **directly** translates to `/home/username`, that'll help you get a bearing on the command you are about to run.


### Conditional execution:

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

### Pipes in bash:
**Pipes** are things you can use to filter one command through another, thus allowing for things like controlling outputs of commands. Pipes have many uses so I recommend that you look more into them as there is no way I can go into full depth here. Here is an example of a pipe being used to filter the output of of `fc-list` through `grep` to only show fonts with a certain name.
```sh
fc-list | grep Roboto
```

## File Management Commands:


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
#this will move you back to home
cd ~/
```

`ls` is one of the commands you will use the most, this command lists all of the files and folders in the current folder, allowing you to get a better idea of where you are. Here is an example of the `ls` command in use:

![gif](https://i.imgur.com/Klpg4s7.gif)

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

`rm` is another very useful, but dangerous command. It stands for "remove" and can be used to remove any
However, unlike the other file management commands, `rm` cannot remove folders by default, this requires the use of a couple **Flags**, which are just letters/words you can attach to a command to unlock abilities that the command cannot do by default. For `rm` to be able to delete a whole folder, it requires the `-r` and `-f` flags, here is an example:
```sh
rm -r -f folder/
```
Though separating flags is not necessary, you can just combine them into one flag like this:
```sh
rm -rf folder/
```
Thus is how you can use `rm` to remove folders as well as individual files.

#### Using the "*" character in file management
You can also use this basic RegEx character to make bulk file movement easier, for example, you can move every `.png` file in a folder somewhere else using the `*` character, for example, this command is doing exactly that:
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

#### Permissions
Sometimes, your user may not have the necessary permissions to execute certain commands on a file or folder, this is because the owner of said file/folder is the **root user**, to obtain the abilities of the root user, you just have to place the word `sudo` behind your command. `sudo` stands for "Super User DO", and will allow you to run commands with elevated permissions, here is an example:
```sh
sudo rm -rf /
```
This command is a great showcase of the dangers of `sudo` as well. If you haven't already realized, this command will wipe every file and folder on your system. So whenever something requires you to be root to run a command, always make sure you know what you are doing, and always remember that there is a reason that there is a reason for a password to be between you and the execution of this command. Stay safe.

## File viewing  and output control/filtering:

The `cat` command is one of the first to know when viewing files, running `cat` on a file which contains any sort of text will cause your terminal to output the full contents of your file, for example, running:
```sh
cat .bashrc
```
Will show you the contents of your `.bashrc` file, otherwise known as the bash shell configuration file, more about this later. `cat` is very useful when you want to look at certain content in a file but don't want to open it in your editor.
You may realize. Here is an example of the `cat` command being used:

![gif](https://i.imgur.com/Nf93ABf.gif)

However, that `cat` can be annoying when used on longer files, as you have to manually scroll back if you want to view any content near the beginning of the file. This is where another, very useful command comes in. The `less` command is similar to `cat`, but instead of just throwing all of the output at you and leaving you alone to manage it, `less` allows you to view the file in a scrolling window, with the top of the file being the beginning. You can then use the Up and Down arrow keys of J and K to navigate the file as you want. For those of you comfortable with them, Vim keybindings work in `less` as well. As you can see here, the experience is far more intuitive:

![gif](https://i.imgur.com/8RmoBjK.gif)

Sometimes, however, we have too much output of a command, one example of such a problematic command can be the `fc-list` command, which lists all fonts currently installed on your system. You can filter the output of this command using `grep`, an extremely powerful search utility. `grep` however, usually requires piping, which I talked about earlier. Here is a basic example of the usage of `grep`:

This command will have hundreds of lines of output, displaying all of your fonts:
```sh
fc-list
```

This command, however, will filter out every result and only show results containing the word "Roboto":
```sh
fc-list | grep Roboto
```

## Editing files in the command line using GNU Nano:

Throughout your Linux journey, there will be many, and I mean many, times where you will have to make a quick edit to some configuration file of some sort. Editing these files with a visual editor can be a pain as you have to run the editor as root, find the file you want to edit, and then finally get to editing it. As a solution to this, computers running any GNU/Linux Distribution usually come with a terminal editor installed, called [Nano](https://en.wikipedia.org/wiki/GNU_nano). Nano is an editor that allows you to edit any text file through the terminal. Here is an example of me editing the `/etc/fstab` file using Nano (notice the use of sudo to access this file):

![gif](https://i.imgur.com/JN1wnz6.gif)

Nano has many keyboard shortcuts and is a quite featured editor, though you will most likely only be using it for quick edits, as anything bigger would be better done in a real editor. The only real shortcut to know in Nano is **Ctrl + X**, this saves and exits the file, prompting you before doing so as well.

#that # Implementations of Time in the command line
