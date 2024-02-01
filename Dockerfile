FROM ubuntu:22.04
MAINTAINER Olaf Klischat <olaf.klischat@gmail.com>

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt update && \
    apt -yy install locales && \
    locale-gen en_US.UTF-8 && locale-gen de_DE.UTF-8 && \
    DEBIAN_FRONTEND=noninteractive apt -yy install sudo git less vim curl wget net-tools iputils-ping iputils-arping iputils-tracepath dnsutils tcpdump whois netcat docker.io unrar cu psmisc iptraf nethogs libpcap-dev nmap strace lsof rsync jq

RUN curl -L -o /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$(uname -m | sed -e 's/x86_64/amd64/' -e 's/aarch64/arm64/')/kubectl" && \
    chmod +x /usr/local/bin/kubectl
