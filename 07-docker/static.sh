#!/bin/bash

docker run -d -p 8081:80 -v $(pwd)/index.html:/var/www/html/index.html docker