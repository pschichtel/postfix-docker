FROM debian:buster-slim

RUN apt-get update \
 && apt-get install -y postfix postfix-pcre postfix-sqlite postfix-ldap \
                       libsasl2-2 libsasl2-modules libsasl2-modules-db \
                       postfix-policyd-spf-python python3-pkg-resources

VOLUME /var/spool/postfix

ENTRYPOINT ["postfix", "start-fg"]

