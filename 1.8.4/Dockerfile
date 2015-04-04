FROM debian:jessie
MAINTAINER Dwight Spencer (@denzuko) <dspencer@computekindustries.com>

ENV ANSIBLE_VERSION 1.8.2
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends locales python python-pip python-crypto openssh-client sshpass apt-utils && \
    pip install ansible==${ANSIBLE_VERSION} pywinrm

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8 && \
    echo "Etc/UTC" >> /etc/timezone && dpkg-reconfigure tzdata

ENV LC_ALL C.UTF-8
ENV ANSIBLE_CONFIG /ansible.cfg

COPY ansible.cfg /ansible.cfg
COPY run.sh /run.sh

RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
