# build-oiio

Build recipe for OpenImageIO 2.3.7 in a Rocky Linux 9 container.

    docker buildx build -t oiio .
    docker run -d -it --name oiio oiio bash
    docker cp oiio:/root/oiio.tar.gz .
    docker rm oiio

## Runtime requirements

    yum install zlib openexr libpng boost libjpeg libtiff python

