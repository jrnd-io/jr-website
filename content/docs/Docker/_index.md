---
# Title, summary, and page position.
linktitle: Docker
summary: Using docker images
weight: 4
#icon: book
icon_pack: fas

# Page metadata.
title: Docker
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

## Docker build

From the jr code directory, just use docker build to build for the architecture of the machine you are using.
```bash
# build for your arch 
docker build .
```

### Multi-Arch Build

You can also build multiarch images, in this case for both amd64 and arm64

```bash
# Create the local builder 
docker buildx create --name local --bootstrap --use
# Local build 
docker buildx build --platform linux/arm64/v8,linux/amd64 --output=local -t jr:latest .
# Push on DockerHub
docker buildx build --platform linux/arm64/v8,linux/amd64  --build-arg=USER="$(whoami)" --build-arg="0.1.0"  --push -t ugol/jr:latest .
```

### How to use jr with local configurations

It is possible to mount config files from your local environment and use them with jr docker image.

```
docker run -it -v $(pwd)/configs:/home/jr-user/configs --rm ugol/jr:latest jr run net_device -n 5 -f 500ms -o kafka -t net_device -F /home/jr-user/configs/kafka.client.properties -s --serializer json-schema --registryConfig /home/jr-user/configs/registry.client.properties
```
![docker](https://user-images.githubusercontent.com/89472/230502463-cb6faaf8-fcf1-48c4-a571-031d46725cc1.gif)
