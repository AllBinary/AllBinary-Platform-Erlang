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
% package org.allbinary.input.automation
% import java.awt
% import javax.help.HelpSet
% import org.allbinary.logic.communication.log.LogUtil

-module('AbstractInputRobot').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, helpSet}, undefined),
    ok.


new(HelpSet) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HelpSet),
    This.

init(This, HelpSet) ->
    init_fields(This),
        (get({This, '$class'})):setHelpSet(This, HelpSet).

getHelpSet(This) ->
        get({This, helpSet}).

mouseMove(This, Point) ->
        (get({This, '$class'})):mouseMove(This, get({Point, x}), get({Point, y})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Moved Mouse To: x: ", get({Point, x})]), " y: "]), get({Point, y})]), This, "moveMouse").

% throws Exception
mouseMoveToTarget(This, Rectangle, X, Y) ->
        Point = 'PointHelper':getCenterPoint(Rectangle),
        (get({This, '$class'})):mouseMove(This, (get({Point, x}) + X), (get({Point, y}) + Y)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["Moved Mouse To: x: ", get({Point, x})]), " y: "]), get({Point, y})]), " in the middle of: "]), Rectangle]), This, "moveMouseToTarget").

% throws Exception
mouseMoveToTarget(This, Rectangle) ->
        (get({This, '$class'})):mouseMoveToTarget(This, Rectangle, 0, 0).

mouseMove(This, X, Y) ->
        erlang:error({'RuntimeException'}).

setHelpSet(This, HelpSet) ->
        put({This, helpSet}, HelpSet).

