FROM node:8

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-219.0.1-linux-x86_64.tar.gz && \
    tar -xf google-cloud-sdk-219.0.1-linux-x86_64.tar.gz -C / && \
    rm -rf google-cloud-sdk-219.0.1-linux-x86_64.tar.gz

ENV PATH="/google-cloud-sdk/bin:${PATH}"
