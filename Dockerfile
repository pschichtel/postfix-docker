FROM alpine:edge

RUN apk update \
 && apk add postfix postfix-pcre postfix-sqlite postfix-ldap cyrus-sasl cyrus-sasl-plain

VOLUME /var/spool/postfix

ENTRYPOINT ["postfix", "start-fg"]

