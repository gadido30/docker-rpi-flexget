FROM hypriot/rpi-python

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install libffi-dev libssl-dev libc6-dev gcc libtag1-dev libssl-dev zlibc zlib1g-dev
RUN pip install -U pip
RUN pip install -I pyopenssl ndg-httpsclient pyasn1 setuptools
#RUN pip install -U pyopenssl ndg-httpsclient pyasn1
RUN pip install -I flexget

RUN mkdir -p /root/.flexget \
    && touch /root/.flexget/config.yml

VOLUME ["/root/.flexget"]

CMD ["/usr/local/bin/flexget", "--loglevel", "info", "daemon", "start"]
