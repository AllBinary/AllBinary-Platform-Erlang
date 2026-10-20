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
% package org.allbinary.game.input.form
% import org.allbinary.game.input.LayerPositionFinderInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory

-module('NullRTSGameLayerPositionFinder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements LayerPositionFinderInterface

static_init() ->
    put({?MODULE, instance}, 'NullRTSGameLayerPositionFinder':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'NullRTSGameLayerPositionFinder', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getLayerInterface(This, GeographicMapCellPosition) ->
        LayerInterface = (fun(Target_N65888) -> (get({Target_N65888, '$class'})):getLayerInterface(Target_N65888, GeographicMapCellPosition) end)('DropCellPositionHistory':getInstance()),
        LayerInterface.

