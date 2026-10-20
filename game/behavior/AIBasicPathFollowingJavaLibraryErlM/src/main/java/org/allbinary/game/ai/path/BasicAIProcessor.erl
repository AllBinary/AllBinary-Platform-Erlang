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
% package org.allbinary.game.ai.path
% import org.allbinary.util.BasicArrayList
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil
% import org.allbinary.media.graphics.geography.pathfinding.GeographicMapCellPathHistoryInfo

-module('BasicAIProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, geographicMapCellHistory}, undefined),
    put({This, geographicMapCellPositionBasicArrayList}, undefined),
    put({This, geographicMapCellPathHistoryInfo}, undefined),
    put({This, basicAI}, undefined),
    put({This, geographicMapDirectionUtil}, 'GeographicMapDirectionUtil':getInstance()),
    ok.


new(Name, GeographicMapCellHistory, GeographicMapCellPathHistoryInfo, ChosenPathList, AngleInfo, Seed) when (is_list(Name) orelse Name =:= undefined), is_integer(Seed) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, GeographicMapCellHistory, GeographicMapCellPathHistoryInfo, ChosenPathList, AngleInfo, Seed),
    This.

'$init'(This, Name, GeographicMapCellHistory, GeographicMapCellPathHistoryInfo, ChosenPathList, AngleInfo, Seed) when (is_list(Name) orelse Name =:= undefined), is_integer(Seed) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, geographicMapCellHistory}, GeographicMapCellHistory),
        put({This, geographicMapCellPositionBasicArrayList}, ChosenPathList),
        put({This, geographicMapCellPathHistoryInfo}, GeographicMapCellPathHistoryInfo),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):setNewPath(This, GeographicMapCellHistory, ChosenPathList),
        put({This, basicAI}, 'BasicDirectionAIHelper':new((get({This, '$class'})):getName(This), AngleInfo)).

setNewPath(This, GeographicMapCellHistory, ChosenPathList) ->
        (get({This, '$class'})):setGeographicMapCellHistory(This, GeographicMapCellHistory),
        put({This, geographicMapCellPositionBasicArrayList}, ChosenPathList),
        (get({This, '$class'})):init(This).

init(This) ->
        put({This, geographicMapCellPathHistoryInfo}, 'GeographicMapCellPathHistoryInfo':new()),
        (get({get({This, geographicMapCellPathHistoryInfo}), '$class'})):setPreviousOnPathGeographicMapCellPosition(get({This, geographicMapCellPathHistoryInfo}), (get({get({This, geographicMapCellPositionBasicArrayList}), '$class'})):get(get({This, geographicMapCellPositionBasicArrayList}), ((get({get({This, geographicMapCellPositionBasicArrayList}), '$class'})):size(get({This, geographicMapCellPositionBasicArrayList})) - 1))),
        (get({get({This, geographicMapCellPathHistoryInfo}), '$class'})):setNextOnPathGeographicMapCellPosition(get({This, geographicMapCellPathHistoryInfo}), (get({get({This, geographicMapCellPositionBasicArrayList}), '$class'})):get(get({This, geographicMapCellPositionBasicArrayList}), ((get({get({This, geographicMapCellPositionBasicArrayList}), '$class'})):size(get({This, geographicMapCellPositionBasicArrayList})) - 1))),
        (get({This, '$class'})):update(This).

% throws Exception
goTowardNextChosenOnPathPosition(This, CurrentGeographicMapCellPosition) ->
        put({local, keyDirection}, (-1)),
        GoToGeographicMapCellPosition = (get({get({This, geographicMapCellPathHistoryInfo}), '$class'})):getNextChosenOnPathGeographicMapCellPosition(get({This, geographicMapCellPathHistoryInfo})),
        put({local, geographicMapDirectionData}, (get({get({This, geographicMapDirectionUtil}), '$class'})):getDirectionFromCellPositionToAdjacentCellPosition(get({This, geographicMapDirectionUtil}), CurrentGeographicMapCellPosition, GoToGeographicMapCellPosition)),
        case (get({local, geographicMapDirectionData}) =:= get({'DirectionFactory':getInstance(), 'NOT_BORDERED_WITH'})) of
            true ->
            put({local, geographicMapDirectionData}, (get({get({This, geographicMapDirectionUtil}), '$class'})):getDirectionFromCellPositionToCellPosition(get({This, geographicMapDirectionUtil}), CurrentGeographicMapCellPosition, GoToGeographicMapCellPosition));
            false -> ok
        end,
        put({local, keyDirection}, (get({get({This, basicAI}), '$class'})):getAIKeyPressedFromDirection(get({This, basicAI}), get({local, geographicMapDirectionData}))),
        get({local, keyDirection}).

update(This) ->
        (get({get({This, geographicMapCellPathHistoryInfo}), '$class'})):setNextUnvisitedOnPathGeographicMapCellPosition(get({This, geographicMapCellPathHistoryInfo}), (fun(Target_N67271) -> (get({Target_N67271, '$class'})):getFirstUnvisited(Target_N67271) end)((get({This, '$class'})):getGeographicMapCellHistory(This))),
        (get({get({This, geographicMapCellPathHistoryInfo}), '$class'})):setNextChosenOnPathGeographicMapCellPosition(get({This, geographicMapCellPathHistoryInfo}), (get({get({This, geographicMapCellPathHistoryInfo}), '$class'})):getNextUnvisitedOnPathGeographicMapCellPosition(get({This, geographicMapCellPathHistoryInfo}))).

% throws Exception
processAI(This, MyManager, CurrentGeographicMapCellPosition) ->
        put({local, keyDirection}, (-1)),
        case (get({get({This, geographicMapCellPositionBasicArrayList}), '$class'})):contains(get({This, geographicMapCellPositionBasicArrayList}), CurrentGeographicMapCellPosition) of
            true ->
            (get({This, '$class'})):update(This),
            put({local, keyDirection}, (get({This, '$class'})):goTowardNextChosenOnPathPosition(This, CurrentGeographicMapCellPosition)),
            (get({get({This, geographicMapCellPathHistoryInfo}), '$class'})):setPreviousOnPathGeographicMapCellPosition(get({This, geographicMapCellPathHistoryInfo}), CurrentGeographicMapCellPosition);
            false ->
            put({local, keyDirection}, (get({This, '$class'})):goTowardNextChosenOnPathPosition(This, CurrentGeographicMapCellPosition))
        end,
        get({local, keyDirection}).

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getGeographicMapCellPathHistoryInfo(This) ->
        get({This, geographicMapCellPathHistoryInfo}).

setGeographicMapCellPathHistoryInfo(This, GeographicMapCellPathHistoryInfo) ->
        put({This, geographicMapCellPathHistoryInfo}, GeographicMapCellPathHistoryInfo).

getGeographicMapCellHistory(This) ->
        get({This, geographicMapCellHistory}).

setGeographicMapCellHistory(This, GeographicMapCellHistory) ->
        put({This, geographicMapCellHistory}, GeographicMapCellHistory).

