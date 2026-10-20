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
% import org.allbinary.logic.string.StringUtil
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('BasicColorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicColorFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NULL_COLOR'}, (get({This, '$class'})):createInstanceARGB(This, 255, 255, 255, 255, "null color")),
    put({This, 'TAN'}, (get({This, '$class'})):createInstance(This, 16#E9D8B5)),
    put({This, 'SKIN_PINK'}, (get({This, '$class'})):createInstance(This, 16#FDCECE)),
    put({This, 'RED'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#FF0000, "red")),
    put({This, 'LIGHT_RED'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#FFA0A0, "light red")),
    put({This, 'DARK_GREEN'}, (get({This, '$class'})):createInstance(This, 16#00FF00)),
    put({This, 'GREEN'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#00DD00, "green")),
    put({This, 'LIGHT_GREEN'}, (get({This, '$class'})):createInstance(This, 16#007700)),
    put({This, 'PURPLE'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#400040, "purple")),
    put({This, 'BLUE'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#0000FF, "blue")),
    put({This, 'LIGHT_BLUE'}, (get({This, '$class'})):createInstance(This, 16#00aaff)),
    put({This, 'VERY_LIGHT_BLUE'}, (get({This, '$class'})):createInstance(This, 16#000033)),
    put({This, 'PUCE'}, (get({This, '$class'})):createInstance(This, 16#FF00AA)),
    put({This, 'AQUA'}, (get({This, '$class'})):createInstance(This, 16#00FFFF)),
    put({This, 'YELLOW'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#FFFF00, "yellow")),
    put({This, 'PINK'}, (get({This, '$class'})):createInstance(This, 16#FF00FF)),
    put({This, 'BLACK'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#000000, "black")),
    put({This, 'GREY'}, (get({This, '$class'})):createInstanceAN(This, get({'BasicColorUtil':getInstance(), 'ALPHA'}), 16#AAAAAA, "grey")),
    put({This, 'LIGHT_GREY'}, (get({This, '$class'})):createInstance(This, 16#C0C0C0)),
    put({This, 'DARK_GREY'}, (get({This, '$class'})):createInstance(This, 16#404040)),
    put({This, 'ORANGE'}, (get({This, '$class'})):createInstance(This, 16#e07718)),
    put({This, 'BROWN'}, (get({This, '$class'})):createInstance(This, 16#956B00)),
    put({This, 'WHITE'}, (get({This, '$class'})):createInstance(This, 16#FFFFFF)),
    put({This, 'TRANSPARENT_COLOR'}, (get({This, '$class'})):createInstanceAN(This, 16#00000000, 16#000000, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    put({This, 'TRANSPARENT_GREY'}, (get({This, '$class'})):createInstanceAN(This, 16#52000000, 16#ECECEC, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    put({This, 'TRANSPARENT_BLACK'}, (get({This, '$class'})):createInstanceAN(This, 16#52000000, 16#000000, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    put({This, 'TRANSPARENT_RED'}, (get({This, '$class'})):createInstanceAN(This, 16#52000000, 16#FF0000, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    put({This, 'CLEAR_COLOR'}, get({This, 'BLACK'})),
    put({This, 'BORDER_COLOR'}, get({This, 'WHITE'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicColorFactory', instance}).

createInstance(This, Value) when is_integer(Value) ->
        'BasicColor':new(get({'BasicColorUtil':getInstance(), 'ALPHA'}), Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

createInstanceA(This, AlphaValue, Value) when is_integer(AlphaValue), is_integer(Value) ->
        'BasicColor':new(AlphaValue, Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

createInstanceAN(This, AlphaValue, Value, Name) when is_integer(AlphaValue), is_integer(Value), (is_list(Name) orelse Name =:= undefined) ->
        'BasicColor':new(AlphaValue, Value, Name).

createInstanceARGB(This, AlphaValue, R, G, B, Name) when is_integer(AlphaValue), is_integer(R), is_integer(G), is_integer(B), (is_list(Name) orelse Name =:= undefined) ->
        ALPHA_MASK = 16#FF000000,
        'BasicColor':new(AlphaValue, (((((((AlphaValue bsl 24)) band ALPHA_MASK)) + ((((R bsl 16)) band 16#00FF0000))) + ((((G bsl 8)) band 16#0000FF00))) + ((B band 16#000000FF))), get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

