FROM ubuntu:20.04
LABEL maintainer="datapunt@amsterdam.nl"

RUN apt-get update && apt-get install -my curl wget gnupg -y
RUN apt install build-essential software-properties-common -y
# RUN add-apt-repository -y ppa:ubuntugis/ppa

RUN python3 -m pip install mappyfile==0.9.7

# Enable these Apache modules
RUN a2enmod actions cgi alias headers rewrite env
RUN a2enmod actions cgi alias headers rewrite env

# Configure localhost in Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN rm /etc/apache2/mods-enabled/alias.conf
COPY docker/000-default.conf /etc/apache2/sites-available/
COPY docker/docker-entrypoint.sh /bin

COPY . /srv/mapserver/

EXPOSE 80

CMD /bin/docker-entrypoint.sh