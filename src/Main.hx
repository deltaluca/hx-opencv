import cv.HighGUI;
import cv.Core;
import cv.core.*;

class Main {
    static function main() {
        HighGUI.namedWindow("hello1");
        var p = HighGUI.loadImage("mario_dual.jp");
        trace(p);
        HighGUI.showImage("hello1", p);
        HighGUI.waitKey();
    }
}
