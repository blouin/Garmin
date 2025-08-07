import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

using Barrel.Complications as MyComplications;

class FaceView extends WatchUi.WatchFace {

    private var _infoComplications as Array<MyComplications.ModelUpdater>;
    private var _statComplications as Array<MyComplications.ModelUpdater>;

    function initialize() {
        WatchFace.initialize();

        _infoComplications = new Array<MyComplications.ModelUpdater>[0];
        _infoComplications.add(new MyComplications.ComplicationTime());
        _infoComplications.add(new MyComplications.ComplicationDate());
        _infoComplications.add(new MyComplications.ComplicationBattery());

        _statComplications = new Array<MyComplications.ModelUpdater>[0];
        _statComplications.add(new MyComplications.ComplicationSteps());
        _statComplications.add(new MyComplications.ComplicationHeartRate());
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
 
        var c = Application.getApp().getConverter();

        var fg = View.findDrawableById("Foreground") as UI.Foreground;
        fg.setConverter(c);
        fg.setInfoModelUpdaters(_infoComplications);
        fg.setStatModelUpdaters(_statComplications);

        var tb = View.findDrawableById("Tab") as UI.Tab;
        tb.setConverter(c);
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
