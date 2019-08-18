FROM debian:buster-slim

LABEL maintainer="Phillip Schichtel <phillip@schich.tel>"

# Set apt non-interactive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get --no-install-recommends install -y postfix postfix-pcre postfix-sqlite postfix-ldap \
                       libsasl2-2 libsasl2-modules libsasl2-modules-db \
                       postfix-policyd-spf-python

VOLUME /var/spool/postfix

ENTRYPOINT ["postfix", "start-fg"]

