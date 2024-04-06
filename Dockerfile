FROM centos:7
WORKDIR /root
RUN yum install -y git make gcc-c++ cmake zip zlib-devel OpenEXR-devel libpng-devel boost-devel libjpeg-devel libtiff-devel python-devel
COPY Makefile .
RUN make
RUN make install
# Dereferencing symlinks so installations over SMB work. 
RUN tar cvzhf oiio.tar.gz /opt/sgsco

