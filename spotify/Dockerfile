# docker run -ti -d \
#     -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
#     -v /dev/shm:/dev/shm \
#     -v /run/user/1000/pulse:/run/user/1000/pulse:ro \
#     -e DISPLAY=$DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -v spotifyhome:/home/spotify \
#     -l spotify \
#     --name spotify \
#     jchorl/spotify

FROM ubuntu:19.04
LABEL maintainer "Josh Chorlton <josh@joshchorlton.com>"

RUN apt-get update && apt-get install -y gnupg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 && \
    echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list && \
    apt-get update && \
    apt-get install -y pulseaudio dbus-x11 spotify-client

ENV uid 1000
ENV gid 1000

# creates a spotify user
RUN mkdir -p /home/spotify && \
    echo "spotify:x:${uid}:${gid}:spotify,,,:/home/spotify:/bin/bash" >> /etc/passwd && \
    echo "spotify:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "spotify ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/spotify && \
    chmod 0440 /etc/sudoers.d/spotify && \
    chown ${uid}:${gid} -R /home/spotify

USER spotify
WORKDIR /home/spotify

CMD ["dbus-launch", "--exit-with-session", "spotify"]
