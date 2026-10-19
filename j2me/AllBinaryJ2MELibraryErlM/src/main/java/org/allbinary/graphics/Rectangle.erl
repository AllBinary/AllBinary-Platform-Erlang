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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps

-module('Rectangle').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, point}, undefined),
    put({This, width}, 0),
    put({This, height}, 0),
    ok.


new(Point, Width, Height) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Point, Width, Height),
    This.

init(This, Point, Width, Height) when is_integer(Width), is_integer(Height) ->
    init_fields(This),
        put({This, point}, Point),
        put({This, width}, Width),
        put({This, height}, Height).

getPoint(This) ->
        get({This, point}).

setPoint(This, Point) ->
        put({This, point}, Point).

getMaxX(This) ->
        ((get({get({This, point}), '$class'})):getX(get({This, point})) + get({This, width})).

getMaxY(This) ->
        ((get({get({This, point}), '$class'})):getY(get({This, point})) + get({This, height})).

getWidth(This) ->
        get({This, width}).

setWidth(This, Width) when is_integer(Width) ->
        put({This, width}, Width).

getHeight(This) ->
        get({This, height}).

setHeight(This, Height) when is_integer(Height) ->
        put({This, height}, Height).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66449) -> (get({Target_N66449, '$class'})):toString(Target_N66449) end)((get({This, '$class'})):getPoint(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getWidth(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getHeight(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " MaxX: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMaxX(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " MaxY: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMaxY(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

