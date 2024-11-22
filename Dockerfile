FROM alpine

RUN apk add --no-cache openssh-server nano openssh-client screen

RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh
RUN ssh-keygen -A

COPY mheers.keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# create a user client
RUN adduser -D client
RUN echo "client:client" | chpasswd

CMD ["/usr/sbin/sshd", "-D", "-e"]
