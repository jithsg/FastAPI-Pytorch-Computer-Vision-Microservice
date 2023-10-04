install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:	
	black *.py 

lint:
	pylint --disable=R,C,W1203,W1202 *.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

build:
	docker build -t pytorch-app:latest .
run:
	docker run -d --name pytorch-app -p 8080:8080 pytorch-app:latest

deploy:
	#deploy goes here
		
all: install lint test format deploy