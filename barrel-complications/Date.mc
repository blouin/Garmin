import Toybox.Application;
import Toybox.Time.Gregorian;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;

module Barrel {

    (:Complications)
    module Complications {

        class ComplicationDate {

            public function updateModel() as Model {
                var info = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
                var dateString = Lang.format("$1$/$2$/$3$", [info.year, info.month.format("%02d"), info.day.format("%02d")]);
                return new Model(Application.loadResource(Rez.Strings.DATE), dateString);
            }
        }
    }

}