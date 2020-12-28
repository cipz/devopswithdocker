FROM ubuntu:20.04

RUN apt-get update -y && apt-get install git curl -y ; \
    curl -sL https://deb.nodesource.com/setup_10.x | bash ; \
    apt install -y nodejs ; \
    node -v && npm -v ; 

WORKDIR /usr/local/www

CMD git clone https://github.com/docker-hy/backend-example-docker /usr/local/www

RUN npm install ; \
    apt-get purge -y --auto-remove curl ; \
    rm -rf /var/lib/apt/lists/*

ENV FRONT_URL=http://localhost:5000

EXPOSE 8000

CMD npm start
