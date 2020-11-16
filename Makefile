
build:
	docker build --rm -t techiaith/hacio-deepspeech .

run:
	docker run --name hacio-deepspeech --restart=always \
		-it \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$DISPLAY \
		--device /dev/snd \
		techiaith/hacio-deepspeech bash

stop:
	-docker stop hacio-deepspeech
	-docker rm hacio-deepspeech

clean:
	-docker rmi techiaith/hacio-deepspeech
