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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.CircularIndexUtil
% import org.allbinary.game.layer.geographic.map.LayerCoveringCellPositionsUtil
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.CellPositionsUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayListS
% import org.allbinary.util.BasicArrayListUtil

-module('GeographicMapCellPositionArea').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellPositionAreaBase', Function, Arguments).

init_fields(This) ->
    put({This, cellPositionsUtil}, 'CellPositionsUtil':getInstance()),
    put({This, layerCoveringCellPositionsUtil}, 'LayerCoveringCellPositionsUtil':getInstance()),
    put({This, reusableOccupyingGeographicMapCellPositionList}, 'BasicArrayListS':new(4)),
    put({This, reusableSurroundingGeographicMapCellPositionList}, 'BasicArrayListS':new(12)),
    put({This, surroundingCircularIndexUtil}, 'CircularIndexUtil':createInstance(0)),
    put({This, layerInterface}, undefined),
    put({This, 'LIST'}, (fun(Target_N66199) -> (get({Target_N66199, '$class'})):getImmutableInstance(Target_N66199) end)('BasicArrayListUtil':getInstance())),
    put({This, occupyingGeographicMapCellPositionList}, get({This, 'LIST'})),
    put({This, surroundingGeographicMapCellPositionList}, get({This, 'LIST'})),
    ok.


new(LayerInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LayerInterface),
    This.

'$init'(This, LayerInterface) ->
    'GeographicMapCellPositionAreaBase':'$init'(This),
    init_fields(This),
        put({This, layerInterface}, LayerInterface).

% throws Exception
update(This, GeographicMapInterface) ->
        put({This, occupyingGeographicMapCellPositionList}, (get({get({This, layerCoveringCellPositionsUtil}), '$class'})):getAllXY(get({This, layerCoveringCellPositionsUtil}), GeographicMapInterface, get({This, layerInterface}), (get({get({This, layerInterface}), '$class'})):getXP(get({This, layerInterface})), (get({get({This, layerInterface}), '$class'})):getYP(get({This, layerInterface})), get({This, reusableOccupyingGeographicMapCellPositionList}))),
        put({This, surroundingGeographicMapCellPositionList}, (get({get({This, cellPositionsUtil}), '$class'})):getAllSurrounding(get({This, cellPositionsUtil}), GeographicMapInterface, get({This, occupyingGeographicMapCellPositionList}), get({This, reusableSurroundingGeographicMapCellPositionList}))),
        (get({get({This, surroundingCircularIndexUtil}), '$class'})):setSize(get({This, surroundingCircularIndexUtil}), (get({get({This, surroundingGeographicMapCellPositionList}), '$class'})):size(get({This, surroundingGeographicMapCellPositionList}))).

getOccupyingGeographicMapCellPositionList(This) ->
        get({This, occupyingGeographicMapCellPositionList}).

getSurroundingGeographicMapCellPositionList(This) ->
        get({This, surroundingGeographicMapCellPositionList}).

getNextSurroundingGeographicMapCellPosition(This) ->
        GeographicMapCellPosition = (get({get({This, surroundingGeographicMapCellPositionList}), '$class'})):get(get({This, surroundingGeographicMapCellPositionList}), (get({get({This, surroundingCircularIndexUtil}), '$class'})):getIndex(get({This, surroundingCircularIndexUtil}))),
        (get({get({This, surroundingCircularIndexUtil}), '$class'})):next(get({This, surroundingCircularIndexUtil})),
        GeographicMapCellPosition.

