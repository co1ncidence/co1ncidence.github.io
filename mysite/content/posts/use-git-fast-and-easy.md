---
title: "Making Git Pushes Less Annoying"
date: 2020-09-06T18:57:05-05:00
---

For a long time now I've been quite annoyed by how much of a pain it can be to
do simple things with git. Even changes to your own repositories can take a
while with all of the adding and committing and then typing in your
credentials. Thankfully though, I have found ways to make git almost trivial to
use, now I barely have to enter more than one command for most tasks, here is
how I did it:

<!--more-->

## Make A Push Script

Normally when you push a newly modified repository, you would need to do 3 or 4
different commands, I've found it much easier to just make a shell script like
this and then place it in my `$PATH` for easy usage:

```sh
#!/bin/sh

[ -z "$1" ] && \
    msg="docs:update" || \
    msg="$1"

git add .
git commit -m "${msg}"
git push origin master
```

This script will stage all of the files in your current git directory for a
commit, and use whatever argument you pass after it as the commit message. If
you don't give any message to the script, it will use `docs:update` and push
with that.

## Make Git Stop Asking For Usernames/Passwords

Another annoying thing that occurs when pushing repositories is that git always
asks you for your username and password, which can get very tedious after a
while. Fortunately, `git config` has a built in system to override this. First,
you have to set your default github url to that of your username with this
command, just replace `<username>` with your git username:

```sh
git config --global url."https://<username>@github.com".insteadOf "https://github.com"
```

This will make git remember who you are and not ask for your username anymore.
Now for your password, there is no real way to *never type your password*, but
you can extend the sudo-like wait period that git has with this command:

```sh
git config --global credential.helper 'cache --timeout=28800'
```

This will make git not ask for your password again for 28,800 seconds, which is
roughly 8 hours. You can, of course, adjust this time to suit your needs. After
all of this is done, your git config file, usually `~/.gitconfig` will look
something like this:

```toml
[user]
    email = "r3yan.chaudhry@zohomail.com"
    name = "co1ncidence"
  [url "https://co1ncidence@github.com"]
    insteadOf = "https://github.com"
  [credential]
    helper = "cache --timeout=28800"
```
**There you go! This will hopefully make a lot of your smaller tasks with git a great deal easier.**
