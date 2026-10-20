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
% package org.allbinary.graphics.color
% import jsinterop.annotations.JsType
% import org.allbinary.logic.string.StringMaker
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('BasicColor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, value}, 0),
    put({This, redComponent}, 0.0),
    put({This, greenComponent}, 0.0),
    put({This, blueComponent}, 0.0),
    put({This, alphaComponent}, 0.0),
    put({This, red}, 0),
    put({This, green}, 0),
    put({This, blue}, 0),
    put({This, alpha}, 0),
    ok.


new(AlphaValue, Value, Name) when is_integer(AlphaValue), is_integer(Value), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AlphaValue, Value, Name),
    This.

'$init'(This, AlphaValue, Value, Name) when is_integer(AlphaValue), is_integer(Value), (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({local, tempValue}, 0),
        BasicColorUtil = 'BasicColorUtil':getInstance(),
        case get({BasicColorUtil, isAlpha}) of
            true ->
            case get({BasicColorUtil, ffOpaque}) of
                true ->
                put({local, tempValue}, (AlphaValue bor Value));
                false ->
                put({local, tempValue}, (16#00000000 bor Value))
            end;
            false ->
            put({local, tempValue}, Value)
        end,
        AlphaInt = ((((get({local, tempValue}) bsr 24)) band 255)),
        put({This, alpha}, AlphaInt),
        put({This, alphaComponent}, ((float(AlphaInt)) / 255.0)),
        RedInt = ((((get({local, tempValue}) bsr 16)) band 255)),
        put({This, red}, RedInt),
        put({This, redComponent}, ((float(RedInt)) / 255.0)),
        GreenInt = ((((get({local, tempValue}) bsr 8)) band 255)),
        put({This, green}, GreenInt),
        put({This, greenComponent}, ((float(GreenInt)) / 255.0)),
        BlueInt = (((get({local, tempValue})) band 255)),
        put({This, blue}, BlueInt),
        put({This, blueComponent}, ((float(BlueInt)) / 255.0)),
        put({This, value}, get({local, tempValue})).

intValue(This) ->
        get({This, value}).

toInt(This) ->
        get({This, value}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "BasicColor: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Alpha: "),
        (get({StringBuffer, '$class'})):appendshort(StringBuffer, get({This, alpha})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Red: "),
        (get({StringBuffer, '$class'})):appendshort(StringBuffer, get({This, red})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Green: "),
        (get({StringBuffer, '$class'})):appendshort(StringBuffer, get({This, green})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Blue: "),
        (get({StringBuffer, '$class'})):appendshort(StringBuffer, get({This, blue})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Value: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, value})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getName(This) ->
        get({This, name}).

getRedComponent(This) ->
        get({This, redComponent}).

getGreenComponent(This) ->
        get({This, greenComponent}).

getBlueComponent(This) ->
        get({This, blueComponent}).

getAlphaComponent(This) ->
        get({This, alphaComponent}).

