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
% package org.allbinary.logic.util.event.handler
% import jsinterop.annotations.JsType
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('BasicEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BasicEventHandlerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, eventStrings}, 'EventStrings':getInstance()),
    put({This, eventListenerInterfaceList}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, eventListenerInterfaceList}, 'BasicArrayListD':new()).

removeAllListeners(This) ->
        put({This, eventListenerInterfaceList}, 'BasicArrayListD':new()).

addListeners(This, Vector) ->
        put({local, eventListenerInterface}, undefined),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            put({local, eventListenerInterface}, (get({Vector, '$class'})):get(Vector, Index)),
            (get({This, '$class'})):addListenerInterface(This, get({local, eventListenerInterface}))
        end, lists:seq(0, Size - 1)).

removeListeners(This, Vector) ->
        put({local, eventListenerInterface}, undefined),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            put({local, eventListenerInterface}, (get({Vector, '$class'})):get(Vector, Index)),
            (get({This, '$class'})):removeListener(This, get({local, eventListenerInterface}))
        end, lists:seq(0, Size - 1)).

addListenerSingleThreaded(This, EventListenerInterface) ->
        case (not (get({get({This, eventListenerInterfaceList}), '$class'})):contains(get({This, eventListenerInterfaceList}), EventListenerInterface)) of
            true ->
            (get({get({This, eventListenerInterfaceList}), '$class'})):add(get({This, eventListenerInterfaceList}), EventListenerInterface);
            false -> ok
        end.

addListenerInterface(This, EventListenerInterface) ->
        case (not (get({get({This, eventListenerInterfaceList}), '$class'})):contains(get({This, eventListenerInterfaceList}), EventListenerInterface)) of
            true ->
            (get({get({This, eventListenerInterfaceList}), '$class'})):add(get({This, eventListenerInterfaceList}), EventListenerInterface);
            false -> ok
        end.

removeListenerSingleThreaded(This, EventListenerInterface) ->
        (get({get({This, eventListenerInterfaceList}), '$class'})):remove(get({This, eventListenerInterfaceList}), EventListenerInterface).

removeListener(This, EventListenerInterface) ->
        (get({get({This, eventListenerInterfaceList}), '$class'})):remove(get({This, eventListenerInterfaceList}), EventListenerInterface).

% throws Exception
fireEvent(This, EventObject) ->
        put({local, eventListenerInterface}, undefined),
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) < (get({get({This, eventListenerInterfaceList}), '$class'})):size(get({This, eventListenerInterfaceList}))) of true ->
            try
                put({local, eventListenerInterface}, (get({get({This, eventListenerInterfaceList}), '$class'})):get(get({This, eventListenerInterfaceList}), get({local, index}))),
                (get({This, '$class'})):process(This, EventObject, get({local, eventListenerInterface}))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, eventStrings}), 'FIRE_EVENT'}), E)
            end,
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)().

% throws Exception
process(This, EventObject, EventListenerInterface) ->
        (get({EventListenerInterface, '$class'})):onEvent(EventListenerInterface, EventObject).

getEventListenerInterfaceListP(This) ->
        get({This, eventListenerInterfaceList}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, eventStrings}), 'TOTAL_LISTENERS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({This, eventListenerInterfaceList}), '$class'})):size(get({This, eventListenerInterfaceList}))),
        put({local, eventListenerInterface}, undefined),
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) < (get({get({This, eventListenerInterfaceList}), '$class'})):size(get({This, eventListenerInterfaceList}))) of true ->
            try
                put({local, eventListenerInterface}, (get({get({This, eventListenerInterfaceList}), '$class'})):get(get({This, eventListenerInterfaceList}), get({local, index}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, eventStrings}), 'LISTENER_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({local, eventListenerInterface}), '$class'})):toString(get({local, eventListenerInterface})))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'TOSTRING'}), E)
            end,
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

