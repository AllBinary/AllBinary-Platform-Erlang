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
% package org.allbinary.game.ag.ai.sequence
% import org.allbinary.ai.ArtificialIntelligenceInterface
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('ComboSequenceAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SequenceAI', Function, Arguments).

init_fields(This) ->
    ok.


new(ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput) when (is_tuple(ArtificialIntelligenceInterface) orelse ArtificialIntelligenceInterface =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput),
    This.

init(This, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput) when (is_tuple(ArtificialIntelligenceInterface) orelse ArtificialIntelligenceInterface =:= undefined) ->
        'SequenceAI':init(This, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        ArtificialIntelligenceInterfaceArray = (get({This, '$class'})):getArtificialIntelligenceInterface(This),
        Size = array:size(ArtificialIntelligenceInterfaceArray),
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):setIndex(This, Index),
            'SequenceAI':processAI(This, AllBinaryLayerManager)
        end, lists:seq(0, Size - 1)).

