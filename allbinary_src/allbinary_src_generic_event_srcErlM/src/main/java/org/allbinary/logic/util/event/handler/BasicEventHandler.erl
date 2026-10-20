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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements BasicEventHandlerInterface

static_init() ->
    put({?MODULE, 'PERFORMANCE_MESSAGE'}, "Use Custom onEvent Methods for needed optimization"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
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

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        LISTENER = " Listener: ",
        (get({StringBuffer, '$class'})):append(StringBuffer, "Total Listeners: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({This, eventListenerInterfaceList}), '$class'})):size(get({This, eventListenerInterfaceList}))),
        put({local, eventListenerInterface}, undefined),
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) < (get({get({This, eventListenerInterfaceList}), '$class'})):size(get({This, eventListenerInterfaceList}))) of true ->
            try
                put({local, eventListenerInterface}, array:get(get({local, index}), get({get({This, eventListenerInterfaceList}), objectArray}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, LISTENER),
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66401) -> (get({Target_N66401, '$class'})):toString(Target_N66401, get({local, eventListenerInterface})) end)('StringUtil':getInstance()))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'TOSTRING'}), E)
            end,
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

removeAllListeners(This) ->
        put({This, eventListenerInterfaceList}, 'BasicArrayListD':new()).

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
        put({local, index}, 0),
        put({local, eventListenerInterface}, undefined),
        (fun Loop() -> case (get({local, index}) < (get({get({This, eventListenerInterfaceList}), '$class'})):size(get({This, eventListenerInterfaceList}))) of true ->
            try
                put({local, eventListenerInterface}, array:get(get({local, index}), get({get({This, eventListenerInterfaceList}), objectArray}))),
                (get({This, '$class'})):process(This, EventObject, get({local, eventListenerInterface}))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({'EventStrings':getInstance(), 'FIRE_EVENT'}), E)
            end,
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)().

% throws Exception
process(This, EventObject, EventListenerInterface) ->
        (get({EventListenerInterface, '$class'})):onEvent(EventListenerInterface, EventObject).

getEventListenerInterfaceListP(This) ->
        get({This, eventListenerInterfaceList}).

