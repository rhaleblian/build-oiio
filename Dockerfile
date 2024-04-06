FROM centos:7
RUN yum install -y make
RUN ls
RUN pwd
# COPY Makefile .
# RUN make requirements
# RUN make
# RUN make install
