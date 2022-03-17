build:
	docker build . -t ascii

run: build
	docker run -p 8080:80 -it ascii
