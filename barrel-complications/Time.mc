import Toybox.Application;
import Toybox.Time.Gregorian;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;

module Barrel {

    (:Complications)
    module Complications {

        class ComplicationTime {

            public function updateModel() as Model {
                var timeFormat = "$1$:$2$";
                var clockTime = System.getClockTime();
                var hours = clockTime.hour;
                if (!System.getDeviceSettings().is24Hour) {
                    if (hours > 12) {
                        hours = hours - 12;
                    }
                }
                
                var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

                return new Model(Application.loadResource(Rez.Strings.TIME), timeString);
            }
        }
    }
    
}