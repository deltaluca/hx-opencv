all: lib main
	cp bin/lib/linux/x64/opencv.ndll bin/opencv.ndll && cd bin && ./Main

lib: src/test.cpp src/highgui.cpp
	haxelib run hxcpp Build.xml -DHXCPP_M64

main: src/Main.hx
	haxe -main Main -cp src -cpp bin -D HXCPP_M64


