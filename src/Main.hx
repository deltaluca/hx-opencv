import cv.HighGUI;
import cv.Core;
import cv.core.*;

class Main {
    static function main() {
        HighGUI.namedWindow("hello1");

        HighGUI.setMouseCallback("hello1", function (event:Int, x:Int, y:Int, flag:Int) {
            trace([event,x,y,flag]);
        });

        var p = new Point(1, 2);
        trace(p);
        var p = new Point2D32f(1.23456789, 2.3456789101112);
        trace(p);
        var p = new Point2D64f(1.234567891, 2.3456789101112);
        trace(p);
        var p = new Point3D32f(1.23456789, 2.3456789101112, 1e-200);
        trace(p);
        var p = new Point3D64f(1.234567891, 2.3456789101112, 1e-200);
        trace(p);

        var p = new Size(1, 2);
        trace(p);
        var p = new Size2D32f(1.23456789, 2.3456789101112);
        trace(p);

        var p = new Rect(1, 2, 3, 4);
        trace(p);

        var p = new Scalar(1, 2, 3, 4);
        trace(p);
        trace(p[3]);

        var p = Mat.create(10, 20, Core.CV_64F);
        trace(p);
        trace(p.get(0,0));
        p.set(1, 2, 3);
        trace(p.get(1,2));

        HighGUI.waitKey();
    }
}
