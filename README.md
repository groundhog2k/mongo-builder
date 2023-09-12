# mongo-builder

## What is this?

The MongoDB versions >= 4.4.19, MongoDB 5.x and MongoDB 6.x are depending on the [AVX instruction set](https://www.mongodb.com/docs/manual/administration/production-notes/#x86_64) and will not be compatible with older x86/64 and ARMv8 processors.

This project creates a container environment to build MongoDB from scratch for older target environments.

## **Attention**

## **This is for experimental usage only! It is not guarenteed that the compiled code is running stable on all environment conditions.**

## I don't want to do all this by myself (TL;DR)

There is an automatic [mongo build project](https://github.com/groundhog2k/mongo) that produces a read-to-use container image on [Dockerhub](https://hub.docker.com/repository/docker/groundhog2k/mongo/general).

## How to use it?

Start the builder by using docker-in-docker (dind) and the specific MongoDB version - All this can be done with following commands:

```bash
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock groundhog2k/mongo-builder:6-amd64 <version> <image-name>
```

Parameter `<version>` must be set to the MongoDB version to build (f.e. `6.0.9`).
Parameter `<image-name>` is the name of the produced target container image (f.e. `myimage`)

Example:
The following command will create a container image `myregistry/mongodb:6.0.9`:
`docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock groundhog2k/mongo-builder:6-amd64 6.0.9 myregistry/mongodb`

Always use the appropriate builder version for a specific MongoDB! (see table below)

## Which versions are supported by this builder?

| Builder version | MongoDB version |
|---|---|
| 6-amd64 | MongoDB 5.x for x86/64, MongoDB 6.x for x86/64 |
