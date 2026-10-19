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
% package org.allbinary.game.layer.pickup
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.game.view.TileLayerPositionIntoViewPosition
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.view.ViewPosition
% import org.allbinary.view.event.ViewPositionEventHandler

-module('RaceTrackPickupLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PickupLayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "RaceTrackPickupLayer"),
    ok.

init_fields(This) ->
    put({This, viewPositionEventHandler}, 'ViewPositionEventHandler':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'PickupLayer':init(This, get({'RaceTrackPickupLayer', 'NAME'}), get({'RemoteInfo', 'REMOTE_INFO'}), 0, get({'CountedPickedUpLayerInterfaceFactory', 'NULL_COUNTED_PICKUP_LAYER_FACTORY'}), (fun(Target_N65979) -> (get({Target_N65979, '$class'})):getInstance(Target_N65979, 0) end)('NullAnimationFactory':getFactoryInstance()), 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), 0, 0), 'TileLayerPositionIntoViewPosition':new()),
        init_fields(This).

setTiledLayer(This, TiledLayer) ->
        ViewPosition = (get({This, '$class'})):getViewPosition(This),
        (get({ViewPosition, '$class'})):setTiledLayer(ViewPosition, TiledLayer),
        (get({get({This, viewPositionEventHandler}), '$class'})):addListener(get({This, viewPositionEventHandler}), This).

setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        'PickupLayer':setDestroyed(This, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (get({get({This, viewPositionEventHandler}), '$class'})):removeListener(get({This, viewPositionEventHandler}), This);
            false -> ok
        end.

