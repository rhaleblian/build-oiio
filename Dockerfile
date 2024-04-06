FROM centos:7
WORKDIR /sgsco
RUN yum install -y make
COPY Makefile .
RUN make requirements
RUN make
RUN make install
