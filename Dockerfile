FROM alpine:edge
LABEL maintainer="rand0mdud31@gmail.com"
RUN apk add py3-rss2email dumb-init tzdata
COPY root/ /

VOLUME ["/config"]
CMD ["/init"]
