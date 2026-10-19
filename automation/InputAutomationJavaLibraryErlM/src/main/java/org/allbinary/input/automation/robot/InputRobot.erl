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
% import org.allbinary.input.automation.PointHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('InputRobot').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements InputRobotInterface

static_init() ->
    put({?MODULE, 'NAME'}, "Java Robot"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, robot}, undefined),
    ok.


new(GraphicsDevice) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GraphicsDevice),
    This.

init(This, GraphicsDevice) ->
    init_fields(This),
        put({This, robot}, 'Robot':new(GraphicsDevice)).

getName(This) ->
        get({'InputRobot', 'NAME'}).

getHelpSet(This) ->
        undefined.

getMousePoint(This) ->
        Point = (fun(Target_N66122) -> (get({Target_N66122, '$class'})):getLocation(Target_N66122) end)('MouseInfo':getPointerInfo()),
        Point.

% throws Exception
mouseMoveToTarget(This, Rectangle, X, Y) ->
        Point = 'PointHelper':getCenterPoint(Rectangle),
        (get({get({This, robot}), '$class'})):mouseMove(get({This, robot}), (get({Point, x}) + X), (get({Point, y}) + Y)),
        Message = (fun(Target_N66367) -> (get({Target_N66367, '$class'})):toString(Target_N66367) end)((fun(Target_N66374) -> (get({Target_N66374, '$class'})):append(Target_N66374, (fun(Target_N66494) -> (get({Target_N66494, '$class'})):toString(Target_N66494, Rectangle) end)('StringUtil':getInstance())) end)((fun(Target_N66381) -> (get({Target_N66381, '$class'})):append(Target_N66381, " in the middle of: ") end)((fun(Target_N66388) -> (get({Target_N66388, '$class'})):appendint(Target_N66388, trunc(get({Point, y}))) end)((fun(Target_N66395) -> (get({Target_N66395, '$class'})):append(Target_N66395, " y: ") end)((fun(Target_N66402) -> (get({Target_N66402, '$class'})):appendint(Target_N66402, trunc(get({Point, x}))) end)((fun(Target_N66409) -> (get({Target_N66409, '$class'})):append(Target_N66409, "Moved Mouse To: x: ") end)('StringMaker':new()))))))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Message, This, "moveMouseToTarget").

mouseMove(This, Point) ->
        (get({This, '$class'})):mouseMove(This, get({Point, x}), get({Point, y})).

mouseMove(This, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, robot}), '$class'})):mouseMove(get({This, robot}), X, Y),
        Message = (fun(Target_N66855) -> (get({Target_N66855, '$class'})):toString(Target_N66855) end)((fun(Target_N66862) -> (get({Target_N66862, '$class'})):appendint(Target_N66862, Y) end)((fun(Target_N66869) -> (get({Target_N66869, '$class'})):append(Target_N66869, " y: ") end)((fun(Target_N66876) -> (get({Target_N66876, '$class'})):appendint(Target_N66876, X) end)((fun(Target_N66883) -> (get({Target_N66883, '$class'})):append(Target_N66883, "Moved Mouse To: x: ") end)('StringMaker':new()))))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Message, This, "moveMouse");
mouseMove(This, X, Y) ->
        (get({get({This, robot}), '$class'})):mouseMove(get({This, robot}), X, Y).

% throws Exception
mouseMoveToTarget(This, Rectangle) ->
        (get({This, '$class'})):mouseMoveToTarget(This, Rectangle, 0, 0).

createScreenCapture(This, ScreenRect) ->
        (get({get({This, robot}), '$class'})):createScreenCapture(get({This, robot}), ScreenRect).

delay(This, Ms) ->
        (get({get({This, robot}), '$class'})):delay(get({This, robot}), Ms).

getAutoDelay(This) ->
        (get({get({This, robot}), '$class'})):getAutoDelay(get({This, robot})).

getPixelColor(This, X, Y) ->
        (get({get({This, robot}), '$class'})):getPixelColor(get({This, robot}), X, Y).

isAutoWaitForIdle(This) ->
        (get({get({This, robot}), '$class'})):isAutoWaitForIdle(get({This, robot})).

keyPress(This, Keycode) ->
        (get({get({This, robot}), '$class'})):keyPress(get({This, robot}), Keycode).

keyRelease(This, Keycode) ->
        (get({get({This, robot}), '$class'})):keyRelease(get({This, robot}), Keycode).


mousePress(This, Buttons) ->
        (get({get({This, robot}), '$class'})):mousePress(get({This, robot}), Buttons).

mouseRelease(This, Buttons) ->
        (get({get({This, robot}), '$class'})):mouseRelease(get({This, robot}), Buttons).

mouseWheel(This, WheelAmt) ->
        (get({get({This, robot}), '$class'})):mouseWheel(get({This, robot}), WheelAmt).

setAutoDelay(This, Ms) ->
        (get({get({This, robot}), '$class'})):setAutoDelay(get({This, robot}), Ms).

setAutoWaitForIdle(This, IsOn) when is_boolean(IsOn) ->
        (get({get({This, robot}), '$class'})):setAutoWaitForIdle(get({This, robot}), IsOn).

toString(This) ->
        (get({get({This, robot}), '$class'})):toString(get({This, robot})).

waitForIdle(This) ->
        (get({get({This, robot}), '$class'})):waitForIdle(get({This, robot})).

on(This) ->
        ok.

off(This) ->
        ok.

