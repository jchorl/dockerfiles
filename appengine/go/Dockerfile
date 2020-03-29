FROM golang:1.12

RUN apt-get update && \
    apt-get install -y \
    openjdk-11-jre-headless \
    python-pip
RUN pip install grpc

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-284.0.0-linux-x86_64.tar.gz && \
    tar -xf google-cloud-sdk-284.0.0-linux-x86_64.tar.gz -C / && \
    rm -rf google-cloud-sdk-284.0.0-linux-x86_64.tar.gz

ENV PATH="/google-cloud-sdk/bin:${PATH}"

RUN yes | gcloud components install app-engine-go cloud-datastore-emulator beta
