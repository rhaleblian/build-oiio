# build-oiio

Build recipe for OpenImageIO 1.6.18 in a CentOS 7 container.

    docker buildx build -t oiio .
    docker run -d -it --name oiio oiio bash
    docker cp /root/oiio.tar.gz .

## Runtime requirements

    yum install zlib OpenEXR libpng boost libjpeg libtiff python

