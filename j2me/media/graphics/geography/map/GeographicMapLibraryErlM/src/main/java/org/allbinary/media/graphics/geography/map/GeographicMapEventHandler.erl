% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.media.graphics.geography.map
% import org.allbinary.game.layer.AllBinaryGameLayer
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GeographicMapEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'GeographicMapEventHandler':new()),
    ok.

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'GeographicMapEventHandler', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicEventHandler':'$init'(This),
    init_fields(This),
        ok.

addListener(This, GameLayer) ->
        case (not (get({get({This, list}), '$class'})):contains(get({This, list}), GameLayer)) of
            true ->
            (get({get({This, list}), '$class'})):add(get({This, list}), GameLayer);
            false -> ok
        end.

removeAllListeners(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})),
        'BasicEventHandler':removeAllListeners(This).

removeListener(This, EventListenerInterface) ->
        (get({get({This, list}), '$class'})):remove(get({This, list}), EventListenerInterface),
        'BasicEventHandler':removeListener(This, EventListenerInterface).

fireEvent(This) ->
        put({local, index}, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            try
                GameLayer = (get({get({This, list}), '$class'})):get(get({This, list}), get({local, index})),
                (get({GameLayer, '$class'})):move(GameLayer)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'EventStrings':getInstance(), 'FIRE_EVENT'}), E)
            end,
            Loop();
        false -> ok end end)().

