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
% package org.allbinary.game.ag.ai.tactical
% import org.allbinary.ai.ArtificialIntelligenceInterface
% import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.ag.ai.InputProbability
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.util.ABHashtable

-module('BasicRandomAIFactory').
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
        Visitor = (get({Hashtable, '$class'})):get(Hashtable, get({'BasicAI', 'AI_VISITOR'})),
        case (Visitor =:= undefined) of
            true ->
            erlang:error({'Exception', "No Visitor Provided"});
            false -> ok
        end,
        InputProbability = (get({Hashtable, '$class'})):get(Hashtable, get({'InputProbability', 'INPUT_PROBABILITY'})),
        'BasicRandomAI':new(OwnerLayerInterface, GameInput, InputProbability, Visitor).

