FROM ubuntu:xenial-20201030

RUN apt update

RUN apt install  openssh-server sudo sed -y

RUN sed -i 's/^Port .*/Port 2222/g' /etc/ssh/sshd_config

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 admin 

RUN usermod -aG sudo admin

RUN service ssh start

RUN  echo 'admin:admin' | chpasswd

CMD ["/usr/sbin/sshd","-D"]
