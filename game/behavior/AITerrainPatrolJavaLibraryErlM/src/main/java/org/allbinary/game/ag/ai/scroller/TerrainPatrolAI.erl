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
% package org.allbinary.game.ag.ai.scroller
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.terrain.BasicTerrainInfo
% import org.allbinary.game.terrain.TerrainEvent
% import org.allbinary.game.terrain.TerrainEventCircularStaticPool
% import org.allbinary.game.terrain.TerrainEventHandler
% import org.allbinary.game.terrain.TerrainEventListener
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleFactory
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList

-module('TerrainPatrolAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PacePatrolAI', Function, Arguments).

init_fields(This) ->
    put({This, terrainEventListener}, 'TerrainEventListener':new()),
    put({This, 'DOWN'}, get({'AngleFactory':getInstance(), 'DOWN'})),
    put({This, 'CLIFF'}, 'BasicTerrainInfo':new(get({This, 'DOWN'}))),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'PacePatrolAI':'$init'(This, Hashtable, OwnerLayerInterface, GameInput),
        init_fields(This),
        (fun(Target_N66120) -> (get({Target_N66120, '$class'})):addListener(Target_N66120, get({This, terrainEventListener})) end)('TerrainEventHandler':getInstance(OwnerLayerInterface)),
        (get({get({This, terrainEventListener}), '$class'})):onTerrainEvent(get({This, terrainEventListener}), (fun(Target_N66193) -> (get({Target_N66193, '$class'})):getNext(Target_N66193, get({This, 'CLIFF'})) end)('TerrainEventCircularStaticPool':getInstance())).

update(This) ->
        'PacePatrolAI':update(This),
        (get({This, '$class'})):changeDirectionIfCliffReached(This).

changeDirectionIfCliffReached(This) ->
        List = (get({get({This, terrainEventListener}), '$class'})):getList(get({This, terrainEventListener})),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            TerrainEvent = (get({List, '$class'})):removeAt(List, Index),
            BasicTerrainInfo = (get({TerrainEvent, '$class'})):getBasicTerrainInfo(TerrainEvent),
            Angle = (get({BasicTerrainInfo, '$class'})):getAngle(BasicTerrainInfo),
            case (Angle =:= get({This, 'DOWN'})) of
                true ->
                (get({This, '$class'})):nextDirection(This),
                case (not get({This, isFollowLimitedByTerrain})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Following Limited", This, "onTerrainEvent"),
                    put({This, isFollowLimitedByTerrain}, true);
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

