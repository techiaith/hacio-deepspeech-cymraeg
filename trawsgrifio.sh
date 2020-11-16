#!/bin/bash
set -xe
youtube-dl --extract-audio https://www.youtube.com/watch?v=OpiwHxPPqRI
ffmpeg -i *.opus -vn -acodec pcm_s16le -ar 16000 -ac 1 sain.wav
aplay sain.wav &
python3 ffrwd.py
