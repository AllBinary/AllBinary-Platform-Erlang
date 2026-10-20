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
% package org.allbinary.media.image.comparison.pixel
% import org.allbinary.graphics.GPoint
% import org.allbinary.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.CacheableInterface
% import org.allbinary.media.image.comparison.color.ColorDelta
% import org.allbinary.string.CommonSeps

-module('PixelDelta').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, point}, undefined),
    put({This, colorDelta}, undefined),
    put({This, key}, undefined),
    ok.


new(Point, ColorDelta) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Point, ColorDelta),
    This.

'$init'(This, Point, ColorDelta) ->
    init_fields(This),
        (get({This, '$class'})):setPoint(This, Point),
        (get({This, '$class'})):setColorDelta(This, ColorDelta),
        put({This, key}, 'PixelDelta':getKey((get({This, '$class'})):getPoint(This), (get({This, '$class'})):getColorDelta(This))).

getKey(This) ->
        get({This, key}).

getKey(Point, ColorDelta) ->
        (fun(Target_N66097) -> (get({Target_N66097, '$class'})):toString(Target_N66097) end)((fun(Target_N66104) -> (get({Target_N66104, '$class'})):append(Target_N66104, (fun(Target_N66206) -> (get({Target_N66206, '$class'})):toString(Target_N66206) end)((get({ColorDelta, '$class'})):getKey(ColorDelta))) end)((fun(Target_N66111) -> (get({Target_N66111, '$class'})):append(Target_N66111, get({'CommonSeps':getInstance(), 'UNDERSCORE'})) end)((fun(Target_N66118) -> (get({Target_N66118, '$class'})):appendint(Target_N66118, trunc((fun(Target_N66139) -> (get({Target_N66139, '$class'})):hashCode(Target_N66139, Point) end)('TsUtil':getInstance()))) end)('StringMaker':new())))).

getPoint(This) ->
        get({This, point}).

setPoint(This, Point) ->
        put({This, point}, Point).

getColorDelta(This) ->
        get({This, colorDelta}).

setColorDelta(This, ColorDelta) ->
        put({This, colorDelta}, ColorDelta).

toString(This) ->
        (fun(Target_N66544) -> (get({Target_N66544, '$class'})):toString(Target_N66544) end)((fun(Target_N66551) -> (get({Target_N66551, '$class'})):append(Target_N66551, (get({get({This, colorDelta}), '$class'})):toString(get({This, colorDelta}))) end)((fun(Target_N66558) -> (get({Target_N66558, '$class'})):append(Target_N66558, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N66565) -> (get({Target_N66565, '$class'})):append(Target_N66565, (get({get({This, point}), '$class'})):toString(get({This, point}))) end)((fun(Target_N66572) -> (get({Target_N66572, '$class'})):append(Target_N66572, "PixelDelta: Point: ") end)('StringMaker':new()))))).

