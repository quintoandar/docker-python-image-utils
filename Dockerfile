FROM python:3-alpine

ENV PYTHONPATH /usr/local/bin/python
ENV LOGPATH /var/log

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.5/main >> /etc/apk/repositories
RUN echo http://dl-4.alpinelinux.org/alpine/v3.5/community >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache gcc linux-headers pcre-dev musl==1.1.15-r6 git imagemagick wget poppler poppler-utils libxml2 libxslt libxml2-dev libxslt-dev tesseract-ocr-dev tesseract-ocr xvfb gfortran

ADD deploy/zbar-install.sh .
RUN ./zbar-install.sh

RUN mkdir -p /usr/share/tessdata/
RUN wget https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata -O /tmp/eng.traineddata > /dev/null
RUN mv -v /tmp/eng.traineddata /usr/share/tessdata/

# ADD deploy/wkhtmltopdf.sh .
# RUN ./wkhtmltopdf.sh
