FROM alpine:3.21.2

RUN apk add --no-cache tinyproxy stunnel supervisor

COPY PRE_SHARED_KEY /etc/stunnel/psk.txt
COPY stunnel.conf /etc/stunnel/stunnel.conf
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY supervisord.conf /etc/supervisord.conf


EXPOSE 443

# CMD ["/usr/bin/tinyproxy", "-d"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]