import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

using Barrel.Complications as MyComplications;

class FaceView extends WatchUi.WatchFace {

    private var _time = new MyComplications.ComplicationTime();
    private var _date = new MyComplications.ComplicationDate();
    private var _batt = new MyComplications.ComplicationBattery();
    
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));

        // Set built-in complication 
        (View.findDrawableById("Time") as UI.Complication).setModelUpdater(_time);
        (View.findDrawableById("Date") as UI.Complication).setModelUpdater(_date);
        (View.findDrawableById("Batt") as UI.Complication).setModelUpdater(_batt);

        // Set optional complications
        var extra1 = View.findDrawableById("Extra1") as UI.Complication;
        var prop1 = Application.Properties.getValue("Complication1");
        extra1.setModelUpdater(MyComplications.getComplication(prop1));

        var extra2 = View.findDrawableById("Extra2") as UI.Complication;
        var prop2 = Application.Properties.getValue("Complication2");
        extra2.setModelUpdater(MyComplications.getComplication(prop2));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
