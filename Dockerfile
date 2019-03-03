FROM nginx/unit:1.8.0-minimal 
LABEL maintainer="Supphachoke Suntiwichaya <mrchoke@gmail.com>"

RUN set -x \
	&& apt-get update \
	&& apt-get install -y  gnupg2 apt-transport-https ca-certificates \
	&& echo "deb https://packages.nginx.org/unit/debian/ stretch unit" >> /etc/apt/sources.list.d/unit.list \
	&& echo "deb-src https://packages.nginx.org/unit/debian/ stretch unit" >> /etc/apt/sources.list.d/unit.list \
	&& apt-get update \
	&& curl -sL https://deb.nodesource.com/setup_11.x | bash - \
	&& apt-get  install -y nodejs gcc g++ make unit-dev \
	&& npm install -g --unsafe-perm unit-http \
	&& apt-get remove --purge --auto-remove -y gnupg2 gcc g++ make unit-dev  && rm -rf /var/lib/apt/lists/*

ADD app /srv/app

EXPOSE 3000

WORKDIR /srv/app

COPY ./docker-entrypoint.sh /
RUN chmod +x /srv/app/index.js  /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

