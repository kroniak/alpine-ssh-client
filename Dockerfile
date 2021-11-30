FROM alpine:3.15
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash
