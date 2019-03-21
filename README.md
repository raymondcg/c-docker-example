# Using Docker to compile and Run a C application

The purpose of this project is to demonstrate how to utilze docker to compile c source code into an executable. The exeutable can be run inside the container, or run out side of the container.

Based on:
* [Hello World In Docker](http://www.codeguru.com/cpp/cpp/algorithms/using-c-with-docker-engine.html)
* [MakeTutorial](htt://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/)

## TODO 
* [ ] Add way to extract compiled artifact for distribution outside of a container.

## Pre-requisites
* Setup Docker
* Verify Docker works

```bash
docker run hello-world
```

## Instructions

### Build and Run in Container

1. Build Docker Image and compile code (from the project root):

```bash
docker build -t helloworld:v1 .
```

2. Run Docker Image/Application:

```bash
docker run -it --rm --name HelloWorld helloworld:v1
```