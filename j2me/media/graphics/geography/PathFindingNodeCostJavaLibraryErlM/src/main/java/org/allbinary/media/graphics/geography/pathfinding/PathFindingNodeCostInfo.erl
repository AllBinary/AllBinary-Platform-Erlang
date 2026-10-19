%
% AllBinary Open License Version 1
% Copyright (c) 2006 AllBinary
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
% package org.allbinary.media.graphics.geography.pathfinding
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels

-module('PathFindingNodeCostInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Comparable

init_fields(This) ->
    put({This, pathFindingNodeCostInfoData}, 'PathFindingNodeCostInfoData':getInstance()),
    put({This, costFromStartP}, 0),
    put({This, costToEndP}, 0),
    put({This, totalCostP}, 0),
    ok.


new(CostFromStart, CostToGoal) when is_integer(CostFromStart), is_integer(CostToGoal) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CostFromStart, CostToGoal),
    This.

init(This, CostFromStart, CostToGoal) when is_integer(CostFromStart), is_integer(CostToGoal) ->
    init_fields(This),
        put({This, costFromStartP}, CostFromStart),
        put({This, costToEndP}, CostToGoal),
        (get({This, '$class'})):setCalculatedTotalCost(This).

setCostToEnd(This, CostToEnd) when is_integer(CostToEnd) ->
        put({This, costToEndP}, CostToEnd).

setTotalCost(This, TotalCost) when is_integer(TotalCost) ->
        put({This, totalCostP}, TotalCost).

% throws Exception
setCalculatedTotalCost(This) ->
        put({This, totalCostP}, (get({This, costFromStartP}) + get({This, costToEndP}))),
        case (get({This, totalCostP}) > get({get({This, pathFindingNodeCostInfoData}), 'MAX_NODE_COST'})) of
            true ->
            erlang:error({'Exception', "Max Cost Exceeded"});
            false -> ok
        end.

setCostFromStart(This, Cost) when is_integer(Cost) ->
        put({This, costFromStartP}, Cost).

addCostFromStart(This, Cost) when is_integer(Cost) ->
        put({This, costFromStartP}, (get({This, costFromStartP}) + Cost)).

compareTo(This, PathFindingNodeCostInfo) ->
        (get({get({get({'java', lang}), 'Long'}), '$class'})):compare(get({get({'java', lang}), 'Long'}), get({This, totalCostP}), get({PathFindingNodeCostInfo, totalCostP})).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'COLON_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "CostFromStart: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({This, costFromStartP})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " CostToEnd: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({This, costToEndP})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " TotalCost: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({This, totalCostP})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

