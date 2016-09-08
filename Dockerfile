FROM alpine
RUN apk add --no-cache openssh-client bash
ENTRYPOINT ["bash"]