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
% package org.allbinary.game.layer.hud.event
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.NullEventListener
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.util.BasicArrayList

-module('GameNotificationEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'GameNotificationEventHandler':new()),
    ok.

init_fields(This) ->
    put({This, enabled}, true),
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

removeAllListeners(This) ->
        put({local, eventListenerInterface}, get({'NullEventListener', 'NULL_EVENT_LISTENER'})),
        List = get({This, eventListenerInterfaceList}),
        case ((get({List, '$class'})):size(List) > 0) of
            true ->
            put({local, eventListenerInterface}, array:get(0, get({List, objectArray})));
            false -> ok
        end,
        'BasicEventHandler':removeAllListeners(This),
        case (get({local, eventListenerInterface}) =/= get({'NullEventListener', 'NULL_EVENT_LISTENER'})) of
            true ->
            (get({This, '$class'})):addListenerInterface(This, get({local, eventListenerInterface}));
            false -> ok
        end.

getInstance() ->
        get({'GameNotificationEventHandler', instance}).

% throws Exception
process(This, EventObject, EventListenerInterface) ->
        try
        case (not get({This, enabled})) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        GameNotificationListenerInterface = EventListenerInterface,
        (get({GameNotificationListenerInterface, '$class'})):onGameNotificationEvent(GameNotificationListenerInterface, EventObject)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

