import cv.Core;
import cv.HighGUI;
import cv.ImgProc;

class Sample2 {
    static function main() {
        haxe.Log.trace = function (m,?_) neko.Lib.println(Std.string(m));

        Core.init();

        var image = null;
        try image = HighGUI.loadImageM("Happy Fish.jpg", HighGUI.LOAD_IMAGE_COLOR)
        catch (_:Dynamic) {
            trace("Couldn't load image");
            Sys.exit(1);
        }

        // Create matrix of same size, with 8bit single channel to store
        // greyscale version of image.
        var grey = Core.createMat(image.rows, image.cols, Core._8U);

        // Convert input image to greyscale and save to file.
        ImgProc.cvtColor(image, grey, ImgProc.BGR2GRAY);
        HighGUI.saveImage("Happy Fish (Grey).jpg", grey);

        HighGUI.namedWindow("Colour", HighGUI.WINDOW_AUTOSIZE);
        HighGUI.namedWindow("Grey", HighGUI.WINDOW_AUTOSIZE);

        HighGUI.showImage("Colour", image);
        HighGUI.showImage("Grey", grey);

        HighGUI.waitKey(0);
        Sys.exit(0);
    }
}

