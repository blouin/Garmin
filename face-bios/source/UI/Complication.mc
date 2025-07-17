import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

using Barrel.Complications as MyComplications;

module UI {

    class Complication extends WatchUi.Drawable {

        private var _updater as MyComplications.ModelUpdater?;
        private var _top;
        
        public function initialize(params as { :posIndex as Numeric }) {
            _top = 70 + (params[:posIndex] * 20);
            if (params[:posIndex] > 2) {
                _top = _top + 10;
            }

            Drawable.initialize(params);
        }

        public function setModelUpdater(updater as MyComplications.ModelUpdater?) as Void {
            _updater = updater;
        }

        public function draw(dc as Dc) as Void {            

            if (_updater != null) {

                var model = _updater.updateModel();

                // Label
                dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
                dc.drawText(35, _top, Graphics.FONT_SYSTEM_TINY, model.label, Graphics.TEXT_JUSTIFY_LEFT);

                // Value
                dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
                dc.drawText(115, _top, Graphics.FONT_SYSTEM_TINY, model.value, Graphics.TEXT_JUSTIFY_LEFT);
            }

        }
    }

}