---
title: Pchords
author: Marcin Klimek
type: page
date: 2018-06-04T09:32:22+00:00
ShowToc: false
---
## Motivation

I need to improve playing chords on the piano. So I decided to write a simple tool to help me with this.

## The world in brief
The initial version was just a console app. Then, I wrote a simple GUI.

What I have now:
* generation of major, minor and dominant chords (half-diminished and altered soon)
* the randomly chosen chord has to be played starting from the third or the seventh (major/minor) without root
* played notes (read through midi) are compared with the generated ones 

## Current GUI

![it looks like this](https://github.com/marcinklimek/pchords/raw/master/docs/screen_01.jpg?raw=true)

## Usefull links:

* [pychord](https://github.com/yuma-m/pychord)
* [mido](https://github.com/mido/mido)
* [howto py2app](https://www.metachris.com/2015/11/create-standalone-mac-os-x-applications-with-python-and-py2app/)
* [pyinstaller](https://pyinstaller.org/)

https://github.com/marcinklimek/pchords 
