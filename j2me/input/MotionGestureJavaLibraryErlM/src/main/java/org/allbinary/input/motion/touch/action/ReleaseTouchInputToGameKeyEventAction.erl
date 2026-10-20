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
% package org.allbinary.input.motion.touch.action
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.string.CommonStrings

-module('ReleaseTouchInputToGameKeyEventAction').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameKeyCompleteMotionGestureInputEvent', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'NONE'}, get({'GameKeyFactory':getInstance(), 'NONE'})),
    ok.


getInstance() ->
        case (get({'ReleaseTouchInputToGameKeyEventAction', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'ReleaseTouchInputToGameKeyEventAction', instance}, 'ReleaseTouchInputToGameKeyEventAction':new());
            false -> ok
        end,
        get({'ReleaseTouchInputToGameKeyEventAction', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'GameKeyCompleteMotionGestureInputEvent':'$init'(This, "Release Action", get({'TouchMotionGestureFactory':getInstance(), 'RELEASED'}), (fun(Target_N66171) -> (get({Target_N66171, '$class'})):getInputMapping(Target_N66171) end)((fun(Target_N66178) -> (get({Target_N66178, '$class'})):getPersistentInputMappingInstance(Target_N66178) end)('PlatformInputMappingFactory':getInstance()))),
        init_fields(This),
        try
            (get({This, '$class'})):setGameKey(This, get({This, 'NONE'})),
            (get({This, '$class'})):setGameKeyEvent(This, (fun(Target_N66257) -> (get({Target_N66257, '$class'})):getInstanceForInput(Target_N66257, This, get({This, 'NONE'})) end)('GameKeyEventFactory':getInstance()))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end.

update(This) ->
        ok.

