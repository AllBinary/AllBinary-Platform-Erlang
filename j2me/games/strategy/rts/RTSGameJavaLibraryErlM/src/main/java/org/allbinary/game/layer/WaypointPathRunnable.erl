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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition

-module('WaypointPathRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointPathRunnableBase', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'WaypointPathRunnableBase':init(This),
    init_fields(This),
        ok.

run(This) ->
        try
            (fun(Target_N65785) -> (get({Target_N65785, '$class'})):start(Target_N65785, get({This, pathFindingLayer})) end)((get({get({This, pathFindingLayer}), '$class'})):getWaypointRunnableLogHelper(get({This, pathFindingLayer}))),
            WaypointBehavior = (get({get({This, pathFindingLayer}), '$class'})):getWaypointBehavior(get({This, pathFindingLayer})),
            GeographicMapCellPosition = (get({get({This, pathFindingLayer}), '$class'})):getCurrentGeographicMapCellPosition(get({This, pathFindingLayer})),
            case (GeographicMapCellPosition =:= undefined) of
                true ->
                erlang:error({'Exception', "Should never be running here"});
                false -> ok
            end,
            (get({WaypointBehavior, '$class'})):setWaypointPathsList(WaypointBehavior, (fun(Target_N66007) -> (get({Target_N66007, '$class'})):getPathsListRunnable(Target_N66007, GeographicMapCellPosition) end)((fun(Target_N66014) -> (get({Target_N66014, '$class'})):getWaypoint(Target_N66014) end)((get({get({This, targetPathFindingLayer}), '$class'})):getWaypointBehavior(get({This, targetPathFindingLayer}))))),
            (fun(Target_N66059) -> (get({Target_N66059, '$class'})):'end'(Target_N66059, get({This, pathFindingLayer})) end)((get({get({This, pathFindingLayer}), '$class'})):getWaypointRunnableLogHelper(get({This, pathFindingLayer}))),
            timer:sleep((15 + ((get({This, priorityP}) * 2))))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E),
            (get({This, '$class'})):setRunning(This, false)
        end.

isDone(This) ->
        true.

