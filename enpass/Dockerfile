# docker run -ti \
#     -e DISPLAY=$DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -l enpass \
#     --name enpass \
#     jchorl/enpass

FROM ubuntu
LABEL maintainer "Josh Chorlton <josh@joshchorlton.com>"

RUN apt-get update && \
    apt-get install -y wget libglib2.0 libgl1-mesa-dev libpulse0 libxss1 lsof libxrender-dev libxi-dev libsm-dev libfreetype6 libfontconfig libegl1-mesa && \
    echo "deb http://repo.sinew.in/ stable main" > /etc/apt/sources.list.d/enpass.list && \
    wget -O - https://dl.sinew.in/keys/enpass-linux.key | apt-key add - && \
    apt-get update && \
    apt-get install -y enpass

ENV uid 1000
ENV gid 1000

# creates a enpass user
RUN mkdir -p /home/enpass && \
    echo "enpass:x:${uid}:${gid}:enpass,,,:/home/enpass:/bin/bash" >> /etc/passwd && \
    echo "enpass:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "enpass ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/enpass && \
    chmod 0440 /etc/sudoers.d/enpass && \
    chown ${uid}:${gid} -R /home/enpass

USER enpass
WORKDIR /home/enpass

CMD /opt/Enpass/bin/runenpass.sh
