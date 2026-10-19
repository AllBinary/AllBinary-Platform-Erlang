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
% package org.allbinary.game.input
% import org.allbinary.game.configuration.persistance.GamePersistanceStrings
% import org.allbinary.game.input.mapping.PersistentInputMapping
% import org.allbinary.input.motion.button.BasicTouchInputFactory
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.input.motion.gesture.TrackballMotionGestureFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('PCGameInputMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PersistentInputMapping', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'PersistentInputMapping':init(This, get({'GamePersistanceStrings':getInstance(), 'SAVED_INPUT_CONFIGURATION_RECORD_ID'})).

% throws Exception
init(This, AbeClientInformation) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'INIT'})),
        'PCKeyFactory':getInstance(),
        'TouchMotionGestureFactory':getInstance(),
        'TrackballMotionGestureFactory':getInstance(),
        'BasicTouchInputFactory':getInstance(),
        'PersistentInputMapping':init(This, AbeClientInformation),
        case (((get({This, '$class'})):getTotalMapped(This) =:= 0) orelse (get({This, '$class'})):isDefaultNew(This)) of
            true ->
            (fun(Target_N66099) -> (get({Target_N66099, '$class'})):addMapping(Target_N66099, (get({This, '$class'})):getDefault(This)) end)((get({This, '$class'})):getInputMapping(This)),
            (get({This, '$class'})):save(This, AbeClientInformation);
            false -> ok
        end.

isDelete(This, Input) ->
        try
        case (Input =:= get({'PCKeyFactory':getInstance(), 'DEL'})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isSystemInput(This, Input) ->
        false.

