FROM alpine:3.6
RUN apk add  --no-cache wget
RUN  wget -O /usr/bin/caddy "https://caddyserver.com/download/linux/amd64?plugins=dyndns,http.authz,http.awses,http.cache,http.cgi,http.cors,http.datadog,http.expires,http.filemanager,http.filter,http.forwardproxy,http.geoip,http.git,http.gopkg,http.grpc,http.hugo,http.ipfilter,http.jekyll,http.jwt,http.locale,http.login,http.mailout,http.minify,http.nobots,http.prometheus,http.proxyprotocol,http.ratelimit,http.realip,http.reauth,http.restic,http.upload,http.webdav&license=personal"
RUN chmod a+x /usr/bin/caddy && mkdir -p /data
ADD Caddyfile /Caddyfile

EXPOSE 80

CMD ["/usr/bin/caddy","-conf=","/Caddyfile]
