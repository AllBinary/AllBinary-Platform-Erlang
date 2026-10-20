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
% import org.allbinary.direction.Direction
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory

-module('TopViewCharacterBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
terrainEvent(This, Layer, Direction, X, Y, GeographicMapInterfaceArray, GeographicMapCellPosition) when is_integer(X), is_integer(Y), (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined) ->
        ok.

terrainMove(This, Layer, GeographicMapInterfaceArray, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        ok.

hasSolidBlock(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        try
        Size = array:size(GeographicMapInterfaceArray),
        put({local, basicTopViewGeographicMapCellTypeFactory}, undefined),
        lists:foreach(fun(Index) ->
            put({local, basicTopViewGeographicMapCellTypeFactory}, (fun(Target_N66207) -> (get({Target_N66207, '$class'})):getGeographicMapCellTypeFactory(Target_N66207) end)(array:get(Index, GeographicMapInterfaceArray))),
            case (get({get({get({local, basicTopViewGeographicMapCellTypeFactory}), 'BLOCK_CELL_TYPE'}), '$class'})):isType(get({get({local, basicTopViewGeographicMapCellTypeFactory}), 'BLOCK_CELL_TYPE'}), array:get(Index, GeographicMapCellTypeArray)) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

