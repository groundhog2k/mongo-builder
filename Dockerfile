FROM ubuntu:22.04
RUN apt update && apt install git build-essential python3-dev libssl-dev libcurl4-openssl-dev python-dev-is-python3 libcurl4 liblzma-dev pip docker.io -y
COPY *.sh /
ENTRYPOINT [ "./build.sh" ]
