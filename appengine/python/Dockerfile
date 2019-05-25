FROM python:3.7

RUN apt-get update && \
    apt-get install -y \
    openjdk-8-jre-headless \
    python-pip \
    python python-dev python3 python3-dev

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-219.0.1-linux-x86_64.tar.gz && \
    tar -xf google-cloud-sdk-219.0.1-linux-x86_64.tar.gz -C / && \
    rm -rf google-cloud-sdk-219.0.1-linux-x86_64.tar.gz

ENV PATH="/google-cloud-sdk/bin:${PATH}"

RUN yes | gcloud components install beta
