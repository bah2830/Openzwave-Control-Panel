FROM ubuntu:xenial
MAINTAINER brentahughes@gmail.com

# Install some dependencies
RUN apt-get update \
    && apt-get install build-essential git libudev-dev -y \
    && rm -rf /var/lib/apt/lists/*

# Install openzwave
WORKDIR /app
RUN git clone https://github.com/OpenZWave/open-zwave.git open-zwave
WORKDIR open-zwave
RUN make && make install

# Install microhttpd
WORKDIR /app
RUN git clone https://gnunet.org/git/libmicrohttpd.git microhttpd
WORKDIR microhttpd
RUN configure && make && make install

# Install openzwave-control-panel
WORKDIR /app
RUN git clone https://github.com/OpenZWave/open-zwave-control-panel.git Openzwave-control-panel
WORKDIR Openzwave-control-panel

# Modify makefile for linux
RUN sed -i '/# for Mac OS/,+5d' Makefile \
    && sed -i 's/#\(LIBUSB\)/\1/g' Makefile \
    && sed -i 's/#\(LIBS\)/\1/g' Makefile

RUN make