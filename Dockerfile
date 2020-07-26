FROM golang:1.14.6-alpine AS builder
 
ENV HUGO_VERSION 0.74.3

RUN apk add --no-cache \
    curl \
    git \ 
    openssh-client \ 
    rsync

WORKDIR /usr/local/src

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo

WORKDIR /srv/site
COPY ./site/ ./
RUN hugo -D

COPY ./server /go/src/server
WORKDIR /go/src/server

RUN go get
RUN go build server.go

FROM alpine 

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
EXPOSE 8080
COPY --from=builder /srv/site /srv/site
COPY --from=builder /go/src/server /go/src/
ENTRYPOINT [ "/go/src/server" ]