# mongo-builder

## What is this?

The MongoDB versions >= 4.4.19, MongoDB 5.x and MongoDB 6.x are depending on the [AVX instruction set](https://www.mongodb.com/docs/manual/administration/production-notes/#x86_64) and will not be compatible with older x86/64 and ARMv8 processors.

This project creates a container environment to build MongoDB from scratch for older target environments.

## **Attention**

## **This is for experimental usage only! It is not guarenteed that the compiled code is running stable on all environment conditions.**

## I don't want to do all this by myself (TL;DR)

There is an automatic [mongo build project](https://github.com/groundhog2k/mongo) that produces a read-to-use container image on [Dockerhub](https://hub.docker.com/repository/docker/groundhog2k/mongo/general).

## How to use it?

Create a output directory that will take the build output (mongod/mongos) at the end of the build process.
Start the build process for a specific MongoDB version and mount the build output directory into the container.

All this can be done with following commands:

```bash
mkdir -p ./buildoutput
docker run --rm -v ${PWD}/buildoutput:/buildoutput groundhog2k/mongo-builder:5-amd64 /bin/bash "-c" "./build.sh $MONGO_VERSION"
```

The variable `MONGO_VERSION` must be set to the MongoDB version to build (f.e. `5.0.15`).
Always use the appropriate builder version for a specific MongoDB! (see table below)

After build was successfully finished the output can be copied into a new MongoDB container image with following Dockerfile and bash script:

```bash
cat <<EOF | tee ./Dockerfile
ARG MONGO_VERSION
FROM mongo:$MONGO_VERSION-focal
COPY buildoutput/ /usr/bin
EOF
docker build . -t custom/mongo:$MONGO_VERSION --build-arg MONGO_VERSION=$MONGO_VERSION
```

## Which versions are supported by this builder?

| Builder version | MongoDB version |
|---|---|
| 5-amd64 | MongoDB 5.x for x86/64 |
