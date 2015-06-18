FROM ubuntu:14.04
MAINTAINER Jio L. Jung <ziozzang@gmail.com>

RUN sudo sed -i -e 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -fy && apt-get install -fy openssh-server
RUN locale-gen ko_KR.UTF-8
RUN mkdir /var/run/sshd
RUN mkdir -p /root/.ssh/
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIRzly5m4mxTMKK9qqYuhDjx34NuNQW1gLpyuHmWLcMMtrOImbVd21bVReJYIwLQwga6p7iEMKiiJ+64hwbpqSZA2yo2MoC/1GhQndVwcVjSzsHOIL38XmiXN21ziiJSczuHwsOr4Zhkmd2N8ebP1Ybp3cWw4uJpjJhMb+FoE4vKn3JljK/00pGr9cENwkfvvapssQdFWvLqIALOn0sq1Ah/cKvdxMmE+J8GNaf30ZVxOjkYxXY90vXbhikh5wy8Oat6lG2m1lX9Yh+UQaIXbWSLqeXhYr2aOCCoEJ2FDV5DvgICdSATcNWYVzsWaaRTiWW+2qC86bbGgX1Vr1HJBF" > /root/.ssh/authorized_keys
RUN chmod 400 -R  /root/.ssh
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
