FROM alpine:3.4
MAINTAINER Denys Chekirda aka Rocklviv <dchekirda@gmail.com>

RUN apk update --no-cache && apk add bash
# Copying cron tasks.
COPY tasks/ /etc/periodic
# Copying scheduler for root.
COPY root /etc/crontabs/root

CMD ["crond", "-l", "2","-f", "-d", "8"]