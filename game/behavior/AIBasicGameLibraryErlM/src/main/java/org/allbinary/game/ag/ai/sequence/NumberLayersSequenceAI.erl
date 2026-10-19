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

-module('NumberLayersSequenceAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SequenceAI', Function, Arguments).

init_fields(This) ->
    put({This, numberOfLayersLeft}, 0),
    ok.


new(NumberOfEnemiesLeft, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput) when is_integer(NumberOfEnemiesLeft), (is_tuple(ArtificialIntelligenceInterface) orelse ArtificialIntelligenceInterface =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, NumberOfEnemiesLeft, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput),
    This.

init(This, NumberOfEnemiesLeft, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput) when is_integer(NumberOfEnemiesLeft), (is_tuple(ArtificialIntelligenceInterface) orelse ArtificialIntelligenceInterface =:= undefined) ->
        'SequenceAI':init(This, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, numberOfLayersLeft}, NumberOfEnemiesLeft).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        case ((get({This, '$class'})):getIndex(This) =:= 0) of
            true ->
            case ((get({AllBinaryLayerManager, '$class'})):getSize(AllBinaryLayerManager) < get({This, numberOfLayersLeft})) of
                true ->
                (get({This, '$class'})):setIndex(This, 1);
                false -> ok
            end;
            false -> ok
        end,
        'SequenceAI':processAI(This, AllBinaryLayerManager).

