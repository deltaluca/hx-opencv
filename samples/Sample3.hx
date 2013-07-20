import cv.Core;
import cv.HighGUI;
import cv.ImgProc;

class Sample3 {
    static function main() {
        haxe.Log.trace = function (m,?_) neko.Lib.println(Std.string(m));

        Core.init();

        var I = null;
        try I = HighGUI.loadImageM("Happy Fish.jpg", HighGUI.LOAD_IMAGE_COLOR)
        catch (_:Dynamic) {
            trace("Couldn't load image");
            Sys.exit(1);
        }

        HighGUI.namedWindow("Input", HighGUI.WINDOW_AUTOSIZE);
        HighGUI.namedWindow("Output", HighGUI.WINDOW_AUTOSIZE);

        HighGUI.showImage("Input", I);

        // clone the I matrix to ensure we get one with same data type and number of channels.
        // Easier than extracting information and then using createMat
        var J = Core.cloneMat(I);

        // Create kernel matrix and assign values
        var kern = Core.createMat(3, 3, Core._32F);
        var i = 0;
        for (x in [0,-1,0,
                   -1,5,-1,
                   0,-1,0]) kern.set_float(i++, x);

        // Apply kernel to I, writing to matrix J
        ImgProc.filter2D(I, J, kern);

        HighGUI.showImage("Output", J);

        HighGUI.waitKey(0);
        Sys.exit(0);
    }
}


