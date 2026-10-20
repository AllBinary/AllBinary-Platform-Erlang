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
% package org.allbinary.direction
% import org.allbinary.logic.string.StringMaker

-module('Direction').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, directionArray}, array:new(13, {default, undefined})),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    put({This, otherName}, undefined),
    put({This, value}, 0),
    put({This, frameFactor}, 0),
    ok.


new(Name, OtherName, Value, FrameFactor) when (is_list(Name) orelse Name =:= undefined), (is_list(OtherName) orelse OtherName =:= undefined), is_integer(Value), is_integer(FrameFactor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, OtherName, Value, FrameFactor),
    This.

'$init'(This, Name, OtherName, Value, FrameFactor) when (is_list(Name) orelse Name =:= undefined), (is_list(OtherName) orelse OtherName =:= undefined), is_integer(Value), is_integer(FrameFactor) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, otherName}, OtherName),
        put({This, value}, Value),
        put({This, frameFactor}, FrameFactor),
        put({'Direction', directionArray}, array:set(Value, This, get({'Direction', directionArray}))).

getInstance(Direction) when is_integer(Direction) ->
        array:get(Direction, get({'Direction', directionArray})).

getValue(This) ->
        get({This, value}).

getFrameFactor(This) ->
        get({This, frameFactor}).

getOtherName(This) ->
        get({This, otherName}).

getName(This) ->
        get({This, name}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Direction: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Or: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getOtherName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Value: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, value})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

