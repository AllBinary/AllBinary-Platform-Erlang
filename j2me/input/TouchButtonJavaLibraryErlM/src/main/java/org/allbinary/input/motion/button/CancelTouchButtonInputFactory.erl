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
% import org.allbinary.game.input.InputFactory
% import org.allbinary.logic.NullUtil

-module('CancelTouchButtonInputFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, cancelInputArray}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    ok.


getInstance() ->
        case (get({'CancelTouchButtonInputFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'CancelTouchButtonInputFactory', instance}, 'CancelTouchButtonInputFactory':new());
            false -> ok
        end,
        get({'CancelTouchButtonInputFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        BasicTouchInputFactory = 'BasicTouchInputFactory':getInstance(),
        lists:foreach(fun(Index) ->
            put({This, cancelInputArray}, array:set(Index, get({BasicTouchInputFactory, 'NONE'}), get({This, cancelInputArray})))
        end, lists:seq((array:size(get({This, cancelInputArray})) - 1), 0, -1)),
        put({This, cancelInputArray}, array:set((get({get({BasicTouchInputFactory, 'UP'}), '$class'})):getSourceId(get({BasicTouchInputFactory, 'UP'})), get({BasicTouchInputFactory, 'DOWN'}), get({This, cancelInputArray}))),
        put({This, cancelInputArray}, array:set((get({get({BasicTouchInputFactory, 'DOWN'}), '$class'})):getSourceId(get({BasicTouchInputFactory, 'DOWN'})), get({BasicTouchInputFactory, 'UP'}), get({This, cancelInputArray}))),
        put({This, cancelInputArray}, array:set((get({get({BasicTouchInputFactory, 'LEFT'}), '$class'})):getSourceId(get({BasicTouchInputFactory, 'LEFT'})), get({BasicTouchInputFactory, 'RIGHT'}), get({This, cancelInputArray}))),
        put({This, cancelInputArray}, array:set((get({get({BasicTouchInputFactory, 'RIGHT'}), '$class'})):getSourceId(get({BasicTouchInputFactory, 'RIGHT'})), get({BasicTouchInputFactory, 'LEFT'}), get({This, cancelInputArray}))).

getCancel(This, TouchButtonInput) ->
        array:get((get({TouchButtonInput, '$class'})):getSourceId(TouchButtonInput), get({This, cancelInputArray})).

