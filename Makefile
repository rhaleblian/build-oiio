## bootstrap Centos 7 to build oiio.


## "fake" rules (macros)

default: configure
	(cd build && make -j 4)

configure: requirements build
	(cd build && cmake ../OpenImageIO -DCMAKE_INSTALL_PREFIX=/opt/oiio)

requirements: /usr/bin/git /usr/bin/cmake /usr/bin/c++
	yum install zlib-devel OpenEXR-devel libpng-devel boost-devel libjpeg-devel libtiff-devel python-devel

test:
	build/src/oiiotool/oiiotool
	PYTHONPATH=build/src/python python -c 'import OpenImageIO;print(OpenImageIO)'

ipython:
	PYTHONPATH=build/src/python python

install:
	(cd build && make install)

clean:
	rm -rf build


## "real" rules (target is an actual file/dir)

OpenImageIO:
	git clone git@github.com:academysoftwarefoundation/OpenImageIO
	(cd OpenImageIO && git checkout Release-1.6.18)

build:
	mkdir build

/usr/bin/git:
	yum install git

/usr/bin/cmake:
	yum install cmake

/usr/bin/c++:
	yum install gcc gcc-c++
