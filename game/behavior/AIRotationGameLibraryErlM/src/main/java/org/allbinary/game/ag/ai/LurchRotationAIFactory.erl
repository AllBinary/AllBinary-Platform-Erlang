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
% package org.allbinary.game.ag.ai
% import org.allbinary.ai.ArtificialIntelligenceInterface
% import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.util.ABHashtable

-module('LurchRotationAIFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ArtificialIntelligenceInterfaceFactoryInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'LurchRotationAI':new(OwnerLayerInterface, GameInput).

