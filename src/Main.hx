import cv.HighGUI;
import cv.Core;
import cv.core.*;

class Main {
    static function main() {
        HighGUI.namedWindow("hello1");

        var p = HighGUI.loadImage("mario_dual.jpg");
        var q = p.clone();
        var s = q.clone();
        Core.addWeighted(p, 1.0, q, 2.0, -180.0, s);
        HighGUI.showImage("hello1", s);
        HighGUI.waitKey();

        var c = HighGUI.captureFromFile("video.avi");
        var f;
        while ((f = HighGUI.queryFrame(c)) != null) {
            HighGUI.showImage("hello1", f);
            HighGUI.waitKey(1);
        }
    }
}
