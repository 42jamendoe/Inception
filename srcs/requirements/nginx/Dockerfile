FROM debian:bullseye

LABEL authors="jamendoe"

EXPOSE 443

RUN apt update && apt install -y \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/jamendoe.key \
-out /etc/nginx/ssl/jamendoe.crt -subj \
"/C=PT/L=Porto/O=42Porto/CN=jamendoe.42.fr"

COPY /conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
