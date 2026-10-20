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
% package org.allbinary.graphics
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonSeps

-module('GPoint').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'POINT_LABEL'}, "Point: "),
    ok.

init_fields(This) ->
    put({This, x}, 0),
    put({This, y}, 0),
    put({This, z}, 0),
    ok.


getInstance(Point) ->
        'GPoint':new((get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point), (get({Point, '$class'})):getZ(Point)).

new(X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, X, Y, Z),
    This.

'$init'(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
    init_fields(This),
        put({This, x}, X),
        put({This, y}, Y),
        put({This, z}, Z).

getX(This) ->
        get({This, x}).

getY(This) ->
        get({This, y}).

getZ(This) ->
        get({This, z}).

getRawX(This) ->
        get({This, x}).

getRawY(This) ->
        get({This, y}).

getRawZ(This) ->
        get({This, z}).

toString(This) ->
        'GPoint':toStringStatic((get({This, '$class'})):getX(This), (get({This, '$class'})):getY(This), (get({This, '$class'})):getZ(This)).

toStringStatic(X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        StringBuffer = 'StringMaker':new(),
        PositionStrings = 'PositionStrings':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'GPoint', 'POINT_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'X_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, X),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Y_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Y),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Z_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Z),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

