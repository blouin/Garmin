import Toybox.Lang;

module Barrel {

    (:Complications)
    module Complications {

        enum ComplicationName {
            COMPLICATED_STEPS,
            COMPLICATED_HR,
            COMPLICATED_WEATHER,
        }

        function getComplication(id as Number or ComplicationName) as ModelUpdater? {
            switch (id) {
                case COMPLICATED_STEPS:
                    return new ComplicationSteps();
                case COMPLICATED_HR:
                    return new ComplicationHeartRate();
                case COMPLICATED_WEATHER:
                    return new ComplicationWeather();
                default:
                    return null;
            }
        }

        class Model {
            var label as String;
            var value as String;

            public function initialize(l as String, v as String) {
                label = l;
                value = v;
            }
        }
        
        (:Complications)
        typedef ModelUpdater as interface {
            function updateModel() as Model;
        };
        
    }

}