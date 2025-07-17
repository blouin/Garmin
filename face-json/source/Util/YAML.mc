import Toybox.Lang;

using Barrel.Complications as MyComplications;

module Util {

    class YAML {
        function getViewTopYOffset() as Numeric {
            return 15;
        }

        function getViewTopXOffset() as Numeric {
            return 10;
        }

        function getStartDocument(color as Numeric) as Array<Util.TextBlock> {
            var tb = new Array<TextBlock>[0];
            tb.add(new TextBlock("---", color));
            return tb;
        }

        function getEndDocument(color as Numeric) as Array<Util.TextBlock> {
            return new Array<TextBlock>[0];
        }

        function getStartSection(name as String, color1, color2 as Numeric) as Array<TextBlock> {
            var tb = new Array<TextBlock>[0];
            tb.add(new TextBlock(name, color1));
            tb.add(new TextBlock(":", color2));
            return tb;
        }

        function getEndSection(color1, color2 as Numeric, hasNextSection as Boolean) as Array<TextBlock> {
            return new Array<TextBlock>[0];
        }

        function getComplication(color1, color2, color3 as Numeric, hasNextItem as Boolean, model as MyComplications.Model) as Array<TextBlock> {
            var tb = new Array<TextBlock>[0];
            tb.add(new TextBlock(model.label.toLower(), color1));
            tb.add(new TextBlock(": ", color2));
            tb.add(new TextBlock("\"" +  model.value + "\"", color3));
            return tb;
        }
    }
}