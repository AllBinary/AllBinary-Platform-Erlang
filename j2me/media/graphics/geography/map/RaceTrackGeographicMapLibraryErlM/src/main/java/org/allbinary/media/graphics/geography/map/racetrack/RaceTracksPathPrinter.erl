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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonLabels

-module('RaceTracksPathPrinter').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


printPath(This, List) ->
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            AnyType = (get({List, '$class'})):get(List, Index),
            'PreLogUtil':put((fun(Target_N65853) -> (get({Target_N65853, '$class'})):toString(Target_N65853) end)((fun(Target_N65860) -> (get({Target_N65860, '$class'})):append(Target_N65860, ");") end)((fun(Target_N65867) -> (get({Target_N65867, '$class'})):append(Target_N65867, (get({AnyType, '$class'})):toString(AnyType)) end)((fun(Target_N65874) -> (get({Target_N65874, '$class'})):append(Target_N65874, "pathList.add(cellPositionFactory.getInstance") end)('StringMaker':new())))), This, "printPath")
        end, lists:seq(0, Size - 1)).

printPaths(This, List) ->
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            io:format("~ts~n", [allbinary_java:to_string((fun(Target_N66137) -> (get({Target_N66137, '$class'})):toString(Target_N66137) end)((fun(Target_N66144) -> (get({Target_N66144, '$class'})):append(Target_N66144, get({'CommonLabels':getInstance(), 'COLON_SEP'})) end)((fun(Target_N66151) -> (get({Target_N66151, '$class'})):appendint(Target_N66151, Index) end)((fun(Target_N66158) -> (get({Target_N66158, '$class'})):append(Target_N66158, " Path ") end)('StringMaker':new())))))]),
            (get({This, '$class'})):printPath(This, (get({List, '$class'})):get(List, Index))
        end, lists:seq(0, Size - 1)).

