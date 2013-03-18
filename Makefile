all: lib main
	cp ndll/Linux64/opencv.ndll bin/opencv.ndll && cd bin && ./Main-debug
	cd bin && neko Main.n

.PHONY: lib
lib:
	haxelib run hxcpp Build.xml -DHXCPP_M64 -debug

main: Main.hx
	haxe -main Main -cpp bin -D HXCPP_M64 -debug
#	haxe -main Main -neko bin/Main.n -debug

.PHONY: haxelib
haxelib: lib
	rm -f opencv.zip
	zip -r opencv src cv include ndll Build.xml haxelib.xml
	haxelib test opencv.zip
