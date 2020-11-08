FROM node:12-alpine

RUN apk add --no-cache git ; \
    git clone https://github.com/docker-hy/backend-example-docker.git /usr/local/www ; \
    apk del git

WORKDIR /usr/local/www

RUN npm install ; \
    touch /usr/local/www/logs.txt ; \
    chown -R node /usr/local/www

USER node

EXPOSE 8000
ENV FRONT_URL=http://localhost:80

CMD npm start