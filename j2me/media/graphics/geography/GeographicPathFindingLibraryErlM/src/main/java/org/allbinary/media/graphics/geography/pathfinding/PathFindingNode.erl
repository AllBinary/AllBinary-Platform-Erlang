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
% package org.allbinary.media.graphics.geography.pathfinding
% import org.allbinary.logic.NullUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.string.CommonLabels

-module('PathFindingNode').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, parent}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({This, geographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    ok.


new(Parent, GeographicMapCellPosition) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Parent, GeographicMapCellPosition),
    This.

init(This, Parent, GeographicMapCellPosition) ->
    init_fields(This),
        put({This, parent}, Parent),
        (get({This, '$class'})):setGeographicMapCellPositionP(This, GeographicMapCellPosition),
        case (get({This, geographicMapCellPosition}) =:= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            erlang:error({'Exception', "No GeographicMapCellPosition"});
            false -> ok
        end.

getParentP(This) ->
        get({This, parent}).

setGeographicMapCellPositionP(This, GeographicMapCellPosition) ->
        put({This, geographicMapCellPosition}, GeographicMapCellPosition).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'COLON_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Path: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, geographicMapCellPosition}), '$class'})):toString(get({This, geographicMapCellPosition}))),
        put({local, pathFindingNode}, (get({This, '$class'})):getParentP(This)),
        (fun Loop() -> case (get({local, pathFindingNode}) =/= undefined) of true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({get({local, pathFindingNode}), geographicMapCellPosition}), '$class'})):toString(get({get({local, pathFindingNode}), geographicMapCellPosition}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
            put({local, pathFindingNode}, (get({get({local, pathFindingNode}), '$class'})):getParentP(get({local, pathFindingNode}))),
            Loop();
        false -> ok end end)(),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

