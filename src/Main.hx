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

        var p = Mat.create(256, 512, Core.CV_64F);
        trace(p);
        p.set(0, 0, 123456789.124589e+123);
        trace(p.get(0,0));
        trace(p.get_uchar(0));
        trace(p.get_short(0));
        trace(p.get_int(0));
        trace(p.get_float(0));
        trace(p.get_double(0));

        p.set(10, 10, 123456789.124589e+123);
        p.set(11, 10, 1);
        p.set(12, 10, 1);
        p.set(13, 10, 1);
        p.set(14, 10, 1);
        HighGUI.showImage("hello1", p);
        HighGUI.waitKey();

        var p = Image.create(new Size(512, 256), Core.IPL_DEPTH_8U, 3);
        trace(p);
        HighGUI.showImage("hello1", p);
        HighGUI.waitKey();
    }
}
