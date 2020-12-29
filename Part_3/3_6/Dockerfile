FROM node:12-alpine3.12 as build-stage

WORKDIR /app

ENV API_URL=http://localhost:8000

RUN apk add --no-cache git && \
    git clone https://github.com/docker-hy/frontend-example-docker.git . && \
    npm install && \
    apk del git && \
    npm run build

FROM nginx:alpine

COPY --from=build-stage /app/dist/ /usr/share/nginx/html/

EXPOSE 80
