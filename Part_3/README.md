# Exercises for [part 3](https://devopswithdocker.com/part3/)

## 3.1

Return back to our [frontend](https://github.com/docker-hy/frontend-example-docker) & [backend](https://github.com/docker-hy/backend-example-docker) Dockerfiles and you should see the some mistakes we now know to fix.

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both programs, frontend and backend, by joining the `RUN` commands and removing useless parts.

After your improvements document the image sizes again. The size difference may not be very much yet. The frontend should be around 432MB when using FROM ubuntu:16.04. The backend should be around 351MB. The sizes may vary.

*Answer:*

*Contents of frontend Dockerfile (Actual Dockerfile in folder 3_1/frontend):*
```docker
FROM ubuntu:20.04

RUN apt-get update -y ; \
    apt-get install git curl -y ; \
    curl -sL https://deb.nodesource.com/setup_10.x | bash ; \
    apt-get install nodejs -y ; \
    apt-get purge -y --auto-remove curl ; \
    rm -rf /var/lib/apt/lists/* ; \
    node -v && npm -v ;  

CMD git clone https://github.com/docker-hy/frontend-example-docker ; \
    mv frontend-example-docker /usr/local/www ;

WORKDIR /usr/local/www

CMD npm install ; \
    npm run build ;   \
    npm install -g serve ; \
    npm run build

EXPOSE 5000

ENV API_URL=http://localhost:8000

CMD serve -s -l 5000 dist
```

*Contents of backend Dockerfile (Actual Dockerfile in folder 3_1/backend):*
```docker
FROM ubuntu:20.04

RUN apt-get update -y && apt-get install git curl -y ; \
    curl -sL https://deb.nodesource.com/setup_10.x | bash ; \
    apt install -y nodejs ; \
    node -v && npm -v ; 

CMD git clone https://github.com/docker-hy/backend-example-docker ; 

WORKDIR /usr/local/www

RUN mv backend-example-docker /usr/local/www ; \
    npm install ; \
    apt-get purge -y --auto-remove curl ; \
    rm -rf /var/lib/apt/lists/*

ENV FRONT_URL=http://localhost:5000

EXPOSE 8000

CMD npm start
```
## 3.4

**This exercise is mandatory**

Security issues with the user being a root are serious for the example frontend and backend as the containers for web services are supposed to be accessible through the internet.

Make sure the containers start their processes as a non-root user.

  > TIP `man chown` may help you if you have access errors

*Contents of frontend Dockerfile (Actual Dockerfile in folder 3_4/frontend):*
```docker
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
```

*Contents of backend Dockerfile (Actual Dockerfile in folder 3_4/backend):*
```docker
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
```

*Contents of `docker-compose.yml` file (Actual `docker-compose.yml` in folder 3_4):*
```docker
version: '3' 

services: 

  ex_3_4_frontend:  
    image: frontend:final
    build: ./frontend/
    ports: 
      - 5000:5000
    container_name: ex_3_4_frontend
    environment:
      - API_URL=api

  ex_3_4_backend:  
    image: backend:final
    build: ./backend/
    volumes: 
      - ./logs.txt:/usr/local/www/backend/logs.txt
    ports: 
      - 8000:8000
    environment:
      - REDIS=ex_3_4_redis
      - REDIS_PORT=6379
      - DB_USERNAME=admin
      - DB_PASSWORD=admin
      - DB_HOST=ex_3_4_postgres
      - FRONT_URL=localhost
    container_name: ex_3_4_backend
    restart: unless-stopped

  ex_3_4_redis:
    image: redis
    ports: 
      - 6379:6379
    container_name: ex_3_4_redis
  
  ex_3_4_postgres:
    image: postgres
    restart: unless-stopped
    container_name: ex_3_4_postgres
    environment:
      - POSTGRES_PASSWORD=admin
      - POSTGRES_USER=admin
    volumes:
      - database:/var/lib/postgresql/data

  ex_3_4_nginx:
    container_name: ex_3_4_nginx
    image: nginx
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    ports:
      - 80:80
    depends_on:
      - ex_3_4_frontend
      - ex_3_4_backend

volumes:
  database:
```
