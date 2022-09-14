#Download base image ubuntu 20.04
FROM ubuntu:20.04

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update Ubuntu Software repository
RUN apt-get -qy update
# Install ansible
RUN apt install -qy python3 python3-pip software-properties-common git ansible
RUN pip install ansible-lint==4.0.0

RUN wget https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip; \
    unzip -o -d /usr/local/bin/ terraform_0.14.4_linux_amd64.zip; \

CMD ["/bin/bash"]
