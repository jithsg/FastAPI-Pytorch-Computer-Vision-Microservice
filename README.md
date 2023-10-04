# pytorch-app
[![Python Application Test with Github Actions](https://github.com/jithsg/FastAPI-Pytorch-Microservice/actions/workflows/main.yml/badge.svg)](https://github.com/jithsg/FastAPI-Pytorch-Microservice/actions/workflows/main.yml)
FastAPI Image Classification with DenseNet121 and GitHub Actions Deployment
FastAPI Application Overview
This application serves a pre-trained DenseNet121 model using FastAPI to classify images based on the ImageNet dataset.

# Requirements

  Python 3.7+
  FastAPI
  Uvicorn
  Torchvision
  Pillow
  
Setup & Installation
  Clone the repository:
    git clone <repository-url>
    cd <repository-directory>
    
Install the required packages:
  pip install fastapi[all] uvicorn torchvision pillow
Download the imagenet_class_index.json and place it in the root directory of the application. This file contains the mapping of class indices to their respective labels.

Run the FastAPI application:
  uvicorn <filename>:app --host 0.0.0.0 --port 8080
  Replace <filename> with the name of your script, if different.

Open a web browser and navigate to http://0.0.0.0:8080/. You should see a message: "Hello World".

To classify an image, make a POST request to http://0.0.0.0:8080/predict with your image file. The response will contain the class ID and the class name.

Endpoints
  GET /: Returns a welcome message.
  POST /predict: Accepts an image file and returns the predicted class ID and class name.
  GitHub Actions and AWS Deployment
  This repository uses GitHub Actions for continuous integration and deployment to AWS.

Prerequisites
  A GitHub repository with your Python application.
  AWS account with access and secret keys.
  Properly set up make commands in a Makefile for installing dependencies, formatting code, linting, and deployment.
  Setting Up
  GitHub Secrets: Store your AWS credentials securely in GitHub Secrets. Navigate to your repository > Settings > Secrets and add the following secrets:
  
  AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY
Makefile: Ensure that your project has a Makefile with the following commands:

install: For installing all the project's dependencies.
format: For formatting the Python code.
lint: For linting the Python code.
container-lint: For linting the container setup, if you're using a containerized application.
deploy: For deploying your application to AWS.
Workflow
The workflow is defined in .github/workflows/<workflow-file>.yml. It will:

Checkout the latest code from the main branch.
Setup Python 3.10.8.
Install the project dependencies.
Format the code to ensure it adheres to coding standards.
Lint the code to find and report on code quality issues.
Lint the container, if applicable.
Configure AWS credentials using the secrets you've added to your repository.
Deploy the application to AWS.
Contributing
Feel free to fork this repository, create a feature branch, and submit a pull request if you'd like to contribute.

Troubleshooting
If the GitHub Actions workflow fails at any step, check the logs for detailed error messages.
Ensure that your AWS credentials are correct and have the necessary permissions for deployment.
