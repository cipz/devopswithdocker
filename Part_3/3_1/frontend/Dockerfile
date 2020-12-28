FROM ubuntu:20.04

RUN apt-get update -y ; \
    apt-get install git curl -y ; \
    curl -sL https://deb.nodesource.com/setup_10.x | bash ; \
    apt-get install nodejs -y ; \
    apt-get purge -y --auto-remove curl ; \
    rm -rf /var/lib/apt/lists/* ; \
    node -v && npm -v ;  

WORKDIR /usr/local/www

CMD git clone https://github.com/docker-hy/frontend-example-docker /usr/local/www

CMD npm install ; \
    npm run build ;   \
    npm install -g serve ; \
    npm run build

EXPOSE 5000

ENV API_URL=http://localhost:8000

CMD serve -s -l 5000 dist