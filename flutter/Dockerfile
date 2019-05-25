FROM ubuntu:18.04

RUN apt-get update; apt-get install -y \
    wget \
    xz-utils \
    git \
    lib32stdc++6 \
    unzip \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libfreetype6
RUN mkdir /flutter
WORKDIR /flutter

RUN wget https://dl.google.com/dl/android/studio/ide-zips/3.1.4.0/android-studio-ide-173.4907809-linux.zip && \
    unzip android-studio-ide-173.4907809-linux.zip

RUN wget https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_v0.5.1-beta.tar.xz && \
    tar xf flutter_linux_v0.5.1-beta.tar.xz

ENV uid 1000
ENV gid 1000

# creates a flutter user
RUN mkdir -p /flutter && \
    echo "flutter:x:${uid}:${gid}:flutter,,,:/flutter:/bin/bash" >> /etc/passwd && \
    echo "flutter:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "flutter ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/flutter && \
    chmod 0440 /etc/sudoers.d/flutter && \
    chown ${uid}:${gid} -R /flutter

USER flutter

ENV PATH="/flutter/android-studio/bin:${PATH}"
ENV PATH="/flutter/flutter/bin:${PATH}"
