docker build -t word-cloud-generator -f Dockerfile.multi .
docker run --rm -d  word-cloud-generator:latest 
