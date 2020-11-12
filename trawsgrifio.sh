#!/bin/bash
set -xe
youtube-dl --extract-audio https://www.youtube.com/watch?v=OpiwHxPPqRI
ffmpeg -i *.opus -vn -acodec pcm_s16le -ar 16000 -ac 1 sain.wav
time python3 vad/audioTranscript_cmd.py --aggressive 2 --audio /deepspeech/sain.wav --model /deepspeech
