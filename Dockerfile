FROM alpine:3.9

RUN apk update \
 && apk add postfix

ENTRYPOINT ["postfix", "start-fg"]

