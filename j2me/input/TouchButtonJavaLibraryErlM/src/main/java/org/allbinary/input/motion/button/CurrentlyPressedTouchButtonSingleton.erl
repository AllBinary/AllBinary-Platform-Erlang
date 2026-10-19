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
% package org.allbinary.input.motion.button
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CurrentlyPressedTouchButtonSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CurrentlyPressedTouchButtonSingleton':new()),
    ok.

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'CurrentlyPressedTouchButtonSingleton', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

size(This) ->
        (get({get({This, list}), '$class'})):size(get({This, list})).

removeAt(This, Index) when is_integer(Index) ->
        (get({get({This, list}), '$class'})):removeAt(get({This, list}), Index).

remove(This, TouchButtonInput) ->
        (get({get({This, list}), '$class'})):remove(get({This, list}), TouchButtonInput).

get(This, Index) when is_integer(Index) ->
        array:get(Index, get({get({This, list}), objectArray})).

contains(This, TouchButtonInput) ->
        (get({get({This, list}), '$class'})):contains(get({This, list}), TouchButtonInput).

add(This, TouchButtonInput) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), TouchButtonInput).

