# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>


# To build the image
# docker build --rm -t <yourname>/postgresql .




FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>




RUN yum -y update; yum clean all
RUN yum -y install sudo epel-release; yum clean all
RUN yum -y install postgresql-server postgresql postgresql-contrib supervisor  postgresql-devel; yum clean all

# add make
RUN yum -y install gcc gcc-c++ kernel-devel make libicu-devel
# add emacs in case
RUN yum -y install emacs


# Install Node.js and npm
RUN     yum install -y npm

# Bundle app source
COPY . /src

# Install coffescript globally
RUN cd /src ; npm install -g -y coffee-script
# Install app dependencies
RUN cd /src ; npm install -y bcrypt ; npm -y install

EXPOSE  8080


#
#	Command
#

ADD ./supervisor.sh /supervisor.sh
CMD /bin/bash /supervisor.sh