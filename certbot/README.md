# Usage
## v1.5.0
``` bash
# Apply certificate through DNS configuration.
docker run -it --rm  \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            certbot/certbot:v1.5.0 certonly --server https://acme-v02.api.letsencrypt.org/directory --manual --agree-tos --preferred-challenges=dns
```

## Certbot Environment basing on Docker
### v1.5.0
``` bash
# Certbot Shell Environment
docker run -it --rm  \
            --network host \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/etc/nginx:/etc/nginx" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            --entrypoint /bin/sh \
            certbot/certbot:v1.5.0 
```

### v1.11.0
``` bash
# Certbot Shell Environment
docker run -it --rm  \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            --entrypoint /bin/sh \
            certbot/certbot:v1.11.0

/usr/local/bin/python -m pip install --upgrade pip
pip install certbot certbot-nginx
```

## v1.5.0 in China
Need pass proxy configuration in:
``` bash
# Renew certificate.
docker run -it --rm  \
            --network host \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/etc/nginx:/etc/nginx" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            certbot/certbot:v1.5.0 renew --server https://acme-v02.api.letsencrypt.org/directory 

# Renew certificate.
docker run -it --rm  \
            --network host \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            -e "http_proxy=http://PROXY" \
            -e "https_proxy=http://PROXY" \
            certbot/certbot:v1.5.0 renew --server https://acme-v02.api.letsencrypt.org/directory 

# certbot Shell Environment
docker run -it --rm  \
            --network host \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            -e "http_proxy=http://PROXY" \
            -e "https_proxy=http://PROXY" \
            --entrypoint /bin/sh \
            certbot/certbot:v1.5.0 
```
