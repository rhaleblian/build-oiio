
default: OpenImageIO configure
	(cd build && make -j 2)

deps:
	yum update -y
	yum install -y git make gcc-c++ cmake zip
	yum install -y zlib-devel libpng-devel boost-devel libjpeg-devel libtiff-devel python-devel
	dnf --enablerepo devel install -y openexr-devel pybind11-devel

configure: build
	(cd build && cmake ../OpenImageIO -DCMAKE_INSTALL_PREFIX=/opt/sgsco)

test:
	build/src/oiiotool/oiiotool
	PYTHONPATH=build/src/python python -c 'import OpenImageIO;print(OpenImageIO)'

install:
	(cd build && make install)

clean:
	rm -rf build

.PHONY = default configure test install clean


OpenImageIO:
	git clone https://github.com/academysoftwarefoundation/OpenImageIO -b v2.3.7.2

build:
	mkdir build

oiio.tar.gz:
	tar cvzhf oiio.tar.gz /opt/sgsco
