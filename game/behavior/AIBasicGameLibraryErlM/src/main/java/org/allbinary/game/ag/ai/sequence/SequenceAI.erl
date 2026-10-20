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
% import org.allbinary.ai.ArtificialIntelligence
% import org.allbinary.ai.ArtificialIntelligenceInterface
% import org.allbinary.ai.ArtificialIntelligenceTransitionInterface
% import org.allbinary.game.ag.ai.ArrayAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('SequenceAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ArrayAI', Function, Arguments).

static_init() ->
    put({?MODULE, 'SEQUENCE_AI'}, "Sequence AI"),
    ok.

init_fields(This) ->
    put({This, index}, 0),
    ok.


new(ArtificialIntelligenceInterfaceArray, OwnerLayerInterface, GameInput) when (is_tuple(ArtificialIntelligenceInterfaceArray) orelse ArtificialIntelligenceInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ArtificialIntelligenceInterfaceArray, OwnerLayerInterface, GameInput),
    This.

'$init'(This, ArtificialIntelligenceInterfaceArray, OwnerLayerInterface, GameInput) when (is_tuple(ArtificialIntelligenceInterfaceArray) orelse ArtificialIntelligenceInterfaceArray =:= undefined) ->
        'ArrayAI':'$init'(This, ArtificialIntelligenceInterfaceArray, OwnerLayerInterface, GameInput),
        init_fields(This).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        (fun(Target_N66067) -> (get({Target_N66067, '$class'})):processAI(Target_N66067, AllBinaryLayerManager) end)(array:get(get({This, index}), (get({This, '$class'})):getArtificialIntelligenceInterface(This))).

next(This) ->
        put({This, index}, get({This, index}) + 1),
        ArtificialIntelligenceInterface = (get({This, '$class'})):getSelectedArtificialIntelligenceInterface(This),
        case ((get({ArtificialIntelligenceInterface, '$class'})):getId(ArtificialIntelligenceInterface) =:= get({'ArtificialIntelligence', 'AI_ID'})) of
            true ->
            ArtificialIntelligenceTransitionInterface = ArtificialIntelligenceInterface,
            (get({ArtificialIntelligenceTransitionInterface, '$class'})):transition(ArtificialIntelligenceTransitionInterface);
            false -> ok
        end.

getIndex(This) ->
        get({This, index}).

setIndex(This, Index) when is_integer(Index) ->
        put({This, index}, Index).

getSelectedArtificialIntelligenceInterface(This) ->
        array:get(get({This, index}), (get({This, '$class'})):getArtificialIntelligenceInterface(This)).

getName(This) ->
        get({'SequenceAI', 'SEQUENCE_AI'}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'ArrayAI':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Selected AI: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66768) -> (get({Target_N66768, '$class'})):toString(Target_N66768, (get({This, '$class'})):getSelectedArtificialIntelligenceInterface(This)) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

