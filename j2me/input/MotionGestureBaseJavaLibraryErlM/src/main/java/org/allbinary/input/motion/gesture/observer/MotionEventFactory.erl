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
% package org.allbinary.input.motion.gesture.observer
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface

-module('MotionEventFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AllBinaryEventObjectFactoryInterface

static_init() ->
    put({?MODULE, index}, 0),
    ok.

init_fields(This) ->
    put({This, source}, undefined),
    put({This, id}, 0),
    ok.


new(Source, Id) when is_integer(Id) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Source, Id),
    This.

'$init'(This, Source, Id) when is_integer(Id) ->
    init_fields(This),
        put({This, source}, Source),
        put({This, id}, Id),
        put({'MotionEventFactory', index}, (fun(Target_N65993) -> (get({Target_N65993, '$class'})):getId(Target_N65993) end)(get({'TouchMotionGestureFactory':getInstance(), 'LAST_MOTION'}))).

getInstance(This) ->
        try
        InputFactory = 'InputFactory':getInstance(),
        Input = (get({InputFactory, '$class'})):getInstanceById(InputFactory, allbinary_java:first(get({'MotionEventFactory', index}), put({'MotionEventFactory', index}, get({'MotionEventFactory', index}) + 1))),
        case (Input =:= get({InputFactory, 'NO_INPUT'})) of
            true ->
            throw({'$return', 'MotionGestureEvent':new(get({This, source}), get({This, id}), get({'TouchMotionGestureFactory':getInstance(), 'NO_MOTION'}))});
            false ->
            throw({'$return', 'MotionGestureEvent':new(get({This, source}), get({This, id}), Input)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

