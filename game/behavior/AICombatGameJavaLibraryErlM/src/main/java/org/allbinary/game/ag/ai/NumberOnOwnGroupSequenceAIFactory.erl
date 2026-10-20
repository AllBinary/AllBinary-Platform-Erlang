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
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('NumberOnOwnGroupSequenceAIFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
getInstance(This, Hashtable, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput) when (is_tuple(ArtificialIntelligenceInterface) orelse ArtificialIntelligenceInterface =:= undefined) ->
        IntegerArray = get({'NumberInSameGroupSequence':getInstance(), 'NUMBER_ON_SAME_TEAM_SEQUENCE'}),
        List = 'BasicArrayListD':new(),
        lists:foreach(fun(Index) ->
            IntegerCanBeNull = (get({Hashtable, '$class'})):get(Hashtable, array:get(Index, IntegerArray)),
            case (IntegerCanBeNull =:= undefined) of
                true ->
                throw('$break');
                false -> ok
            end,
            (get({List, '$class'})):add(List, IntegerCanBeNull)
        end, lists:seq(0, array:size(IntegerArray) - 1)),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Total AI Properties: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({List, '$class'})):size(List)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " == Total AI: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:size(ArtificialIntelligenceInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " + 1"),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({CommonStrings, 'GET_INSTANCE'})),
        case ((array:size(ArtificialIntelligenceInterface) - 1) > (get({List, '$class'})):size(List)) of
            true ->
            erlang:error({'Exception', "Not enough AI properties."});
            false -> ok
        end,
        case ((array:size(ArtificialIntelligenceInterface) - 1) < (get({List, '$class'})):size(List)) of
            true ->
            erlang:error({'Exception', "Too Many AI properties."});
            false -> ok
        end,
        NumberOnSameTeam = array:new((get({List, '$class'})):size(List), {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, array:get(Index, get({List, objectArray})), NumberOnSameTeam)
        end, lists:seq(0, array:size(NumberOnSameTeam) - 1)),
        'NumberOnOwnGroupSequenceAI':new(NumberOnSameTeam, ArtificialIntelligenceInterface, OwnerLayerInterface, GameInput).

