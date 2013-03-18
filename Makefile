all: lib main
	cp ndll/Linux64/opencv.ndll bin/opencv.ndll && cd bin && ./Main-debug
	cd bin && neko Main.n

.DUMMY: lib
lib:
	haxelib run hxcpp Build.xml -DHXCPP_M64 -debug

main: Main.hx
	haxe -main Main -cpp bin -D HXCPP_M64 -debug
#	haxe -main Main -neko bin/Main.n -debug

haxelib: lib
	zip -r opencv src cv include Build.xml haxelib.xml
