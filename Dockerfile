# syntax=docker/dockerfile:1
FROM caddy:2.6.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/vultr \
    --with github.com/caddy-dns/namecheap \    
    --with github.com/caddy-dns/tencentcloud \
    --with github.com/caddy-dns/lego-deprecated \
    --with github.com/caddy-dns/dnspod \
    --with github.com/caddy-dns/namecheap \
    --with github.com/caddy-dns/alidns

FROM caddy:2.6.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
