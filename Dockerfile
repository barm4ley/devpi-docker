FROM python:2-wheezy

RUN echo "deb http://ftp.ua.debian.org/debian/ wheezy main contrib non-free" > /etc/apt/sources.list \
 && apt-get update -qq

RUN apt-get install -y nginx
RUN apt-get install -y supervisor

RUN pip install -U pip virtualenv

RUN virtualenv -q /opt/devpi

RUN . /opt/devpi/bin/activate && pip install devpi-server

ADD nginx.conf /etc/nginx/sites-enabled/default
ADD supervisor.conf /etc/supervisor/conf.d/devpi.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME /opt/devpi/data

EXPOSE 80
EXPOSE 3141

CMD /usr/bin/supervisord -n
