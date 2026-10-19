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
% import org.allbinary.string.CommonSeps
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.string.CommonLabels

-module('PathFindingNodeCost').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements Comparable

'$handle_undefined_function'(Function, Arguments) ->
    apply('PathFindingNode', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY'}, array:new(0, {default, array:new(0, {default, undefined})})),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, pathFindingNodeCostInfoP}, undefined),
    ok.


new(Parent, GeographicMapCellPosition, PathFindingNodeCostInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Parent, GeographicMapCellPosition, PathFindingNodeCostInfo),
    This.

init(This, Parent, GeographicMapCellPosition, PathFindingNodeCostInfo) ->
        'PathFindingNode':init(This, Parent, GeographicMapCellPosition),
        init_fields(This),
        put({This, pathFindingNodeCostInfoP}, PathFindingNodeCostInfo),
        case (get({This, geographicMapCellPosition}) =:= undefined) of
            true ->
            erlang:error({'Exception', "No GeographicMapCellPosition"});
            false -> ok
        end,
        case ((get({This, '$class'})):getPathFindingNodeCostInfo(This) =:= undefined) of
            true ->
            erlang:error({'Exception', "No PathFindingNodeCostInfo"});
            false -> ok
        end.

getPathFindingNodeCostInfo(This) ->
        get({This, pathFindingNodeCostInfoP}).

setPathFindingNodeCostInfo(This, PathFindingNodeCostInfo) ->
        put({This, pathFindingNodeCostInfoP}, PathFindingNodeCostInfo).

compareTo(This, PathFindingNodeCost) ->
        (get({get({This, pathFindingNodeCostInfoP}), '$class'})):compareTo(get({This, pathFindingNodeCostInfoP}), get({PathFindingNodeCost, pathFindingNodeCostInfoP})).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'COLON_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66559) -> (get({Target_N66559, '$class'})):toString(Target_N66559) end)((get({This, '$class'})):getPathFindingNodeCostInfo(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Path: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, geographicMapCellPosition}), '$class'})):toString(get({This, geographicMapCellPosition}))),
        put({local, pathFindingNode}, get({This, parent})),
        (fun Loop() -> case (get({local, pathFindingNode}) =/= undefined) of true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({get({local, pathFindingNode}), geographicMapCellPosition}), '$class'})):toString(get({get({local, pathFindingNode}), geographicMapCellPosition}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
            put({local, pathFindingNode}, get({get({local, pathFindingNode}), parent})),
            Loop();
        false -> ok end end)(),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

