FROM debian:jessie
MAINTAINER Dwight Spencer (@denzuko) <dspencer@computekindustries.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends python python-pip python-crypto openssh-client sshpass && \
    pip install ansible==${ANSIBLE_VERSION} pywinrm

RUN dpkg-reconfigure locales && \
    locale-genC.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8
ENV ANSIBLE_VERSION 1.9.0.1
ENV ANSIBLE_CONFIG /ansible.cfg

COPY ansible.cfg /ansible.cfg
COPY run.sh /run.sh

RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
