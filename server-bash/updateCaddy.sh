#!/bin/bash
## Regularly update caddy and triger docker rebuild

echo `date`

echo $CaddyDir

mkdir -p /tmp/newCaddy
wget -q -O /tmp/newCaddy/caddy_new.tar.gz "https://caddyserver.com/download/linux/amd64?plugins=http.authz,http.awslambda,http.cache,http.cgi,http.cors,http.datadog,http.expires,http.filemanager,http.filter,http.forwardproxy,http.git,http.gopkg,http.grpc,http.hugo,http.ipfilter,http.jekyll,http.jwt,http.locale,http.login,http.mailout,http.minify,http.nobots,http.prometheus,http.proxyprotocol,http.ratelimit,http.realip,http.reauth,http.restic,http.upload,http.webdav&license=personal&telemetry=off"

cd /tmp/newCaddy
tar xf caddy_new.tar.gz

newHash=`sha1sum -b caddy | awk '{print $1}'`
oldHash=`sha1sum -b $CaddyDir/caddy | awk '{print $1}'`

if [ $newHash !=  $oldHash ]
then
    cp /tmp/newCaddy/caddy $CaddyDir/caddy
    curl -H "Content-Type: application/json" --data '{"build": true}' -X POST $TriggerUrl
else
   echo $newHash
   echo $oldHash
   echo "no change"
fi

echo `date`