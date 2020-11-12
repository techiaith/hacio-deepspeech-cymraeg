FROM ubuntu:18.04

RUN apt update \
 && apt install -y python python3 python3-pip python3-dev wget curl vim ffmpeg sox locales \
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

RUN wget https://github.com/techiaith/docker-deepspeech-cy/releases/download/20.09/techiaith_bangor_20.09.pbmm
RUN wget https://github.com/techiaith/docker-deepspeech-cy/releases/download/20.09/techiaith_bangor_transcribe_20.09.scorer

ADD trawsgrifio.sh .
ADD vad_transcriber vad/

