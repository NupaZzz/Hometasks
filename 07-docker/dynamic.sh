#!/bin/bash

docker build -t docker .
docker run -d -p 8080:80 docker
