FROM centos:7

RUN yum install -y gcc

COPY a.out .

