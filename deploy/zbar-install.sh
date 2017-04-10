#!/bin/sh

wget https://sourceforge.net/projects/zbar/files/zbar/0.10/zbar-0.10.tar.bz2 -P /tmp/

echo "Installing zbar from source. This may take a while..."

tar -xvf /tmp/zbar-0.10.tar.bz2 -C /tmp/ > /dev/null && \
    apk add --no-cache make imagemagick-dev gtk+-dev \
        py-gtk-dev py-gobject qt-dev g++ libtool lcms2-dev v4l-utils-dvbv5 && \
    cd /tmp/zbar-0.10 && \
    ./configure --disable-video > /dev/null && \
    make &> /dev/null && \
    make install > /dev/null && \
    rm -rf /tmp/* && \
    cd -
