FROM centos:centos6
MAINTAINER Jio L. Jung <ziozzang@gmail.com>

RUN yum update -y
RUN yum install -y passwd openssh openssh-server openssh-clients sudo
RUN rm -f /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# Need to login as root.
# we don't need this because we will not login with plain text password. just randomize.
RUN export passwords=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
RUN echo "root:${passwords}" | chpasswd

RUN mkdir -p /root/.ssh/
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIRzly5m4mxTMKK9qqYuhDjx34NuNQW1gLpyuHmWLcMMtrOImbVd21bVReJYIwLQwga6p7iEMKiiJ+64hwbpqSZA2yo2MoC/1GhQndVwcVjSzsHOIL38XmiXN21ziiJSczuHwsOr4Zhkmd2N8ebP1Ybp3cWw4uJpjJhMb+FoE4vKn3JljK/00pGr9cENwkfvvapssQdFWvLqIALOn0sq1Ah/cKvdxMmE+J8GNaf30ZVxOjkYxXY90vXbhikh5wy8Oat6lG2m1lX9Yh+UQaIXbWSLqeXhYr2aOCCoEJ2FDV5DvgICdSATcNWYVzsWaaRTiWW+2qC86bbGgX1Vr1HJBF" > /root/.ssh/authorized_keys
RUN chmod 400 -R  /root/.ssh


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
