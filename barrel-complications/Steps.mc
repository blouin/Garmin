import Toybox.Application;
import Toybox.Time.Gregorian;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;

module Barrel {

    (:Complications)
    module Complications {

        class ComplicationSteps {

            public function updateModel() as Model {
                var info = ActivityMonitor.getInfo();
                return new Model(Application.loadResource(Rez.Strings.STEPS), info.steps.toString());
            }
        }
    }

}