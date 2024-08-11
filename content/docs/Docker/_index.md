---
# Title, summary, and page position.
linktitle: Docker
weight: 500
#icon: book
icon_pack: fas

# Page metadata.
title: Docker
date: '2024-02-02T00:00:00Z'
type: book # Do not modify.
---

## Using JR via Docker

Latest docker images are here:
`jrndio/jr:latest`

or here:
`ghcr.io/jrnd-io/jr:latest`

###  JR docker examples

```
docker run -it jrndio/jr:latest jr run net_device
```

```
docker run -it -v $(pwd)/configs:/home/jr-user/configs --rm jrndio/jr:latest jr run net_device -n 5 -f 500ms -o kafka -t net_device -F /home/jr/configs/kafka.client.properties -s --serializer json-schema --registryConfig /home/jr/configs/registry.client.properties
```
![docker](https://user-images.githubusercontent.com/89472/230502463-cb6faaf8-fcf1-48c4-a571-031d46725cc1.gif)

## How to build yor own image

Images are based on Red Hat Universal Base Image 9 Micro.

From the jr code directory, just use docker build to build for the architecture of the machine you are using.
```bash
# build for your arch 
docker build --file Dockerfile .
```

### How to build yor own Multi-Arch image

You can also build multiarch images, in this case for both amd64 and arm64

To create it:
```bash
# Create the local builder
docker buildx create --name local --bootstrap --use

# Push on DockerHub 
docker buildx build --platform linux/arm64/v8,linux/amd64  --build-arg=USER="$(whoami)" --build-arg=VERSION="0.3.0"  --build-arg=TIME="$(date)" --push -t YOURDOCKERHUBUSER/jr:latest .
```

To update it:
```bash
# Use the previously created local builder
docker buildx use local

# Push on DockerHub
docker buildx build --platform linux/arm64/v8,linux/amd64  --build-arg=USER="$(whoami)" --build-arg=VERSION="0.3.0"  --build-arg=TIME="$(date)" --push -t YOURDOCKERHUBUSER/jr:latest .
```
