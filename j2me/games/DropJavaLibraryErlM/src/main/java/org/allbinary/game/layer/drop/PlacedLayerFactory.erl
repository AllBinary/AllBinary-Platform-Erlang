% Generated Code Do Not Modify
% package org.allbinary.game.layer.drop
% import org.allbinary.layer.AllBinaryLayerFactoryInterface
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('PlacedLayerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PlacedLayerFactory':new()),
    ok.

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

clear(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})).

getInstance() ->
        get({'PlacedLayerFactory', instance}).

getSize(This) ->
        (get({get({This, list}), '$class'})):size(get({This, list})).

getRandomInstance(This) ->
        (get({get({This, basicArrayListUtil}), '$class'})):getRandom(get({This, basicArrayListUtil}), get({This, list})).

add(This, LayerInterfaceFactoryInterface) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), LayerInterfaceFactoryInterface).

