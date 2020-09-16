---
title: "Cool Shell Scripts I've Found Handy"
date: 2020-09-08T21:12:44-05:00
tags:
  - Showcase
---

> This post is very messy and mostly made for testing code blocks.

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

Written by [vizs](https://github.com/vizs), this one will upload the chosen file to 0x0 using `curl` and then save the output URL to your clipboard, making external hosting extremely fast and easy:

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

## VTOG:

Just converts a video to a GIF using FFMPEG:

```sh
#!/bin/sh

ffmpeg \
	-ss 0 \
	-i "$1" \
	-vf "fps=30,scale=1200:-1: \
	     flags=lanczos,split[s0][s1]; \
	     [s0]palettegen[p]; \
	     [s1][p]paletteuse" \
	-loop 0 \
	"$(echo "$1" | grep -o "[^.]*$").gif"
```

## UP:

Minimal uptime script that outputs in `xh` for easy parsing:

```sh
#!/bin/sh

read -r uptime _ < /proc/uptime

up=${uptime%.*}

hours=$(( ( up % 86400 ) / 3600 ))

printf '%s\n' "${hours}h"
```

## Download:

Downloads a video from YouTube using `youtube-dl` in mp3 format, since thumbnail embedding does get buggy sometimes, I have disabled it:

```sh
#!/bin/sh

youtube-dl \
    --config-location ~/etc/youtube-dlg/settings.json \
    -x \
    --audio-format mp3 \
    "$@"
```

## Centerwindow

Taken shamelessly from the [wmutils readme](https://github.com/wmutils/core), this script will center a window, regardless of WM:

```sh
#!/bin/sh

WID=$(pfw)
WW=$(wattr w $WID)
WH=$(wattr h $WID)

ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

wtp $(((SW - WW)/2)) $(((SH - WH)/2)) $WW $WH $WID
```

## DL

Just a curl script that will always work, has a neat little progress bar as well. I mostly made this to avoid having to use curl flags over and again:

```sh
#!/bin/sh

[ "$1" ] || { read -r inp && set "$inp" ; }

usage() {
    >&2 print 'Usage: %s [-m] link <output>\n' "${0##*/}"
    exit 1
}

_dl() {
    curl \
        --disable \
        --ipv4 \
        --location \
        --retry 2 \
        --progress-bar \
        --continue-at - \
        --url "$1" \
        --output "${2:-${1##*/}}"
}

mass_dl() {
    tmp=/tmp/$$
    ${EDITOR:-vi} $tmp
    count=0
    while read -r url name ; do
        count=$((count + 1))
        _dl "$url" "$count-${name:-download.jpg}" &
    done < $tmp
    wait
    rm $tmp
}

main() {
    case ${1#-} in
        h) usage ;;
        m|v) mass_dl ;;
        *) _dl "$@"
    esac
}

main "$@"
```

## EXT

Detects what kind of archive you are pointing it at and extracts it properly, I made this to remove my dependency on GUI file managers:

```sh
#!/bin/sh

usage() {
    >&2 printf '%s\n' "Usage: ${0##*/} [-c copy_path] file"
    exit 1
}

decompress() {
    case ${1##*.} in
        gz|tgz)  gunzip -qdc "$1" ;;
        xz|txz)  xz -qdcT 0 "$1"  ;;
        bz2|tbz) bunzip2 -qdc "$1" ;;
    esac
}

run() {
    case $1 in
        *tar.*|*.tgz|*.txz|*.tbz)
            decompress "$1" | \
            tar -C "${COPY_PATH:-$PWD}" -xpf -
            ;;
        *.xz|*.gz|*.bz2)
            decompress "$1" "${COPY_PATH:-$PWD}/${1%.*}"
            ;;
        *.zip)
            unzip -q "$1" -d "$2"
            ;;
        *.rar)
            unrar x "$1"
            ;;
        *.7z)
            7z x "$1"
            ;;
        *)
            >&2 echo "Unrecognized compression format: ${1##*.}"
    esac
}

while [ "$1" ] ; do
    case $1 in
        -h|h)
            usage
            ;;
        -C|-c)
            COPY_PATH=$1
            ;;
        *)
            run "$@"
    esac
    shift
done
```

