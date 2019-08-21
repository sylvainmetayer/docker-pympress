FROM debian:10-slim

RUN apt-get update && \ 
    apt-get -qy install python3 python3-pip libgtk-3-0 libpoppler-glib8 libcairo2 python3-gi python3-cairo python3-gi-cairo gir1.2-gtk-3.0 gir1.2-poppler-0.18 && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install pympress && \
    mkdir -p /data/.config

WORKDIR /data
#ENV HOME /data
COPY pympress /data/.config/pympress

VOLUME ["/data"]
CMD ["pympress"]
