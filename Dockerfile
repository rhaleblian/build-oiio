## ref: |
## https://wiki.rockylinux.org/rocky/repo/
## https://rockylinux.pkgs.org/9/rockylinux-devel-x86_64/openexr-3.1.1-2.el9.x86_64.rpm.html

FROM rockylinux:9
WORKDIR /root

## Fetch dependencies.
RUN yum update -y
RUN yum install -y git make gcc-c++ cmake zip
RUN yum install -y zlib-devel libpng-devel boost-devel libjpeg-devel libtiff-devel python-devel
RUN dnf --enablerepo devel install -y openexr-devel pybind11-devel

## Clone, build, install locally, and zip that.
COPY Makefile .
RUN make
RUN make install
RUN make oiio.tar.gz

## Zip up the result for "rescue" from the container.
## Dereferencing symlinks so installing into an SMB filer works.
# RUN tar cvzhf oiio.tar.gz /opt/sgsco
