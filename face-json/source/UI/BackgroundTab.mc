import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module UI {

    class BackgroundTab extends WatchUi.Drawable {

        var _blue = Graphics.COLOR_DK_BLUE;
        var _gray = Graphics.COLOR_DK_GRAY;
        var _black = Graphics.COLOR_BLACK;
        var _white = Graphics.COLOR_WHITE;

        var _topX = 55; //85
        var _topY = 0;

        public function initialize() {
            Drawable.initialize({});
        }

        function draw(dc as Dc) as Void {

            var _width = dc.getWidth();

            // Calculate name of tab
            var name = Application.Properties.getValue("Name");
            var ext = getExtension(Application.Properties.getValue("Type"));
            var full = (name + "." + ext + "  x").toLower();

            // Get size of text
            var dim = dc.getTextDimensions(full, Graphics.FONT_XTINY);

            // Draw a top bar, and top of the tab
            dc.setColor(_gray, _gray);
            dc.fillRectangle(0, _topY, _width, dim[1] + 10);

            // Draw the text as a tab
            dc.setColor(_black, _black);
            dc.fillRectangle(_topX, _topY + 5, dim[0] + 10, dim[1] + 5);
            dc.setColor(_blue, _blue);
            dc.drawLine(_topX, _topY + 5, _topX + dim[0] + 10, _topY + 5);
            dc.setColor(_white, Graphics.COLOR_TRANSPARENT);
            dc.drawText(_topX + 5, _topY + 7, Graphics.FONT_XTINY, full, Graphics.TEXT_JUSTIFY_LEFT);
        }

        hidden function getExtension(id as Number) as String {
            if (id == 1) {
                return Application.loadResource(Rez.Strings.TypeYaml);
            }

            return Application.loadResource(Rez.Strings.TypeJson);
        }

    }
}