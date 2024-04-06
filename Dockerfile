FROM centos:7
COPY Makefile .
RUN make requirements
RUN make
RUN make install
