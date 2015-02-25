FROM centos:7
MAINTAINER Jio L. Jung <ziozzang@gmail.com>

RUN yum update -y
RUN yum install -y passwd openssh openssh-server openssh-clients sudo
#RUN yum -y install pwgen
RUN rm -f /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN mkdir -p /root/.ssh/
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIRzly5m4mxTMKK9qqYuhDjx34NuNQW1gLpyuHmWLcMMtrOImbVd21bVReJYIwLQwga6p7iEMKiiJ+64hwbpqSZA2yo2MoC/1GhQndVwcVjSzsHOIL38XmiXN21ziiJSczuHwsOr4Zhkmd2N8ebP1Ybp3cWw4uJpjJhMb+FoE4vKn3JljK/00pGr9cENwkfvvapssQdFWvLqIALOn0sq1Ah/cKvdxMmE+J8GNaf30ZVxOjkYxXY90vXbhikh5wy8Oat6lG2m1lX9Yh+UQaIXbWSLqeXhYr2aOCCoEJ2FDV5DvgICdSATcNWYVzsWaaRTiWW+2qC86bbGgX1Vr1HJBF" > /root/.ssh/authorized_keys
RUN chmod 400 -R  /root/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
