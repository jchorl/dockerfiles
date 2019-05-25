# docker run -ti \
#     -v /dev/shm:/dev/shm \
#     -e DISPLAY=$DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     --name sigil \
#     jchorl/sigil

FROM debian:stretch
LABEL maintainer "Josh Chorlton <josh@joshchorlton.com>"

RUN apt-get update && apt-get install -y sigil \
    python3-tk # for https://github.com/dougmassay/kindleimport-sigil-plugin

ENV uid 1000
ENV gid 1000

# creates a sigil user
RUN mkdir -p /home/sigil && \
    echo "sigil:x:${uid}:${gid}:sigil,,,:/home/sigil:/bin/bash" >> /etc/passwd && \
    echo "sigil:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "sigil ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sigil && \
    chmod 0440 /etc/sudoers.d/sigil && \
    chown ${uid}:${gid} -R /home/sigil

USER sigil
WORKDIR /home/sigil

ADD KindleImport_v0.80.9.zip . # for https://github.com/dougmassay/kindleimport-sigil-plugin

ENTRYPOINT [ "sigil" ]
