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
% package org.allbinary.game.behavior.topview.placement
% import org.mapeditor.core.TiledMap

-module('AllAnimationsEverywhereTileMapPlacementVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TileMapPlacementVisitor', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'TileMapPlacementVisitor':init(This),
    init_fields(This).


visit(This, LastMap, MapData) when (is_tuple(MapData) orelse MapData =:= undefined) ->
        Size = array:size(MapData),
        Size2 = (array:size(array:get(0, MapData)) - 7),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(Index2) ->
                array:set(Index, array:set(Index2, 1, array:get(Index, MapData)), MapData),
                array:set(Index, array:set((Index2 + 1), 17, array:get(Index, MapData)), MapData),
                array:set(Index, array:set((Index2 + 2), 33, array:get(Index, MapData)), MapData),
                array:set(Index, array:set((Index2 + 3), 49, array:get(Index, MapData)), MapData),
                array:set(Index, array:set((Index2 + 4), 65, array:get(Index, MapData)), MapData),
                array:set(Index, array:set((Index2 + 5), 81, array:get(Index, MapData)), MapData),
                array:set(Index, array:set((Index2 + 6), 97, array:get(Index, MapData)), MapData)
            end, lists:seq(0, Size2 - 1, 7))
        end, lists:seq(0, Size - 1)).

