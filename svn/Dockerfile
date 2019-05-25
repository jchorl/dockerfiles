# docker run -it --rm -v "$PWD":/work -w /work -u $UID:$GID jchorl/svn
FROM ubuntu:17.10

RUN apt-get update && apt-get -y install subversion vim

ENV uid 1000
ENV gid 1000
ENV EDITOR vim

# creates a svnuser user
RUN mkdir -p /home/svnuser && \
    echo "svnuser:x:${uid}:${gid}:svnuser,,,:/home/svnuser:/bin/bash" >> /etc/passwd && \
    echo "svnuser:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "svnuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/svnuser && \
    chmod 0440 /etc/sudoers.d/svnuser && \
    chown ${uid}:${gid} -R /home/svnuser

USER svnuser
WORKDIR /home/svnuser
