# docker run -d \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -v /etc/machine-id:/etc/machine-id:ro \
#     -v /usr/share/X11/xkb:/usr/share/X11/xkb/:ro \
#     -v /home/j/Documents/passwords:/home/kp \
#     -e DISPLAY=$DISPLAY \
#     -l keepassxc \
#     --name keepassxc \
#     jchorl/keepassxc

FROM alpine:latest
LABEL maintainer "Josh Chorlton <josh@joshchorlton.com>"

ENV KEEPASSXC_VERSION 2.2.0

RUN buildDeps=' \
                automake \
                bash \
                cmake \
                g++ \
                gcc \
                git \
                libgcrypt-dev \
                libmicrohttpd-dev \
                make \
                qt5-qtbase-dev \
                qt5-qttools-dev \
    ' \
    set -x \
    && apk --no-cache add $buildDeps \
    && git clone --depth 1 --branch ${KEEPASSXC_VERSION} https://github.com/keepassxreboot/keepassxc.git /usr/src/keepassxc \
    && cd /usr/src/keepassxc \
    && mkdir build \
    && cd build \
    && cmake -DWITH_TESTS=ON -DWITH_XC_AUTOTYPE=ON -DWITH_XC_HTTP=ON .. \
    && make \
    && make install \
    && apk del $buildDeps \
    && rm -rf /usr/src/keepassxc

RUN apk --no-cache add \
        libmicrohttpd \
        libgcrypt \
        mesa-dri-intel \
        qt5-qtbase \
        qt5-qtbase-x11 \
        qt5-qttools \
        ttf-dejavu

ENV uid 1000
ENV gid 1000

# creates a kp user
RUN mkdir -p /home/kp && \
    echo "kp:x:${uid}:${gid}:kp,,,:/home/kp:/bin/bash" >> /etc/passwd && \
    echo "kp:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "kp ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/kp && \
    chmod 0440 /etc/sudoers.d/kp && \
    chown ${uid}:${gid} -R /home/kp

USER kp
WORKDIR /home/kp

ENTRYPOINT [ "/usr/local/bin/keepassxc" ]
