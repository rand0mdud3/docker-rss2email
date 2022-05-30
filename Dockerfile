FROM alpine:latest AS builder
LABEL maintainer="rand0mdud31@gmail.com"
RUN apk add git py3-setuptools dumb-init tzdata
WORKDIR /tmp
RUN git clone https://github.com/rand0mdud3/rss2email.git
WORKDIR rss2email
RUN python3 setup.py build &&  python3 setup.py install

FROM alpine:latest
RUN apk add python3
COPY root/ /
COPY --from=builder /usr/lib/python3.10/site-packages /usr/lib/python3.10/site-packages
COPY --from=builder /usr/bin/r2e /usr/bin/dumb-init /usr/bin/
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo

VOLUME ["/config"]
CMD ["/init"]
