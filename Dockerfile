FROM ubuntu:22.04
RUN apt update && apt install git build-essential python3-dev libssl-dev python-dev-is-python3 libcurl4-openssl-dev libcurl4 liblzma-dev pip -y
COPY *.sh /
