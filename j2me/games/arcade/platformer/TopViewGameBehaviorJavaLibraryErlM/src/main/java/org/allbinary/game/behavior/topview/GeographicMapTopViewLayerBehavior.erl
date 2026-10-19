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
% package org.allbinary.game.behavior.topview
% import org.allbinary.game.physics.velocity.VelocityProperties
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory
% import org.allbinary.util.BasicArrayList

-module('GeographicMapTopViewLayerBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TopViewGameLayerBehavior', Function, Arguments).

init_fields(This) ->
    ok.


new(MaxGravityActionIndex) when is_integer(MaxGravityActionIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MaxGravityActionIndex),
    This.

init(This, MaxGravityActionIndex) when is_integer(MaxGravityActionIndex) ->
        'TopViewGameLayerBehavior':init(This, MaxGravityActionIndex).

% throws Exception
getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined), is_integer(X), is_integer(Y) ->
        get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'}).

% throws Exception
getGeographicMapCellPositionIfNotSolidBlockOrOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition, VelocityProperties, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'}).

% throws Exception
getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPositionList, VelocityProperties, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'}).

% throws Exception
gravity(This, VelocityProperties, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        ok.

% throws Exception
left(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        ok.

% throws Exception
move(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined), is_integer(X), is_integer(Y) ->
        false.

% throws Exception
moveAndLand(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition, VelocityProperties, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined), is_integer(X), is_integer(Y) ->
        ok.

% throws Exception
right(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        ok.

hasSolidBlock(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        try
        Size = array:size(GeographicMapInterfaceArray),
        put({local, basicTopViewGeographicMapCellTypeFactory}, undefined),
        lists:foreach(fun(Index) ->
            put({local, basicTopViewGeographicMapCellTypeFactory}, (fun(Target_N67474) -> (get({Target_N67474, '$class'})):getGeographicMapCellTypeFactory(Target_N67474) end)(array:get(Index, GeographicMapInterfaceArray))),
            case (get({get({get({local, basicTopViewGeographicMapCellTypeFactory}), 'BLOCK_CELL_TYPE'}), '$class'})):isType(get({get({local, basicTopViewGeographicMapCellTypeFactory}), 'BLOCK_CELL_TYPE'}), array:get(Index, GeographicMapCellTypeArray)) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        try
        Size = array:size(GeographicMapInterfaceArray),
        put({local, basicTopViewGeographicMapCellTypeFactory}, undefined),
        lists:foreach(fun(Index) ->
            put({local, basicTopViewGeographicMapCellTypeFactory}, (fun(Target_N67839) -> (get({Target_N67839, '$class'})):getGeographicMapCellTypeFactory(Target_N67839) end)(array:get(Index, GeographicMapInterfaceArray))),
            case (get({get({get({local, basicTopViewGeographicMapCellTypeFactory}), 'OFF_MAP_CELL_TYPE'}), '$class'})):isType(get({get({local, basicTopViewGeographicMapCellTypeFactory}), 'OFF_MAP_CELL_TYPE'}), array:get(Index, GeographicMapCellTypeArray)) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

