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
% package org.allbinary.media.graphics.geography.map
% import org.allbinary.logic.NullUtil

-module('GeographicMapCellHistoryProgress').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellHistoryProgressBase', Function, Arguments).

init_fields(This) ->
    put({This, totalVisitedArray}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'})),
    put({This, geographicMapCellHistoryArray}, get({'GeographicMapCellHistory', 'NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY'})),
    ok.


new(GeographicMapCellHistoryArray) when (is_tuple(GeographicMapCellHistoryArray) orelse GeographicMapCellHistoryArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GeographicMapCellHistoryArray),
    This.

'$init'(This, GeographicMapCellHistoryArray) when (is_tuple(GeographicMapCellHistoryArray) orelse GeographicMapCellHistoryArray =:= undefined) ->
    'GeographicMapCellHistoryProgressBase':'$init'(This),
    init_fields(This),
        put({This, geographicMapCellHistoryArray}, GeographicMapCellHistoryArray),
        (get({This, '$class'})):init(This).

init(This) ->
        put({This, totalVisitedArray}, array:new(array:size(get({This, geographicMapCellHistoryArray})), {default, 0})).

isAnyProgress(This) ->
        put({local, isProgressing}, false),
        Size = array:size(get({This, geographicMapCellHistoryArray})),
        put({local, currentTotalVisited}, 0),
        put({local, totalVisited}, 0),
        lists:foreach(fun(Index) ->
            put({local, totalVisited}, (fun(Target_N66072) -> (get({Target_N66072, '$class'})):getTotalVisited(Target_N66072) end)(array:get(Index, get({This, geographicMapCellHistoryArray})))),
            put({local, currentTotalVisited}, array:get(Index, get({This, totalVisitedArray}))),
            case (get({local, currentTotalVisited}) < get({local, totalVisited})) of
                true ->
                put({local, isProgressing}, true),
                put({This, totalVisitedArray}, array:set(Index, get({local, totalVisited}), get({This, totalVisitedArray})));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        get({local, isProgressing}).

