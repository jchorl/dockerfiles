# Usage:
# docker run -it --rm \
#     -e DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -v /home/j/.Xauthority:/.Xauthority:rw \
#     -e XAUTHORITY=/.Xauthority \
#     -u "$(id -u)":"$(id -g)" \
#     jchorl/flameshot \
#     bash

FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
  flameshot \
  && rm -rf /var/lib/apt/lists/*
