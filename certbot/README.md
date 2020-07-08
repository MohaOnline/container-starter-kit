# Usage
## v1.5.0
``` bash
# Apply certificate through DNS configuration.
docker run -it --rm  \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            certbot/certbot:v1.5.0 certonly --server https://acme-v02.api.letsencrypt.org/directory --manual --agree-tos --preferred-challenges=dns
```

## v1.5.0 in China
Need pass proxy configuration in:
``` bash
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
