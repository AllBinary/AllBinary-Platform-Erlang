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
% import org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.physics.acceleration.GravityUtil
% import org.allbinary.game.physics.velocity.VelocityProperties
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory

-module('GeographicMapTopViewGameLayerBehavior2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapTopViewLayerBehavior', Function, Arguments).

init_fields(This) ->
    put({This, gravityUtil}, 'GravityUtil':getInstance()),
    put({This, geographicMapBehavior}, 'MultiGeographicMapBehavior':new()),
    put({This, autoStepBlocks}, false),
    put({This, offsetY}, 0),
    put({This, previousGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    ok.


new(MaxGravityActionIndex, AutoStepBlocks, OffsetY) when is_integer(MaxGravityActionIndex), is_boolean(AutoStepBlocks), is_integer(OffsetY) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MaxGravityActionIndex, AutoStepBlocks, OffsetY),
    This.

init(This, MaxGravityActionIndex, AutoStepBlocks, OffsetY) when is_integer(MaxGravityActionIndex), is_boolean(AutoStepBlocks), is_integer(OffsetY) ->
        'GeographicMapTopViewLayerBehavior':init(This, MaxGravityActionIndex),
        init_fields(This),
        put({This, autoStepBlocks}, AutoStepBlocks),
        put({This, offsetY}, OffsetY).

% throws Exception
gravity(This, VelocityProperties, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        case (GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            (get({get({This, geographicMapBehavior}), '$class'})):getCellTypeAt(get({This, geographicMapBehavior}), GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition),
            HasSolidBlock = (get({This, '$class'})):hasSolidBlock(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray),
            case (not HasSolidBlock) of
                true ->
                (get({get({This, gravityUtil}), '$class'})):process(get({This, gravityUtil}), VelocityProperties, get({get({This, gravityUtil}), 'GAME_GRAVITY_VELOCITY'})),
                (get({VelocityProperties, '$class'})):limitXYToForwardAndReverseMaxVelocity(VelocityProperties),
                (get({This, '$class'})):gravity(This);
                false ->
                ok
            end;
            false -> ok
        end.

% throws Exception
getPositionTopLeft(This, GeographicMapInterfaceArray, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        XCellPosition = ((get({Layer, '$class'})):getXP(Layer) + (-X)),
        YCellPosition = ((get({Layer, '$class'})):getYP(Layer) + (-Y)),
        (fun(Target_N66867) -> (get({Target_N66867, '$class'})):getCellPositionAtXYNoThrow(Target_N66867, XCellPosition, YCellPosition) end)(array:get(0, GeographicMapInterfaceArray)).

% throws Exception
getPositionTopRight(This, GeographicMapInterfaceArray, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        XCellPosition = (((get({Layer, '$class'})):getXP(Layer) + (-X)) + (get({Layer, '$class'})):getWidth(Layer)),
        YCellPosition = ((get({Layer, '$class'})):getYP(Layer) + (-Y)),
        (fun(Target_N67204) -> (get({Target_N67204, '$class'})):getCellPositionAtXYNoThrow(Target_N67204, XCellPosition, YCellPosition) end)(array:get(0, GeographicMapInterfaceArray)).

% throws Exception
getPositionBottomLeft(This, GeographicMapInterfaceArray, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        XCellPosition = ((get({Layer, '$class'})):getXP(Layer) + (-X)),
        YCellPosition = (((get({Layer, '$class'})):getYP(Layer) + (-Y)) + (get({Layer, '$class'})):getHeight(Layer)),
        (fun(Target_N67541) -> (get({Target_N67541, '$class'})):getCellPositionAtXYNoThrow(Target_N67541, XCellPosition, YCellPosition) end)(array:get(0, GeographicMapInterfaceArray)).

% throws Exception
getPositionBottomRight(This, GeographicMapInterfaceArray, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        XCellPosition = (((get({Layer, '$class'})):getXP(Layer) + (-X)) + (get({Layer, '$class'})):getWidth(Layer)),
        YCellPosition = (((get({Layer, '$class'})):getYP(Layer) + (-Y)) + (get({Layer, '$class'})):getHeight(Layer)),
        (fun(Target_N67899) -> (get({Target_N67899, '$class'})):getCellPositionAtXYNoThrow(Target_N67899, XCellPosition, YCellPosition) end)(array:get(0, GeographicMapInterfaceArray)).

% throws Exception
getLeftPosition(This, GeographicMapInterfaceArray, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined) ->
        XCellPosition = (get({Layer, '$class'})):getXP(Layer),
        YCellPosition = ((get({Layer, '$class'})):getYP(Layer) + (get({Layer, '$class'})):getHeight(Layer)),
        (fun(Target_N68196) -> (get({Target_N68196, '$class'})):getCellPositionAtXYNoThrow(Target_N68196, XCellPosition, YCellPosition) end)(array:get(0, GeographicMapInterfaceArray)).

% throws Exception
getRightPosition(This, GeographicMapInterfaceArray, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined) ->
        XCellPosition = ((get({Layer, '$class'})):getXP(Layer) + (get({Layer, '$class'})):getWidth(Layer)),
        YCellPosition = ((get({Layer, '$class'})):getYP(Layer) + (get({Layer, '$class'})):getHeight(Layer)),
        (fun(Target_N68474) -> (get({Target_N68474, '$class'})):getCellPositionAtXYNoThrow(Target_N68474, XCellPosition, YCellPosition) end)(array:get(0, GeographicMapInterfaceArray)).

% throws Exception
getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined), is_integer(X), is_integer(Y) ->
        try
        put({local, geographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
        TopLeftGeographicMapCellPosition = (get({This, '$class'})):getPositionTopLeft(This, GeographicMapInterfaceArray, Layer, X, Y),
        put({local, geographicMapCellPosition}, (get({This, '$class'})):getGeographicMapCellPositionIfNotSolidBlockOrOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, TopLeftGeographicMapCellPosition, VelocityProperties, Layer)),
        case (get({local, geographicMapCellPosition}) =:= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})});
            false -> ok
        end,
        TopRightGeographicMapCellPosition = (get({This, '$class'})):getPositionTopRight(This, GeographicMapInterfaceArray, Layer, X, Y),
        put({local, geographicMapCellPosition}, (get({This, '$class'})):getGeographicMapCellPositionIfNotSolidBlockOrOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, TopRightGeographicMapCellPosition, VelocityProperties, Layer)),
        case (get({local, geographicMapCellPosition}) =:= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})});
            false -> ok
        end,
        BottomLeftGeographicMapCellPosition = (get({This, '$class'})):getPositionBottomLeft(This, GeographicMapInterfaceArray, Layer, X, Y),
        put({local, geographicMapCellPosition}, (get({This, '$class'})):getGeographicMapCellPositionIfNotSolidBlockOrOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, BottomLeftGeographicMapCellPosition, VelocityProperties, Layer)),
        case (get({local, geographicMapCellPosition}) =:= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})});
            false -> ok
        end,
        BottomRightGeographicMapCellPosition = (get({This, '$class'})):getPositionBottomRight(This, GeographicMapInterfaceArray, Layer, X, Y),
        put({local, geographicMapCellPosition}, (get({This, '$class'})):getGeographicMapCellPositionIfNotSolidBlockOrOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, BottomRightGeographicMapCellPosition, VelocityProperties, Layer)),
        case (get({local, geographicMapCellPosition}) =:= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            ok;
            false ->
            ok
        end,
        get({local, geographicMapCellPosition})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getGeographicMapCellPositionIfNotSolidBlockOrOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition, VelocityProperties, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        try
        case (GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            PossibleStepGeographicMapCellPosition = GeographicMapCellPosition,
            TiledLayer = (fun(Target_N69799) -> (get({Target_N69799, '$class'})):getAllBinaryTiledLayer(Target_N69799) end)(array:get(0, GeographicMapInterfaceArray)),
            case (((((get({PossibleStepGeographicMapCellPosition, '$class'})):getColumn(PossibleStepGeographicMapCellPosition) > 0) andalso ((get({PossibleStepGeographicMapCellPosition, '$class'})):getRow(PossibleStepGeographicMapCellPosition) > 0)) andalso ((get({PossibleStepGeographicMapCellPosition, '$class'})):getColumn(PossibleStepGeographicMapCellPosition) < (get({TiledLayer, '$class'})):getColumns(TiledLayer))) andalso ((get({PossibleStepGeographicMapCellPosition, '$class'})):getRow(PossibleStepGeographicMapCellPosition) < (get({TiledLayer, '$class'})):getRows(TiledLayer))) of
                true ->
                (get({get({This, geographicMapBehavior}), '$class'})):getCellTypeAt(get({This, geographicMapBehavior}), GeographicMapInterfaceArray, GeographicMapCellTypeArray, PossibleStepGeographicMapCellPosition),
                HasSolidBlock = (get({This, '$class'})):hasSolidBlock(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray),
                HasOffMap = (get({This, '$class'})):isOffMap(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray),
                case (HasSolidBlock orelse HasOffMap) of
                    true ->
                    put({This, previousGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
                    throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})});
                    false ->
                    put({This, previousGeographicMapCellPosition}, PossibleStepGeographicMapCellPosition),
                    throw({'$return', PossibleStepGeographicMapCellPosition})
                end;
                false -> ok
            end;
            false ->
            ok
        end,
        put({This, previousGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
        get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
moveAndLand(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition, VelocityProperties, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined), is_integer(X), is_integer(Y) ->
        case (GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            TopViewCharacterInterface = (Layer),
            (get({TopViewCharacterInterface, '$class'})):terrainMove(TopViewCharacterInterface, GeographicMapInterfaceArray, GeographicMapCellTypeArray, X, Y);
            false ->
            ok
        end.

% throws Exception
move(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined), is_integer(X), is_integer(Y) ->
        try
        GeographicMapCellPosition = (get({This, '$class'})):getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer, X, Y),
        (get({This, '$class'})):moveAndLand(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition, VelocityProperties, Layer, X, Y),
        case (GeographicMapCellPosition =:= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
left(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        GeographicMapCellPosition = (get({This, '$class'})):getLeftPosition(This, GeographicMapInterfaceArray, Layer),
        case (GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            PossibleStepGeographicMapCellPosition = (fun(Target_N71499) -> (get({Target_N71499, '$class'})):getAt(Target_N71499, (get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition), ((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition) - 1)) end)((fun(Target_N71506) -> (get({Target_N71506, '$class'})):getGeographicMapCellPositionFactory(Target_N71506) end)(array:get(0, GeographicMapInterfaceArray))),
            (get({get({This, geographicMapBehavior}), '$class'})):getCellTypeAt(get({This, geographicMapBehavior}), GeographicMapInterfaceArray, GeographicMapCellTypeArray, PossibleStepGeographicMapCellPosition),
            HasSolidBlock = (get({This, '$class'})):hasSolidBlock(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray),
            case HasSolidBlock of
                true ->
                case get({This, autoStepBlocks}) of
                    true ->
                    put({local, topViewCharacterInterface}, (Layer)),
                    (get({get({local, topViewCharacterInterface}), '$class'})):leftp(get({local, topViewCharacterInterface}));
                    false ->
                    (fun(Target_N71824) -> (get({Target_N71824, '$class'})):setint(Target_N71824, 0) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties))
                end;
                false ->
                put({local, topViewCharacterInterface}, (Layer)),
                (get({get({local, topViewCharacterInterface}), '$class'})):leftp(get({local, topViewCharacterInterface}))
            end;
            false -> ok
        end.

% throws Exception
right(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, VelocityProperties, Layer) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        GeographicMapCellPosition = (get({This, '$class'})):getRightPosition(This, GeographicMapInterfaceArray, Layer),
        case (GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            PossibleStepGeographicMapCellPosition = (fun(Target_N72225) -> (get({Target_N72225, '$class'})):getAt(Target_N72225, (get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition), ((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition) - 1)) end)((fun(Target_N72232) -> (get({Target_N72232, '$class'})):getGeographicMapCellPositionFactory(Target_N72232) end)(array:get(0, GeographicMapInterfaceArray))),
            (get({get({This, geographicMapBehavior}), '$class'})):getCellTypeAt(get({This, geographicMapBehavior}), GeographicMapInterfaceArray, GeographicMapCellTypeArray, PossibleStepGeographicMapCellPosition),
            HasSolidBlock = (get({This, '$class'})):hasSolidBlock(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray),
            case HasSolidBlock of
                true ->
                case get({This, autoStepBlocks}) of
                    true ->
                    put({local, topViewCharacterInterface}, (Layer)),
                    (get({get({local, topViewCharacterInterface}), '$class'})):rightp(get({local, topViewCharacterInterface}));
                    false ->
                    (fun(Target_N72550) -> (get({Target_N72550, '$class'})):setint(Target_N72550, 0) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties))
                end;
                false ->
                put({local, topViewCharacterInterface}, (Layer)),
                (get({get({local, topViewCharacterInterface}), '$class'})):rightp(get({local, topViewCharacterInterface}))
            end;
            false -> ok
        end.

