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
% package org.allbinary.game.layer
% import java.util.Enumeration
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.LayerInterfaceFactory
% import org.allbinary.layer.LayerInterfaceVisitor
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.EnumerationUtil

-module('LayerPlacer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    put({This, layerInterfaceVisitor}, undefined),
    put({This, dimension}, undefined),
    ok.


new(LayerInterfaceVisitor, Dimension) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LayerInterfaceVisitor, Dimension),
    This.

'$init'(This, LayerInterfaceVisitor, Dimension) ->
    init_fields(This),
        put({This, layerInterfaceVisitor}, LayerInterfaceVisitor),
        put({This, dimension}, Dimension).

% throws Exception
processList(This, List) ->
        Size = (get({List, '$class'})):size(List),
        put({local, layerPlacementInterface}, undefined),
        lists:foreach(fun(Index) ->
            put({local, layerPlacementInterface}, array:get(Index, get({List, objectArray}))),
            (get({This, '$class'})):process(This, get({local, layerPlacementInterface}))
        end, lists:seq(0, Size - 1)).

% throws Exception
process(This, LayerPlacementInterface) ->
        RelativePoint = (get({This, '$class'})):getPoint(This, LayerPlacementInterface),
        LayerInterfaceFactory = 'LayerInterfaceFactory':getInstance(),
        Hashtable = (get({LayerPlacementInterface, '$class'})):getInstance(LayerPlacementInterface),
        Enumeration = (get({Hashtable, '$class'})):keys(Hashtable),
        put({local, point}, undefined),
        put({local, layerHashtable}, undefined),
        put({local, x}, 0),
        put({local, y}, 0),
        put({local, z}, 0),
        put({local, layerInterface}, undefined),
        (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
            put({local, point}, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration)),
            put({local, layerHashtable}, (get({Hashtable, '$class'})):get(Hashtable, get({local, point}))),
            put({local, x}, ((get({get({local, point}), '$class'})):getX(get({local, point})) + (get({RelativePoint, '$class'})):getX(RelativePoint))),
            put({local, y}, ((get({get({local, point}), '$class'})):getY(get({local, point})) + (get({RelativePoint, '$class'})):getY(RelativePoint))),
            put({local, z}, ((get({get({local, point}), '$class'})):getZ(get({local, point})) + (get({RelativePoint, '$class'})):getZ(RelativePoint))),
            put({local, layerInterface}, (get({LayerInterfaceFactory, '$class'})):getNexInstance(LayerInterfaceFactory, get({local, layerHashtable}), get({local, x}), get({local, y}), get({local, z}))),
            (get({get({This, layerInterfaceVisitor}), '$class'})):visit(get({This, layerInterfaceVisitor}), get({local, layerInterface})),
            Loop();
        false -> ok end end)().

% throws Exception
getPoint(This, LayerPlacementInterface) ->
        try
        PointFactory = 'PointFactory':getInstance(),
        LayerPlacementType = (get({LayerPlacementInterface, '$class'})):getLayerType(LayerPlacementInterface),
        case (LayerPlacementType =:= get({'LayerPlacementTypeFactory':getInstance(), 'MAP'})) of
            true ->
            put({local, width}, (get({LayerPlacementInterface, '$class'})):getWidth(LayerPlacementInterface)),
            put({local, height}, (get({LayerPlacementInterface, '$class'})):getHeight(LayerPlacementInterface)),
            put({local, x}, (((((get({get({This, dimension}), '$class'})):getX(get({This, dimension})) - get({local, width}))) / 2))),
            put({local, y}, (((((get({get({This, dimension}), '$class'})):getY(get({This, dimension})) - get({local, height}))) / 2))),
            throw({'$return', (get({PointFactory, '$class'})):createXY(PointFactory, get({local, x}), get({local, y}))});
            false ->
            case (LayerPlacementType =:= get({'LayerPlacementTypeFactory':getInstance(), 'UP'})) of
            true ->
            put({local, width}, (get({LayerPlacementInterface, '$class'})):getWidth(LayerPlacementInterface)),
            put({local, height}, (get({LayerPlacementInterface, '$class'})):getHeight(LayerPlacementInterface)),
            put({local, x}, (((((get({get({This, dimension}), '$class'})):getX(get({This, dimension})) - get({local, width}))) / 2))),
            put({local, y}, (-get({local, height}))),
            throw({'$return', (get({PointFactory, '$class'})):createXY(PointFactory, get({local, x}), get({local, y}))});
            false ->
            erlang:error({'Exception', "PlacementType Not Recognized"})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

