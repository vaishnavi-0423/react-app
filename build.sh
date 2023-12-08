#!/bin/bash

#login into DockerHub:
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

#stopping existing container:
docker stop react
docker rm react

#building a image:
docker build -t react .

#running a container from the created image:
docker run -d -it --name react -p 80:80 react

#pushing the image to dockerhub:
docker tag react $DOCKER_USERNAME/reactapp:latest
docker push $DOCKER_USERNAME/reactapp:latest
