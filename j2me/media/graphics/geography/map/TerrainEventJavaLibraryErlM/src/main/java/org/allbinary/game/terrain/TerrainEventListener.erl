% Generated Code Do Not Modify
% package org.allbinary.game.terrain
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('TerrainEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TerrainEventListenerInterface

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onTerrainEvent(This, TerrainEvent) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})),
        (get({get({This, list}), '$class'})):add(get({This, list}), TerrainEvent).

getList(This) ->
        get({This, list}).

