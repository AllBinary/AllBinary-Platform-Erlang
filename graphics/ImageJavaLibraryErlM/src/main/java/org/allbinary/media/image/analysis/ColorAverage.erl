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
% package org.allbinary.media.image.analysis
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('ColorAverage').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, avgRed}, 0.0),
    put({This, avgGreen}, 0.0),
    put({This, avgBlue}, 0.0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):setAvgRed(This, 0),
        (get({This, '$class'})):setAvgGreen(This, 0),
        (get({This, '$class'})):setAvgBlue(This, 0).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getAvgRed(): "),
        (get({StringBuffer, '$class'})):appendfloat(StringBuffer, (get({This, '$class'})):getAvgRed(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getAvgRed(): "),
        (get({StringBuffer, '$class'})):appendfloat(StringBuffer, (get({This, '$class'})):getAvgRed(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getAvgGreen(): "),
        (get({StringBuffer, '$class'})):appendfloat(StringBuffer, (get({This, '$class'})):getAvgGreen(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getAvgRed(This) ->
        get({This, avgRed}).

setAvgRed(This, AvgRed) ->
        put({This, avgRed}, AvgRed).

getAvgGreen(This) ->
        get({This, avgGreen}).

setAvgGreen(This, AvgGreen) ->
        put({This, avgGreen}, AvgGreen).

getAvgBlue(This) ->
        get({This, avgBlue}).

setAvgBlue(This, AvgBlue) ->
        put({This, avgBlue}, AvgBlue).

