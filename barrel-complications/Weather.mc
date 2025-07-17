import Toybox.Application;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Weather;

module Barrel {

    (:Complications)
    module Complications {

        class ComplicationWeather {

            public function updateModel() as Model {
                var info = Weather.getCurrentConditions();
                var temp = (info == null) ? 0 : info.temperature;

                // TODO: Convert to F depending on DeviceSettings
                //System.println(System.getDeviceSettings().temperatureUnits);

                var tempString = (info == null) ? "--" : temp.toString();
                return new Model(Application.loadResource(Rez.Strings.HR), tempString);
            }
        }
    }

}