# Usage:
#
# KEY=$(xauth list | grep $(hostname) | awk '{ print $3 }' | head -n 1)
# DCK_HOST=docker-flameshot
# xauth add $DCK_HOST/unix:0 . $KEY

# docker run -it --rm \
#     --privileged \
#     -e DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -v /home/j/.Xauthority:/root/.Xauthority:ro \
#     -e XAUTHORITY=/root/.Xauthority \
#     -h $DCK_HOST \
#     jchorl/flameshot \
#     flameshot

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  flameshot \
  && rm -rf /var/lib/apt/lists/*
