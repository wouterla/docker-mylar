FROM python:2
MAINTAINER Wouter Lagerweij <wouter@lagerweij.com>

# Download pre-requisites
RUN pip install cheetah

# Download latest version
RUN mkdir -p /opt/mylar
WORKDIR /opt/mylar
RUN git clone https://github.com/evilhero/mylar.git ./app

# Create a volume for comics
RUN mkdir /comics
RUN mkdir /downloads
RUN mkdir /torrents

# Expose the mylar home
VOLUME /comics
VOLUME /downloads
VOLUME /torrents
VOLUME /opt/mylar

# Expose the listening port
EXPOSE 8090

# Launch it
CMD [ "python", "app/Mylar.py" ]
