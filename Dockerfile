FROM --platform=linux/amd64 cimg/ruby:3.3.1-browsers

USER root
RUN apt-get update && apt-get install -y \
  build-essential \
  cmake \
  software-properties-common \
  pkg-config \
  openssl \
  libssl-dev \
  nodejs \
  libavif13

# https://www.princexml.com/download/
RUN FILE=`mktemp` &&\
    URL='https://www.princexml.com/download/prince_15.1-1_ubuntu22.04_amd64.deb' && \
    wget $URL -qO $FILE &&\
    sudo dpkg -i $FILE &&\
    rm -f $FILE

WORKDIR ..

ENV PATH="/usr/bin/cmake/bin:${PATH}"
