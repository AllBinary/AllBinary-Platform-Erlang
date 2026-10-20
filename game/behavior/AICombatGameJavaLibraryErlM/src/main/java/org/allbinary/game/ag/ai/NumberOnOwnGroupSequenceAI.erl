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
% import org.allbinary.game.ag.ai.sequence.SequenceAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.layer.identification.GroupLayerManagerListener
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('NumberOnOwnGroupSequenceAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SequenceAI', Function, Arguments).

init_fields(This) ->
    put({This, numberOnSameTeam}, undefined),
    ok.


new(NumberOnSameTeam, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput) when (is_tuple(NumberOnSameTeam) orelse NumberOnSameTeam =:= undefined), (is_tuple(ArtificialIntelligenceInterface) orelse ArtificialIntelligenceInterface =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, NumberOnSameTeam, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput),
    This.

'$init'(This, NumberOnSameTeam, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput) when (is_tuple(NumberOnSameTeam) orelse NumberOnSameTeam =:= undefined), (is_tuple(ArtificialIntelligenceInterface) orelse ArtificialIntelligenceInterface =:= undefined) ->
        'SequenceAI':'$init'(This, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, numberOnSameTeam}, NumberOnSameTeam).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        LayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        Index = (get({This, '$class'})):getIndex(This),
        case (array:size(get({This, numberOnSameTeam})) > Index) of
            true ->
            Size = (fun(Target_N66122) -> (get({Target_N66122, '$class'})):getGroupSizeFromInterface(Target_N66122, LayerInterface) end)('GroupLayerManagerListener':getInstance()),
            case ((fun(Target_N66176) -> (get({Target_N66176, '$class'})):intValue(Target_N66176) end)(array:get(Index, get({This, numberOnSameTeam}))) > Size) of
                true ->
                (get({This, '$class'})):next(This);
                false -> ok
            end;
            false -> ok
        end,
        'SequenceAI':processAI(This, AllBinaryLayerManager).

