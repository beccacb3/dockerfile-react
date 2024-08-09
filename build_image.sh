
#!/bin/bash
image_name=$1
tag=$2

echo "Building Docker Image"
docker build -t $image_name:$tag .
#verify image is running
docker images

echo "Uploading to Dockerhub"
curl -s https://registry.hub.docker.com/v1/repositories/$user/$image/$tag | jq -r '.[].name' | sort -r