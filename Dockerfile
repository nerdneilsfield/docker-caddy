FROM alpine:3.6
RUN apk add  --no-cache curl wget ca-certificates
RUN curl https://getcaddy.com | bash -s personal http.filemanager,http.git
RUN mkdir -p /data
ADD Caddyfile /Caddyfile

EXPOSE 80

CMD ["/usr/bin/caddy","-conf=","/Caddyfile"]
