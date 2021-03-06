FROM ubuntu:18.04

RUN apt update \
 && apt install -y python python3 python3-pip python3-dev wget curl vim ffmpeg sox alsa-utils locales \
 && pip3 install --upgrade pip

# Set the locale
RUN locale-gen cy_GB.UTF-8
ENV LANG cy_GB.UTF-8
ENV LANGUAGE cy_GB:en
ENV LC_ALL cy_GB.UTF-8

#
RUN pip3 install deepspeech==0.8.2 webrtcvad

# gosod YouTube downloader
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl \
 && chmod a+rx /usr/local/bin/youtube-dl


RUN mkdir -p /deepspeech/vad
WORKDIR /deepspeech

# llwytho lawr modelau DeepSpeech Cymraeg techiaith...
RUN wget https://github.com/techiaith/docker-deepspeech-cy/releases/download/20.09/techiaith_bangor_20.09.pbmm
RUN wget https://github.com/techiaith/docker-deepspeech-cy/releases/download/20.09/techiaith_bangor_transcribe_20.09.scorer

# ffeil sain byr ar gyfer profi...
RUN wget https://raw.githubusercontent.com/techiaith/trawsgrifiwr-windows/master/TranscriberConsole/speech.wav

ADD *.sh .
ADD *.py .
ADD speech.wav .
ADD vad_transcriber vad/

