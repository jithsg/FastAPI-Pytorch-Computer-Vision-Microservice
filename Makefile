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
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 185183796631.dkr.ecr.us-east-1.amazonaws.com
	docker build -t app-pytorch .
	docker tag app-pytorch:latest 185183796631.dkr.ecr.us-east-1.amazonaws.com/app-pytorch:latest
	docker push 185183796631.dkr.ecr.us-east-1.amazonaws.com/app-pytorch:latest
		
all: install format lint deploy