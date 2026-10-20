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
% package org.allbinary.game.input.event
% import org.allbinary.game.input.PlayerGameInput
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('UpKeyEventHandlerBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

static_init() ->
    put({?MODULE, 'TOTAL_LISTENERS'}, " Total PlayerGameInput Listeners: "),
    put({?MODULE, 'LISTENER_LABEL'}, " PlayerGameInput Listener: "),
    ok.

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicEventHandler':'$init'(This),
    init_fields(This),
        ok.

addListener(This, PlayerGameInput) ->
        case (not (get({get({This, list}), '$class'})):contains(get({This, list}), PlayerGameInput)) of
            true ->
            (get({get({This, list}), '$class'})):add(get({This, list}), PlayerGameInput);
            false -> ok
        end.

removeAllListeners(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})),
        'BasicEventHandler':removeAllListeners(This).

removeListenerSingleThreaded(This, EventListenerInterface) ->
        (get({get({This, list}), '$class'})):remove(get({This, list}), EventListenerInterface),
        'BasicEventHandler':removeListenerSingleThreaded(This, EventListenerInterface).

removeListener(This, EventListenerInterface) ->
        (get({get({This, list}), '$class'})):remove(get({This, list}), EventListenerInterface),
        'BasicEventHandler':removeListener(This, EventListenerInterface).

% throws Exception
fireEventForInteger(This, EventObject) ->
        put({local, index}, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            try
                PlayerGameInput = array:get(get({local, index}), get({get({This, list}), objectArray})),
                (get({PlayerGameInput, '$class'})):onUpKeyEvent(PlayerGameInput, EventObject)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'EventStrings':getInstance(), 'FIRE_EVENT'}), E)
            end,
            Loop();
        false -> ok end end)(),
        put({local, index}, 0),
        put({local, eventListenerInterface}, undefined),
        (fun Loop() -> case (get({local, index}) < (get({get({This, eventListenerInterfaceList}), '$class'})):size(get({This, eventListenerInterfaceList}))) of true ->
            try
                put({local, eventListenerInterface}, (get({get({This, eventListenerInterfaceList}), '$class'})):get(get({This, eventListenerInterfaceList}), get({local, index}))),
                (get({This, '$class'})):processForInteger(This, EventObject, get({local, eventListenerInterface}))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'EventStrings':getInstance(), 'FIRE_EVENT'}), E)
            end,
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)().

% throws Exception
processForInteger(This, EventObject, EventListenerInterface) ->
        UpKeyEventListenerInterface = EventListenerInterface,
        (get({UpKeyEventListenerInterface, '$class'})):onUpKeyEvent(UpKeyEventListenerInterface, EventObject).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'BasicEventHandler':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'UpKeyEventHandlerBase', 'TOTAL_LISTENERS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({This, list}), '$class'})):size(get({This, list}))),
        lists:foreach(fun(Index) ->
            try
                EventListenerInterface = (get({get({This, list}), '$class'})):get(get({This, list}), Index),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({'UpKeyEventHandlerBase', 'LISTENER_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({EventListenerInterface, '$class'})):toString(EventListenerInterface))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'TOSTRING'}), E)
            end
        end, lists:seq(0, (get({get({This, list}), '$class'})):size(get({This, list})) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

