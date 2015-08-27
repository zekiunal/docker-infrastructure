#!/bin/bash

FROM centos:7

RUN yum -y install deltarpm
RUN yum -y install epel-release

RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN rpm -Uvh http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/el/releases/7/Everything/x86_64/os/re2c-0.13.5-7.el7.R.x86_64.rpm

RUN yum -y update

RUN yum -y install wget
RUN yum -y install unzip
