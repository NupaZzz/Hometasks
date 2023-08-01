#!/bin/bash

docker build -t docker .
docker run -p 8080:80 docker
