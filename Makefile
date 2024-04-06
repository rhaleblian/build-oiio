
default: OpenImageIO configure
	(cd build && make -j 2)

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
	git clone https://github.com/academysoftwarefoundation/OpenImageIO -b Release-1.6.18

build:
	mkdir build

