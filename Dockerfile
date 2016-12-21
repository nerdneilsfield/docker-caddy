FROM alpine
ADD caddy /usr/bin/caddy
RUN chmod a+x /usr/bin/caddy && mkdir -p /data
ADD Caddyfile /Caddyfile
CMD ["/usr/bin/caddy","-conf=","/Caddyfile]
