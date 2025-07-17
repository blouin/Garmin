import Toybox.Application;
import Toybox.Time.Gregorian;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;

module Barrel {

    (:Complications)
    module Complications {

        class ComplicationHeartRate {

            public function updateModel() as Model {
                var info = Activity.getActivityInfo();
                var hr = info.currentHeartRate;
                var hrString = (hr == null) ? "--" : hr.toString();
                return new Model(Application.loadResource(Rez.Strings.HR), hrString);
            }
        }
    }

}