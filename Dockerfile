FROM alpine:3.9
RUN apk update && apk add openssh-client bash
