# Docker Hub: ma3310/modsecurity-crs:certbot
FROM owasp/modsecurity-crs:v3.3.0-nginx

RUN apt-get update && apt-get dist-upgrade -y && apt-get install certbot python3-certbot-nginx -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
