---
title: "Some Cool Shell Scripts I've Found Handy"
date: 2020-09-08T21:12:44-05:00
draft: true
---

> This post will most likely get updated as time goes by

## Vibe:

I had used `mpd` and `ncmpcpp` for my music for a long time now, but decided to switch to `mpv` for the simplicity, and to make things even easier, I wrote this script, which shuffles all of the music files in the chosen directory and plays them in a terminal window, with album art in it's own small, separate window. If you wanted, you could remove the last line entirely and just manually point it to a specific file:

```sh
#!/bin/sh

exec mpv --geometry=200x200+1600+800 \
         --shuffle \
         --x11-name=no-title \
         "$@" \
         -- ~/usr/mus/
```

## Upload (0x0):

Using pastebins was getting tiring and time consuming, so I decided to hop on the 0x0 train with my own script, this one will upload the chosen file to 0x0 using `curl` and then save the output URL to your clipboard, making external hosting extremely fast and easy:

```sh
#!/bin/sh

[ -f "$1" ] && op="cat"
${op:-echo} "${@:-$(cat -)}" \
	| curl -sF file='@-' 'http://0x0.st' \
	| tee /dev/stderr \
	| tr -d '\n'      \
	| xclip -sel clip
```

## Timer:

I got this one from [6gk](https://github.com/6gk), you simply type `timer` then specify an amount of minutes. After the time has passed a notification will appear, alongside a bell sound:

```sh
#!/bin/sh

calc() {
	seconds="$(echo "$1*$2" | bc | sed 's/\..*$//')"
}

case "$1" in
	*h) calc "${1%?}" 3600;;
	*m) calc "${1%?}"   60;;
	*s) seconds="${1%?}"  ;;
	*)  calc "$1"       60;;
esac

echo "timer set for $1 ($seconds) ${2:+- $2}"
{
	sleep "$seconds"

	paplay "/usr/share/sounds/freedesktop/stereo/complete.oga" |: &
	notify-send -u critical "Times Up!" "$2"
} &
```
