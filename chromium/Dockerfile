# Run Chromium in a container
#
# docker run -it --rm \
#   -u 1000:1000 \
#   --privileged \
#   --net host \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=$DISPLAY \
#   --device /dev/snd \
#   -v /dev/shm:/dev/shm \
#   --device /dev/snd \
#   --device /dev/dri \
#   --name chromium \
#   jchorl/chromium

# Base docker image
FROM debian:buster

# Install Chromium
RUN apt-get update && apt-get install -y \
      chromium \
      chromium-l10n \
      fonts-liberation \
      fonts-roboto \
      hicolor-icon-theme \
      libcanberra-gtk-module \
      libexif-dev \
      libgl1-mesa-dri \
      libgl1-mesa-glx \
      libpango1.0-0 \
      libv4l-0 \
      fonts-symbola \
    && mkdir -p /etc/chromium.d/

ENV uid 1000
ENV gid 1000

# creates a chromium user
RUN mkdir -p /home/chromium && \
    echo "chromium:x:${uid}:${gid}:chromium,,,:/home/chromium:/bin/bash" >> /etc/passwd && \
    echo "chromium:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "chromium ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/chromium && \
    chmod 0440 /etc/sudoers.d/chromium && \
    chown ${uid}:${gid} -R /home/chromium

# Run as non privileged user
USER chromium

ENTRYPOINT [ "/usr/bin/chromium" ]
CMD [ "--user-data-dir=/data --no-sandbox" ]
