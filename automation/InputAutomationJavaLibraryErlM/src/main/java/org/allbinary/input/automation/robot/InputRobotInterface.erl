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

-module('InputRobotInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getName(This) ->
    erlang:error({abstract_method, getName}).

getHelpSet(This) ->
    erlang:error({abstract_method, getHelpSet}).

createScreenCapture(This, ScreenRect) ->
    erlang:error({abstract_method, createScreenCapture}).

delay(This, Ms) ->
    erlang:error({abstract_method, delay}).

getAutoDelay(This) ->
    erlang:error({abstract_method, getAutoDelay}).

getPixelColor(This, X, Y) ->
    erlang:error({abstract_method, getPixelColor}).

isAutoWaitForIdle(This) ->
    erlang:error({abstract_method, isAutoWaitForIdle}).

keyPress(This, Keycode) ->
    erlang:error({abstract_method, keyPress}).

keyRelease(This, Keycode) ->
    erlang:error({abstract_method, keyRelease}).

getMousePoint(This) ->
    erlang:error({abstract_method, getMousePoint}).

mouseMove(This, X, Y) ->
    erlang:error({abstract_method, mouseMove}).

mousePress(This, Buttons) ->
    erlang:error({abstract_method, mousePress}).

mouseRelease(This, Buttons) ->
    erlang:error({abstract_method, mouseRelease}).

mouseWheel(This, WheelAmt) ->
    erlang:error({abstract_method, mouseWheel}).

setAutoDelay(This, Ms) ->
    erlang:error({abstract_method, setAutoDelay}).

setAutoWaitForIdle(This, IsOn) when is_boolean(IsOn) ->
    erlang:error({abstract_method, setAutoWaitForIdle}).

toString(This) ->
    erlang:error({abstract_method, toString}).

waitForIdle(This) ->
    erlang:error({abstract_method, waitForIdle}).

mouseMove(This, Point) ->
    erlang:error({abstract_method, mouseMove}).

% throws Exception
mouseMoveToTarget(This, Rectangle) ->
    erlang:error({abstract_method, mouseMoveToTarget}).

% throws Exception
mouseMoveToTarget(This, Rectangle, X, Y) ->
    erlang:error({abstract_method, mouseMoveToTarget}).

