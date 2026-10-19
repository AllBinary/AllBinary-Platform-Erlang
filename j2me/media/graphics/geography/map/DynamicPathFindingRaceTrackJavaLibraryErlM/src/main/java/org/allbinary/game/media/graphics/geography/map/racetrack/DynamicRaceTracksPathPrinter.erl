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
% package org.allbinary.game.media.graphics.geography.map.racetrack
% import org.allbinary.util.BasicArrayList
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterfaceFactoryInterface
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTracksPathPrinter
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathGenerator

-module('DynamicRaceTracksPathPrinter').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RaceTracksPathPrinter', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'RaceTracksPathPrinter':init(This),
    init_fields(This).


printAllPaths(This, RaceTrackGeographicMapInterfaceFactoryInterface, PathFindingInfo, Size) when is_integer(Size) ->
        try
            lists:foreach(fun(Index) ->
                GeographicMapInterface = (get({RaceTrackGeographicMapInterfaceFactoryInterface, '$class'})):getTrackInstance(RaceTrackGeographicMapInterfaceFactoryInterface, (fun(Target_N66090) -> (get({Target_N66090, '$class'})):getAt(Target_N66090, Index) end)('SmallIntegerSingletonFactory':getInstance())),
                List = (fun(Target_N66154) -> (get({Target_N66154, '$class'})):createList(Target_N66154, GeographicMapInterface, 'RaceTrackRoadsGeographicMapCellHistoryFactory':getInstance(), PathFindingInfo, 10) end)('PathGenerator':getInstance()),
                io:format("~ts~n", [allbinary_java:to_string(lists:concat(["Track ", Index]))]),
                (get({This, '$class'})):printPaths(This, List)
            end, lists:seq(0, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'PROCESS'}), E)
        end.

