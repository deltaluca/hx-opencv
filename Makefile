all: lib main
	cp bin/lib/linux/x64/opencv.ndll bin/opencv.ndll && cd bin && ./Main-debug
	cd bin && neko Main.n

.DUMMY: lib
lib:
	haxelib run hxcpp Build.xml -DHXCPP_M64

main: src/Main.hx
	haxe -main Main -cp src -cpp bin -D HXCPP_M64 -debug
	haxe -main Main -cp src -neko bin/Main.n -debug


