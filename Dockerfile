FROM nginx:1.24.0-alpine-slim
RUN apk update && apk upgrade && apk add nginx && apk add curl
ADD index.html /usr/share/nginx/html/index.html
EXPOSE 80
