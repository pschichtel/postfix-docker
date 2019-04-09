FROM alpine:edge

RUN apk update \
 && apk add postfix postfix-pcre postfix-sqlite postfix-ldap

VOLUME /var/spool/postfix

ENTRYPOINT ["postfix", "start-fg"]

