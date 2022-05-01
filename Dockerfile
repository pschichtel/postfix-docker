FROM debian:bullseye-slim

LABEL maintainer="Phillip Schichtel <phillip@schich.tel>"

# Set apt non-interactive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && echo "postfix postfix/main_mailer_type string 'No configuration'" | debconf-set-selections \
 && apt-get --no-install-recommends install -y postfix postfix-pcre postfix-sqlite postfix-ldap \
                       libsasl2-2 libsasl2-modules libsasl2-modules-db ca-certificates

VOLUME /var/spool/postfix

WORKDIR /var/lib/postfix

ENTRYPOINT ["postfix", "start-fg"]

