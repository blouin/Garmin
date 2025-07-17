import Toybox.Lang;

using Barrel.Complications as MyComplications;

module Util {

    class TextBlock {
        var text as String;
        var color as Number;

        public function initialize(t as String, c as Number) {
            text = t;
            color = c;
        }
    }

    typedef Converter as interface {
        function getViewTopYOffset() as Numeric;
         function getViewTopXOffset() as Numeric;

        function getStartDocument(color as Numeric) as Array<TextBlock>;
        function getEndDocument(color as Numeric) as Array<TextBlock>;

        function getStartSection(name as String, color1, color2 as Numeric) as Array<TextBlock>;
        function getEndSection(color1, color2 as Numeric, hasNextSection as Boolean) as Array<TextBlock>;

        function getComplication(color1, color2, color3 as Numeric, hasnextitem as Boolean, model as MyComplications.Model) as Array<TextBlock>;
    };
}