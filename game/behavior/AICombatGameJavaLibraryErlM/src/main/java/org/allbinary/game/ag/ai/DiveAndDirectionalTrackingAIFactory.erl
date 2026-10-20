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
% import org.allbinary.game.ag.ai.tactical.BasicRandomAIFactory
% import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.util.ABHashtable

-module('DiveAndDirectionalTrackingAIFactory').
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


% throws Exception
getInstance(This, Hashtable, OwnerLayerInterface, GameInput) ->
        put({local, visitorCanBeNull}, (get({Hashtable, '$class'})):get(Hashtable, get({'BasicAI', 'AI_VISITOR'}))),
        case (get({local, visitorCanBeNull}) =:= undefined) of
            true ->
            put({local, visitorCanBeNull}, 'ThrustAIVisitorFactory':getInstance());
            false -> ok
        end,
        Hashtable2 = (fun(Target_N65999) -> (get({Target_N65999, '$class'})):getInstance(Target_N65999) end)('BasicProbabilityAIDataFactory':new()),
        (get({Hashtable2, '$class'})):put(Hashtable2, get({'BasicAI', 'AI_VISITOR'}), 'LastKeyAIVisitorFactory':getInstance()),
        ArtificialIntelligenceInterface = (fun(Target_N66127) -> (get({Target_N66127, '$class'})):getInstance(Target_N66127, Hashtable2, OwnerLayerInterface, GameInput) end)('BasicRandomAIFactory':new()),
        'DiveAndDirectionalTrackingAI':new(OwnerLayerInterface, ArtificialIntelligenceInterface, GameInput, get({local, visitorCanBeNull})).

