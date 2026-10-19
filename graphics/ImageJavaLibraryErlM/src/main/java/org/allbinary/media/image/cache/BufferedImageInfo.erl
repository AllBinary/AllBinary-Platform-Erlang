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
% package org.allbinary.media.image.cache
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels

-module('BufferedImageInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, width}, 0),
    put({This, height}, 0),
    put({This, type}, 0),
    ok.


new(Width, Height, Type) when is_integer(Width), is_integer(Height), is_integer(Type) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Width, Height, Type),
    This.

init(This, Width, Height, Type) when is_integer(Width), is_integer(Height), is_integer(Type) ->
    init_fields(This),
        put({This, width}, Width),
        put({This, height}, Height),
        put({This, type}, Type).

getWidth(This) ->
        get({This, width}).

setWidth(This, Width) when is_integer(Width) ->
        put({This, width}, Width).

getHeight(This) ->
        get({This, height}).

setHeight(This, Height) when is_integer(Height) ->
        put({This, height}, Height).

getType(This) ->
        get({This, type}).

setType(This, Type) when is_integer(Type) ->
        put({This, type}, Type).

toString(This) ->
        CommonLabels = 'CommonLabels':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "BufferedImageInfo -"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getWidth(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getHeight(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Type: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getType(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

