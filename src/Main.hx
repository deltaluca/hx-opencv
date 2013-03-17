import cv.HighGUI;
import cv.Core;
import cv.core.*;
import cv.ImgProc;

class Main {
    static function main() {
        HighGUI.namedWindow("hello3");
        HighGUI.namedWindow("hello4");
//        HighGUI.namedWindow("hello1");
//        HighGUI.namedWindow("hello2");

        var c = HighGUI.captureFromFile("video.avi");
        var width  = Std.int(HighGUI.getCaptureProperty(c, HighGUI.CV_CAP_PROP_FRAME_WIDTH));
        var height = Std.int(HighGUI.getCaptureProperty(c, HighGUI.CV_CAP_PROP_FRAME_HEIGHT));
        var fps = HighGUI.getCaptureProperty(c, HighGUI.CV_CAP_PROP_FPS);

        HighGUI.moveWindow("hello3", 0, Std.int(height/2));
        HighGUI.moveWindow("hello4", Std.int(width/2), Std.int(height/2));
        HighGUI.moveWindow("hello1", 0, 0);
        HighGUI.moveWindow("hello2", Std.int(width/2), 0);

        var out1 = Core.createMat(Std.int(width/2), Std.int(height/2), Core.CV_8UC3);
        var out2 = Core.createMat(Std.int(width/2), Std.int(height/2), Core.CV_8UC3);
        var out3 = Core.createMat(Std.int(width/2), Std.int(height/2), Core.CV_8UC3);
        var out4 = Core.createMat(Std.int(width/2), Std.int(height/2), Core.CV_8UC3);

        var rect1 = Core.rect(0, 0, Std.int(width/2), Std.int(height/2));
        var rect2 = Core.rect(Std.int(width/2), 0, Std.int(width/2), Std.int(height/2));
        var rect3 = Core.rect(0, Std.int(height/2), Std.int(width/2), Std.int(height/2));
        var rect4 = Core.rect(Std.int(width/2), Std.int(height/2), Std.int(width/2), Std.int(height/2));

        var font = Core.createFont(Core.CV_FONT_HERSHEY_TRIPLEX);

        var f;
        var tt = 0;
        while ((f = HighGUI.queryFrame(c)) != null) {
//            switch(Std.int(((tt++)%40)/10)) {
//            case 0: HighGUI.showImage("hello3", Core.getSubRect(f, out3, rect3));
//            case 1: HighGUI.showImage("hello4", Core.getSubRect(f, out4, rect4));
//            case 2: HighGUI.showImage("hello1", Core.getSubRect(f, out1, rect1));
//            case 3: HighGUI.showImage("hello2", Core.getSubRect(f, out2, rect2));
//            }
            Core.circle(out1, Core.point(Std.int(Math.random()*width/2), Std.int(Math.random()*height/2)), 5, Core.scalar(0xff,0xff,0xff), 1, Core.CV_AA);
            Core.circle(out2, Core.point(Std.int(Math.random()*width/1), Std.int(Math.random()*height/1)), 10, Core.scalar(0xff,0xff,0xff), 1, Core.CV_AA, 1);
            Core.line(out3, Core.point(Std.int(Math.random()*width/2), Std.int(Math.random()*height/2)), Core.point(10,10), Core.rgb(0xff,0,0), 1, Core.CV_AA);
            Core.line(out4, Core.point(Std.int(Math.random()*width/2), Std.int(Math.random()*height/2)), Core.point(10,10), Core.rgb(0xff,0xff,0), 1, Core.CV_AA);

            Core.putText(out4, "hello world!", Core.point(10,30), font, Core.rgb(0, 0xff, 0xff));
//            HighGUI.showImage("hello1", out1);
//            HighGUI.showImage("hello2", out2);
            HighGUI.showImage("hello3", out3);
            HighGUI.showImage("hello4", out4);
            ImgProc.sobel(out3, out4, 1, 1);
//            HighGUI.waitKey(Math.round(1000/fps));
            HighGUI.waitKey(1);
        }
    }
}
