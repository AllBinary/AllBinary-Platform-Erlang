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
% package org.allbinary.media.image.comparison.color
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.cache.CacheableInterface
% import org.allbinary.string.CommonSeps

-module('ColorDelta').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, rgb1}, 0),
    put({This, rgb2}, 0),
    put({This, key}, undefined),
    ok.


new(Rgb1, Rgb2) when is_integer(Rgb1), is_integer(Rgb2) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Rgb1, Rgb2),
    This.

'$init'(This, Rgb1, Rgb2) when is_integer(Rgb1), is_integer(Rgb2) ->
    init_fields(This),
        (get({This, '$class'})):setRgb1(This, Rgb1),
        (get({This, '$class'})):setRgb2(This, Rgb2),
        put({This, key}, 'ColorDelta':getKey(Rgb1, Rgb2)).

getKey(This) ->
        get({This, key}).

getKey(Rgb1, Rgb2) when is_integer(Rgb1), is_integer(Rgb2) ->
        (fun(Target_N66020) -> (get({Target_N66020, '$class'})):toString(Target_N66020) end)((fun(Target_N66027) -> (get({Target_N66027, '$class'})):append(Target_N66027, allbinary_java:to_string(Rgb2)) end)((fun(Target_N66034) -> (get({Target_N66034, '$class'})):append(Target_N66034, get({'CommonSeps':getInstance(), 'UNDERSCORE'})) end)((fun(Target_N66041) -> (get({Target_N66041, '$class'})):append(Target_N66041, allbinary_java:to_string(Rgb1)) end)('StringMaker':new())))).

getRgb1(This) ->
        get({This, rgb1}).

setRgb1(This, Rgb1) when is_integer(Rgb1) ->
        put({This, rgb1}, Rgb1).

getRgb2(This) ->
        get({This, rgb2}).

setRgb2(This, Rgb2) when is_integer(Rgb2) ->
        put({This, rgb2}, Rgb2).

toString(This) ->
        (fun(Target_N66438) -> (get({Target_N66438, '$class'})):toString(Target_N66438) end)((fun(Target_N66445) -> (get({Target_N66445, '$class'})):appendint(Target_N66445, (get({This, '$class'})):getRgb2(This)) end)((fun(Target_N66452) -> (get({Target_N66452, '$class'})):append(Target_N66452, " RGB2: ") end)((fun(Target_N66459) -> (get({Target_N66459, '$class'})):appendint(Target_N66459, (get({This, '$class'})):getRgb1(This)) end)((fun(Target_N66466) -> (get({Target_N66466, '$class'})):append(Target_N66466, " RGB1: ") end)((fun(Target_N66473) -> (get({Target_N66473, '$class'})):append(Target_N66473, (fun(Target_N66509) -> (get({Target_N66509, '$class'})):toString(Target_N66509, (get({This, '$class'})):getKey(This)) end)('StringUtil':getInstance())) end)((fun(Target_N66480) -> (get({Target_N66480, '$class'})):append(Target_N66480, "ColorDelta: ") end)('StringMaker':new()))))))).

