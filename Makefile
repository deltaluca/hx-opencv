all: lib main
	cp bin/lib/linux/x64/opencv.ndll bin/opencv.ndll && cd bin && ./Main
	cd bin && neko Main.n

lib: Build.xml src/test.cpp src/highgui.cpp src/core.cpp
	haxelib run hxcpp Build.xml -DHXCPP_M64

main: src/Main.hx
	haxe -main Main -cp src -cpp bin -D HXCPP_M64
	haxe -main Main -cp src -neko bin/Main.n


