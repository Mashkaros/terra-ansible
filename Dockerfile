FROM centos:8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget; \
    yum install -y openssh-server openssh-clients; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible; \
RUN wget https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip; \
    unzip -o -d /usr/local/bin/ terraform_0.14.4_linux_amd64.zip; \