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
% package org.allbinary.android.input.motion
% import org.allbinary.game.input.analog.AnalogLocationInput
% import org.allbinary.game.input.analog.AnalogLocationInputFactory
% import org.allbinary.layer.AllBinaryLayerManager

-module('SingleAnalogControllerVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AnalogControllerVisitor', Function, Arguments).

init_fields(This) ->
    put({This, playerInputId}, 0),
    ok.


new(PlayerInputId) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PlayerInputId),
    This.

init(This, PlayerInputId) when is_integer(PlayerInputId) ->
    'AnalogControllerVisitor':init(This),
    init_fields(This),
        put({This, playerInputId}, PlayerInputId).

process(This, AllbinaryLayerManager, AnalogLocationInputProcessor) ->
        AnalogLocationInput = (fun(Target_N65823) -> (get({Target_N65823, '$class'})):getInstanceForPlayer(Target_N65823, get({This, playerInputId})) end)('AnalogLocationInputFactory':getInstance()),
        (get({AnalogLocationInputProcessor, '$class'})):process(AnalogLocationInputProcessor, AllbinaryLayerManager, AnalogLocationInput).

