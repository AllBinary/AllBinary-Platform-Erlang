%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.input.automation.robot
% import java.awt
% import java.awt.image.BufferedImage
% import javax.help.HelpSet
% import org.allbinary.input.automation.AbstractInputRobot
% import org.allbinary.input.automation.PointFactory
% import org.allbinary.logic.communication.log.LogUtil

-module('NullInputRobot').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements InputRobotInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractInputRobot', Function, Arguments).

static_init() ->
    put({?MODULE, 'LIBRARY_NAME'}, "null"),
    put({?MODULE, 'NAME'}, "NULL"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AbstractInputRobot':'$init'(This, undefined),
        init_fields(This).

getName(This) ->
        get({'NullInputRobot', 'NAME'}).

getHelpSet(This) ->
        undefined.

getMousePoint(This) ->
        'PointFactory':getInstance(0, 0).

keyPress(This, Keycode) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["KeyCode: ", Keycode]), This, "keyPress").

keyRelease(This, Keycode) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["KeyCode: ", Keycode]), This, "keyRelease").

mouseMove(This, X, Y) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["X: ", X]), " Y: "]), Y]), This, "mouseMove").

mousePress(This, Buttons) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Buttons: ", Buttons]), This, "mousePress").

mouseRelease(This, Buttons) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Buttons: ", Buttons]), This, "mouseRelease").

createScreenCapture(This, ScreenRect) ->
        undefined.

delay(This, Ms) ->
        ok.

getAutoDelay(This) ->
        (-1).

getPixelColor(This, X, Y) ->
        undefined.

isAutoWaitForIdle(This) ->
        false.

mouseWheel(This, WheelAmt) ->
        ok.

setAutoDelay(This, Ms) ->
        ok.

setAutoWaitForIdle(This, IsOn) when is_boolean(IsOn) ->
        ok.

toString(This) ->
        "DirectXWindowsInputRobot".

waitForIdle(This) ->
        ok.

