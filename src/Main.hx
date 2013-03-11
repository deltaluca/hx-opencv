import cv.HighGUI;

class Main {
    static function main() {
        HighGUI.namedWindow("hello1");

        HighGUI.setMouseCallback("hello1", function (event:Int, x:Int, y:Int, flag:Int) {
            trace([event,x,y,flag]);
        });

        HighGUI.waitKey();
    }
}
