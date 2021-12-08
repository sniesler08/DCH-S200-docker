# dcg-s200-web-control
FROM alpine
MAINTAINER luis@cuarentaydos.com
EXPOSE 9876
COPY webcontrol /app
COPY entrypoint.sh /
RUN apk add --no-cache nodejs tini
RUN	cd /app; npm i
ENTRYPOINT ["/sbin/tini", "-g", "--", "/entrypoint.sh"]
