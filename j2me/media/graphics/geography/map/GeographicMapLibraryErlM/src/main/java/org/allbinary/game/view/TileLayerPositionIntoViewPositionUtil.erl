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
% package org.allbinary.game.view
% import org.allbinary.game.view.TileLayerPositionIntoViewPosition
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface

-module('TileLayerPositionIntoViewPositionUtil').
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


init(GameCanvasInterface, ViewPosition) ->
        GeographicMapCompositeInterface = (get({GameCanvasInterface, '$class'})):getLayerManager(GameCanvasInterface),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        (get({ViewPosition, '$class'})):setTiledLayer(ViewPosition, TiledLayer).

