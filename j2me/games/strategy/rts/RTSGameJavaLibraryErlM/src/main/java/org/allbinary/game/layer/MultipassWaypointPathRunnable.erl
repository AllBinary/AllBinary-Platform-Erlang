% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% import org.allbinary.logic.NullUtil
% import org.allbinary.thread.ARunnable
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.pathfinding.MultipassState
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('MultipassWaypointPathRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointPathRunnableBase', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    put({This, multipassState}, 'MultipassState':new()),
    put({This, done}, false),
    put({This, list}, (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))),
    put({This, pathFindingInfo}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({This, 'FIRST_RUNNABLE'}, 'FirstRunnable':new(This)),
    put({This, 'SECOND_RUNNABLE'}, 'SecondRunnable':new(This)),
    put({This, 'END_RUNNABLE'}, 'EndRunnable':new(This)),
    put({This, 'ALREADY_ENDED_RUNNABLE'}, 'ARunnable':new() % Java anonymous class body: implement it as a module
%         ok % run
),
    put({This, currentPassRunnable}, get({This, 'FIRST_RUNNABLE'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'WaypointPathRunnableBase':'$init'(This),
    init_fields(This),
        ok.

setRunning(This, IsRunning) when is_boolean(IsRunning) ->
        put({This, runningP}, IsRunning),
        case get({This, runningP}) of
            true ->
            (get({This, '$class'})):reset(This),
            put({This, done}, false);
            false -> ok
        end.

run(This) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            (get({get({This, currentPassRunnable}), '$class'})):run(get({This, currentPassRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E),
            (get({This, '$class'})):setRunning(This, false)
        end.

reset2(This) ->
        put({get({This, multipassState}), step}, 0),
        put({get({This, multipassState}), iteration}, 0),
        put({get({This, multipassState}), iteration2}, 0),
        put({This, pathFindingInfo}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})).

finish(This) ->
        (get({This, '$class'})):reset2(This),
        put({This, currentPassRunnable}, get({This, 'ALREADY_ENDED_RUNNABLE'})),
        put({This, done}, true).

isDone(This) ->
        get({This, done}).

reset(This) ->
        (get({This, '$class'})):reset2(This),
        put({This, currentPassRunnable}, get({This, 'FIRST_RUNNABLE'})),
        put({This, done}, false).

processFirstRunnable(This) ->
        try
            (fun(Target_N67927) -> (get({Target_N67927, '$class'})):start(Target_N67927, get({This, pathFindingLayer})) end)((get({get({This, pathFindingLayer}), '$class'})):getWaypointRunnableLogHelper(get({This, pathFindingLayer}))),
            (get({This, '$class'})):reset2(This),
            GeographicMapCellPosition = (get({get({This, pathFindingLayer}), '$class'})):getCurrentGeographicMapCellPosition(get({This, pathFindingLayer})),
            case (GeographicMapCellPosition =:= undefined) of
                true ->
                erlang:error({'Exception', "Should never be running here"});
                false -> ok
            end,
            put({This, pathFindingInfo}, (fun(Target_N68105) -> (get({Target_N68105, '$class'})):getPathFindingInfo(Target_N68105, GeographicMapCellPosition) end)((fun(Target_N68112) -> (get({Target_N68112, '$class'})):getWaypoint(Target_N68112) end)((get({get({This, targetPathFindingLayer}), '$class'})):getWaypointBehavior(get({This, targetPathFindingLayer}))))),
            LocalPathFindingInfo = get({This, pathFindingInfo}),
            put({This, list}, (fun(Target_N68228) -> (get({Target_N68228, '$class'})):getPathsList(Target_N68228, GeographicMapCellPosition, LocalPathFindingInfo, get({This, multipassState})) end)((fun(Target_N68235) -> (get({Target_N68235, '$class'})):getWaypoint(Target_N68235) end)((get({get({This, targetPathFindingLayer}), '$class'})):getWaypointBehavior(get({This, targetPathFindingLayer}))))),
            case (get({This, list}) =/= (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))) of
                true ->
                (get({get({This, 'END_RUNNABLE'}), '$class'})):run(get({This, 'END_RUNNABLE'}));
                false ->
                put({This, currentPassRunnable}, get({This, 'SECOND_RUNNABLE'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E),
            (get({This, '$class'})):setRunning(This, false),
            (get({This, '$class'})):finish(This)
        end.

processSecondRunnable(This) ->
        try
            GeographicMapCellPosition = (get({get({This, pathFindingLayer}), '$class'})):getCurrentGeographicMapCellPosition(get({This, pathFindingLayer})),
            LocalPathFindingInfo = get({This, pathFindingInfo}),
            put({This, list}, (fun(Target_N68765) -> (get({Target_N68765, '$class'})):getPathsList(Target_N68765, GeographicMapCellPosition, LocalPathFindingInfo, get({This, multipassState})) end)((fun(Target_N68772) -> (get({Target_N68772, '$class'})):getWaypoint(Target_N68772) end)((get({get({This, targetPathFindingLayer}), '$class'})):getWaypointBehavior(get({This, targetPathFindingLayer}))))),
            case (get({This, list}) =/= (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))) of
                true ->
                (get({get({This, 'END_RUNNABLE'}), '$class'})):run(get({This, 'END_RUNNABLE'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E),
            (get({This, '$class'})):setRunning(This, false),
            (get({This, '$class'})):finish(This)
        end.

processEndRunnable(This) ->
        try
            WaypointBehavior = (get({get({This, pathFindingLayer}), '$class'})):getWaypointBehavior(get({This, pathFindingLayer})),
            (get({WaypointBehavior, '$class'})):setWaypointPathsList(WaypointBehavior, get({This, list})),
            (fun(Target_N69222) -> (get({Target_N69222, '$class'})):'end'(Target_N69222, get({This, pathFindingLayer})) end)((get({get({This, pathFindingLayer}), '$class'})):getWaypointRunnableLogHelper(get({This, pathFindingLayer})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E),
            (get({This, '$class'})):setRunning(This, false)
        end,
        (get({This, '$class'})):finish(This).
% Java nested class FirstRunnable: move it to its own module 'FirstRunnable'
% Java nested class SecondRunnable: move it to its own module 'SecondRunnable'
% Java nested class EndRunnable: move it to its own module 'EndRunnable'

