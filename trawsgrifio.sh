#!/bin/bash
set -xe
youtube-dl --extract-audio https://www.youtube.com/watch?v=OpiwHxPPqRI
ffmpeg -i *.opus -vn -acodec pcm_s16le -ar 16000 -ac 1 sain.wav
time deepspeech --model techiaith_bangor_20.09.pbmm --scorer techiaith_bangor_transcribe_20.09.scorer --audio sain.wav
