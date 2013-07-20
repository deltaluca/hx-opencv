import cv.Core;
import cv.HighGUI;

class Sample1 {
    static function main() {
        haxe.Log.trace = function (m,?_) neko.Lib.println(Std.string(m));

        // Must be done once per application in main thread.
        Core.init();

        var image = null;
        // loadImageM returns a Matrix rather than IPL Image object (loadImage).
        try image = HighGUI.loadImageM("Happy Fish.jpg", HighGUI.LOAD_IMAGE_COLOR)
        catch (_:Dynamic) {
            trace("Couldn't load image");
            Sys.exit(1);
        }

        // Create window and display image.
        HighGUI.namedWindow("Display window", HighGUI.WINDOW_AUTOSIZE);
        HighGUI.showImage("Display window", image);

        // Wait for key stroke before exiting.
        HighGUI.waitKey(0);
        Sys.exit(0);
    }
}
