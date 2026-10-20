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
% package org.allbinary.media.graphics.geography.map.racetrack.drop
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil
% import org.allbinary.layer.LayerInterfaceFactoryInterface

-module('RaceTrackAdjacentDropLayerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'DROP_LAYER_FACTORY'}, 'RaceTrackAdjacentDropLayerFactory':new()),
    ok.

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

clear(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})).

getInstance() ->
        get({'RaceTrackAdjacentDropLayerFactory', 'DROP_LAYER_FACTORY'}).

getSize(This) ->
        (get({get({This, list}), '$class'})):size(get({This, list})).

getRandomInstance(This) ->
        (get({get({This, basicArrayListUtil}), '$class'})):getRandom(get({This, basicArrayListUtil}), get({This, list})).

add(This, LayerInterfaceFactoryInterface) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), LayerInterfaceFactoryInterface).

