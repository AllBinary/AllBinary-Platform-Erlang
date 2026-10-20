% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.game.layer
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.math.LayerDistanceUtil
% import org.allbinary.thread.PriorityRunnable
% import org.allbinary.thread.RunnableInterface

-module('WaypointPathRunnableBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RunnableInterface
% implements PriorityRunnable

init_fields(This) ->
    put({This, layerDistanceUtil}, 'LayerDistanceUtil':getInstance()),
    put({This, pathFindingLayer}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    put({This, targetPathFindingLayer}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    put({This, priorityP}, get({'Integer', 'MAX_VALUE'})),
    put({This, runningP}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


isRunning(This) ->
        get({This, runningP}).

setRunning(This, IsRunning) when is_boolean(IsRunning) ->
        put({This, runningP}, IsRunning).

% throws Exception
setThread(This, Thread) ->
        ok.

setTargetLayer(This, WaypointLayer) ->
        put({This, targetPathFindingLayer}, WaypointLayer),
        (get({This, '$class'})):setPriority(This).

setPriority(This) ->
        PathFindingLayer = get({This, pathFindingLayer}),
        TargetLayer = get({This, targetPathFindingLayer}),
        case (TargetLayer =/= undefined) of
            true ->
            Distance = (get({get({This, layerDistanceUtil}), '$class'})):getDistance(get({This, layerDistanceUtil}), TargetLayer, PathFindingLayer),
            DistanceCategory = (Distance div 70),
            put({This, priorityP}, DistanceCategory);
            false -> ok
        end.

getTargetLayer(This) ->
        get({This, targetPathFindingLayer}).

setUnitLayer(This, UnitLayer) ->
        put({This, pathFindingLayer}, UnitLayer).

getPriority(This) ->
        get({This, priorityP}).

isDone(This) ->
        true.

run(This) ->
        ok.

reset(This) ->
        ok.

