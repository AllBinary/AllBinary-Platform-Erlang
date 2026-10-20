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
% package org.allbinary.input.motion.gyro.action
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent
% import org.allbinary.input.gyro.OrientationMotionGestureFactory
% import org.allbinary.logic.NullUtil

-module('RightOrientationInputToGameKeyEventAction').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameKeyCompleteMotionGestureInputEvent', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        case (get({'RightOrientationInputToGameKeyEventAction', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'RightOrientationInputToGameKeyEventAction', instance}, 'RightOrientationInputToGameKeyEventAction':new());
            false -> ok
        end,
        get({'RightOrientationInputToGameKeyEventAction', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'GameKeyCompleteMotionGestureInputEvent':'$init'(This, "Right Action", get({'OrientationMotionGestureFactory':getInstance(), 'RIGHT'}), (fun(Target_N65988) -> (get({Target_N65988, '$class'})):getInputMapping(Target_N65988) end)((fun(Target_N65995) -> (get({Target_N65995, '$class'})):getPersistentInputMappingInstance(Target_N65995) end)('PlatformInputMappingFactory':getInstance()))).

