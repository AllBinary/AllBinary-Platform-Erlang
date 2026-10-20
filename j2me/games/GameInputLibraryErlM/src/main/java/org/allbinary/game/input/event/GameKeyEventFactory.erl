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
% package org.allbinary.game.input.event
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('GameKeyEventFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'TOUCH_BUTTON_SOURCE_ID'}, 2),
    put({This, 'MOTION_GESTURE_SOURCE_ID'}, 3),
    put({This, 'MAX_SOURCES'}, 4),
    put({This, 'ARRAY'}, array:new(get({This, 'MAX_SOURCES'}), {default, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})})),
    ok.


getInstance() ->
        case (get({'GameKeyEventFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameKeyEventFactory', instance}, 'GameKeyEventFactory':new());
            false -> ok
        end,
        get({'GameKeyEventFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This) ->
        NullUtil = 'NullUtil':getInstance(),
        Size = get({'InputFactory':getInstance(), 'MAX'}),
        put({local, index}, get({This, 'MAX_SOURCES'})),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, index2}, Size),
            (fun Loop() -> case (begin put({local, index2}, get({local, index2}) - 1), get({local, index2}) end >= 0) of true ->
                put({This, 'ARRAY'}, array:set(get({local, index}), array:set(get({local, index2}), 'GameKeyEvent':createEvent(get({NullUtil, 'NULL_OBJECT'}), get({local, index}), get({local, index2})), array:get(get({local, index}), get({This, 'ARRAY'}))), get({This, 'ARRAY'}))),
                Loop();
            false -> ok end end)(),
            Loop();
        false -> ok end end)().

% throws Exception
getInstanceForKey(This, AnyType, Key) when is_integer(Key) ->
        GameKeyEvent = array:get(Key, array:get((get({AnyType, '$class'})):getSourceId(AnyType), get({This, 'ARRAY'}))),
        GameKeyEvent.

% throws Exception
getInstanceForInput(This, AnyType, Input) ->
        GameKeyEvent = array:get((get({Input, '$class'})):getId(Input), array:get((get({AnyType, '$class'})):getSourceId(AnyType), get({This, 'ARRAY'}))),
        GameKeyEvent.

