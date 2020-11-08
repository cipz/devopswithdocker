FROM node:12-alpine

RUN apk add --no-cache git ; \
    git clone https://github.com/docker-hy/frontend-example-docker.git /usr/local/www ; \
    apk del git

WORKDIR /usr/local/www

RUN npm install ; \
    chown -R node /usr/local/www

USER node 

EXPOSE 5000

CMD npm start