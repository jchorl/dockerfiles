FROM ubuntu:20.04

RUN apt-get update && apt-get install -y transmission-cli
WORKDIR /Downloads

ADD settings.json $HOME/.config/transmission/settings.json

ENTRYPOINT ["transmission-cli", "-w", "/Downloads"]
