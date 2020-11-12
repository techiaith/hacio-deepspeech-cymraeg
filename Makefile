
build:
	docker build --rm -t techiaith/hacio-deepspeech .

run:
	docker run --name hacio-deepspeech --restart=always \
		-it techiaith/hacio-deepspeech bash

stop:
	-docker stop hacio-deepspeech
	-docker rm hacio-deepspeech

clean:
	-docker rmi techiaith/hacio-deepspeech
