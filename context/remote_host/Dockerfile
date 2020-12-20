FROM centos:7

RUN yum -y install openssh-server openssh-client

RUN useradd remote_user && \
    echo "12345" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote_key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN yum install -y mysql python

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

RUN /usr/sbin/sshd-keygen
CMD /usr/sbin/sshd -D


