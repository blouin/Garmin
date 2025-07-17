import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module UI {

    class Background extends WatchUi.Drawable {

        public function initialize() {
            Drawable.initialize({});
        }

        function draw(dc as Dc) as Void {
            dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
            dc.clear();
        }

    }
}