import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module UI {

    class Background extends WatchUi.Drawable {

        var _green = Graphics.COLOR_DK_GREEN;
        var _blue = Graphics.COLOR_DK_BLUE;
        var _gray = Graphics.COLOR_LT_GRAY;
        var _black = Graphics.COLOR_BLACK;
        var _white = Graphics.COLOR_WHITE;

        public function initialize() {
            Drawable.initialize({});
        }

        function draw(dc as Dc) as Void {

            var _width = dc.getWidth();
            var _height = dc.getHeight();

            dc.setColor(Graphics.COLOR_TRANSPARENT, _gray);
            dc.clear();

            drawTopBar(_width, _height, dc);
            drawSides(_width, _height, dc);
            drawBottomBar(_width, _height, dc);
        }

        hidden function drawTopBar(_width, _height as Number, dc as Dc) as Void {

            // Bar 1
            dc.setColor(_green, _green);
            dc.fillRectangle(0, 0, _width, 45);
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
            //dc.drawText(_width/2, 5, Application.loadResource(Rez.Fonts.courrier), Application.loadResource(Rez.Strings.BG_BIOS), Graphics.TEXT_JUSTIFY_CENTER);
            dc.drawText(_width/2, 5, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_BIOS), Graphics.TEXT_JUSTIFY_CENTER);
            dc.drawText(_width/2, 20, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_SetupUtility), Graphics.TEXT_JUSTIFY_CENTER);

            // Bar 2
            dc.setColor(_blue, _blue); // Bar
            dc.fillRectangle(0, 41, _width, 18);
            dc.setColor(_gray, _gray); // Main block
            dc.fillRectangle(45, 41, 40, 18);
            dc.setColor(_blue, Graphics.COLOR_TRANSPARENT); // Main text
            dc.drawText(48, 41, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_MenuMain), Graphics.TEXT_JUSTIFY_LEFT);
            dc.setColor(_gray, Graphics.COLOR_TRANSPARENT); // Other options text
            dc.drawText(92, 41, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_MenuAdvanced), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(165, 41, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_MenuBoot), Graphics.TEXT_JUSTIFY_LEFT);

            // Bar 3
            dc.setColor(_black, _black);
            dc.drawLine(0, 62, _width, 62);
        }

        hidden function drawSides(_width, _height as Number, dc as Dc) as Void {
            // Todo, would look like this but with appropriate start & end degrees
            // Too lazy to calculate at the moment
            //dc.drawArc(_width/2, _height/2, _height/2, Graphics.ARC_CLOCKWISE, -15, 15);
        }

        hidden function drawBottomBar(_width, _height as Number, dc as Dc) as Void {

            // Bar 1
            dc.setColor(_black, _black);
            dc.drawLine(0, _height - 45, _width, _height - 45);

            // Bar 2
            dc.setColor(_green, _green);
            dc.fillRectangle(0, _height - 40, _width, 40);
            dc.setColor(_black, Graphics.COLOR_TRANSPARENT); // Words
            dc.drawText(85,  _height - 38, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_OptHelp), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(155, _height - 38, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_OptSave), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(135, _height - 23, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_OptExit), Graphics.TEXT_JUSTIFY_LEFT);
            dc.setColor(_white, Graphics.COLOR_TRANSPARENT); // Fx
            dc.drawText(60, _height - 38, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_OptF1), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(130, _height - 38, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_OptF9), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(105, _height - 23, Graphics.FONT_SYSTEM_XTINY, Application.loadResource(Rez.Strings.BG_OptEsc), Graphics.TEXT_JUSTIFY_LEFT);
        }

    }

}