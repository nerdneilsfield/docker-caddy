FROM alpine:3.6
RUN apk add  --no-cache wget ca-certificates
RUN wget -O /usr/bin/caddy https://file.dengqi.org/caddy/caddy  && mkdir -p /data && chmod a+x /usr/bin/caddy
ADD Caddyfile /Caddyfile

EXPOSE 80

CMD ["/usr/bin/caddy","-conf=","/Caddyfile"]
