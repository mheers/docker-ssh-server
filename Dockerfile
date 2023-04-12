FROM alpine

RUN apk add --no-cache openssh-server

RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D", "-e"]
