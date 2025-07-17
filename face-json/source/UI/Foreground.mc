import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

using Barrel.Complications as MyComplications;

module UI {

    class Foreground extends WatchUi.Drawable {

        private var _converter as Util.Converter?;
        private var _infoUpdaters as Array<MyComplications.ModelUpdater>;
        private var _statsUpdaters as Array<MyComplications.ModelUpdater>;

        var _topX = 35;
        var _topY = 25;
        var _font = Graphics.FONT_SYSTEM_XTINY;

        var _gray = Graphics.COLOR_LT_GRAY;
        var _yellow = Graphics.COLOR_YELLOW;
        var _blue = Graphics.COLOR_BLUE;
        var _purple = Graphics.COLOR_PURPLE;
        var _red = Graphics.COLOR_RED;
        
        public function initialize(params as { :id as String }) {
            Drawable.initialize(params);
            _infoUpdaters = new Array<MyComplications.ModelUpdater>[0];
            _statsUpdaters = new Array<MyComplications.ModelUpdater>[0];
        }

        public function setConverter(converter as Util.Converter) as Void {
            _converter = converter;
        }

        public function setInfoModelUpdaters(updaters as Array<MyComplications.ModelUpdater>) as Void {
            _infoUpdaters = updaters;
        }

        public function setStatModelUpdaters(updaters as Array<MyComplications.ModelUpdater>) as Void {
            _statsUpdaters = updaters;
        }

        public function draw(dc as Dc) as Void {            
            if (_converter != null) {

                var topY = _topY + _converter.getViewTopYOffset();
                var lh = dc.getFontHeight(_font);

                // Open document
                topY = drawLine(_topX + _converter.getViewTopXOffset(), topY, lh, _converter.getStartDocument(_yellow), dc);

                // Render sections
                topY = drawSection(Application.loadResource(Rez.Strings.SectionInfo), topY, lh, true, _infoUpdaters, dc);
                topY = drawSection(Application.loadResource(Rez.Strings.SectionHealth), topY, lh, false, _statsUpdaters, dc);

                // Close document
                topY = drawLine(_topX, topY, lh, _converter.getEndDocument(_yellow), dc);
            }
        }
        hidden function drawSection(name as String, topY, lh as Number, hasNextSection as Boolean, updaters as Array<MyComplications.ModelUpdater>, dc as Dc) as Number {

            // Open section
            topY = drawLine(_topX + 10, topY, lh, _converter.getStartSection(name, _blue, _purple), dc);

            // Section content
            for (var index = 0; index < updaters.size(); index++) {
                var model = updaters[index].updateModel();
                var textBlocks = _converter.getComplication(_blue, _gray, _red, index < updaters.size() - 1, model);
                topY = drawLine(_topX + 20, topY, lh, textBlocks, dc);
            }

            // Close section            
            topY = drawLine(_topX + 10, topY, lh, _converter.getEndSection(_purple, _gray, hasNextSection), dc);
            
            return topY; // return new topY position for next block
        }

         hidden function drawLine(topX, topY, lh as Numeric, blocks as Array<Util.TextBlock>, dc as Dc) as Numeric {

            if (blocks.size() == 0) {
                return topY;
            }

            for (var index = 0; index < blocks.size(); index++) {
                var block = blocks[index];

                dc.setColor(blocks[index].color, Graphics.COLOR_TRANSPARENT);
                dc.drawText(topX, topY, _font, block.text, Graphics.TEXT_JUSTIFY_LEFT);
                topX += dc.getTextWidthInPixels(block.text, _font);
            }

            return topY + lh; // return new topY position for next block
         }
    }

}