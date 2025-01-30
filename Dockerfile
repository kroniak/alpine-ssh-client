FROM alpine:3.21
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash
