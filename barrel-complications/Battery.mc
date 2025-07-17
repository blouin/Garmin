import Toybox.Application;
import Toybox.Time.Gregorian;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;

module Barrel {

    (:Complications)
    module Complications {

        class ComplicationBattery {

            public function updateModel() as Model {
                var stats = System.getSystemStats();
                var battery = stats.battery;
                return new Model(Application.loadResource(Rez.Strings.BATT), battery.format("%02d") + "%");
            }
        }
    }
}