FROM alpine:3.9
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash
