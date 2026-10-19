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
% package org.allbinary.layer.event
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('LayerManagerEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'LayerManagerEventHandler':new()),
    ok.

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    put({This, 'CREATE'}, "Create"),
    put({This, 'DELETE'}, "Delete"),
    ok.


getInstance() ->
        get({'LayerManagerEventHandler', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BasicEventHandler':init(This),
    init_fields(This),
        ok.

addListener(This, LayerManagerEventListener) ->
        case (not (get({get({This, list}), '$class'})):contains(get({This, list}), LayerManagerEventListener)) of
            true ->
            (get({get({This, list}), '$class'})):add(get({This, list}), LayerManagerEventListener);
            false -> ok
        end.

removeAllListeners(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})),
        'BasicEventHandler':removeAllListeners(This).

removeListener(This, EventListenerInterface) ->
        (get({get({This, list}), '$class'})):remove(get({This, list}), EventListenerInterface),
        'BasicEventHandler':removeListener(This, EventListenerInterface).

% throws Exception
fireEvent(This, EventObject) ->
        put({local, index}, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            try
                LayerManagerEventListener = array:get(get({local, index}), get({get({This, list}), objectArray})),
                (get({LayerManagerEventListener, '$class'})):onCreateLayerManagerEvent(LayerManagerEventListener, EventObject)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'EventStrings':getInstance(), 'FIRE_EVENT'}), E)
            end,
            Loop();
        false -> ok end end)(),
        'BasicEventHandler':fireEvent(This, EventObject).

% throws Exception
fireDeleteEvent(This, EventObject) ->
        put({local, index}, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            try
                LayerManagerEventListener = array:get(get({local, index}), get({get({This, list}), objectArray})),
                (get({LayerManagerEventListener, '$class'})):onDeleteLayerManagerEvent(LayerManagerEventListener, EventObject)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'EventStrings':getInstance(), 'FIRE_EVENT'}), E)
            end,
            Loop();
        false -> ok end end)(),
        EventListenerInterfaceList = get({This, eventListenerInterfaceList}),
        put({local, eventListenerInterface}, undefined),
        put({local, layerManagerEventListenerInterface}, undefined),
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) < (get({EventListenerInterfaceList, '$class'})):size(EventListenerInterfaceList)) of true ->
            try
                put({local, eventListenerInterface}, array:get(get({local, index}), get({EventListenerInterfaceList, objectArray}))),
                put({local, layerManagerEventListenerInterface}, (get({local, eventListenerInterface}))),
                (get({get({local, layerManagerEventListenerInterface}), '$class'})):onDeleteLayerManagerEvent(get({local, layerManagerEventListenerInterface}), EventObject)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'EventStrings':getInstance(), 'FIRE_EVENT'}), E)
            end,
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)().

% throws Exception
process(This, EventObject, EventListenerInterface) ->
        LayerManagerEventListenerInterface = (EventListenerInterface),
        (get({LayerManagerEventListenerInterface, '$class'})):onCreateLayerManagerEvent(LayerManagerEventListenerInterface, EventObject).

