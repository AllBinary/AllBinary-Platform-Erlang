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
% package org.allbinary.game.displayable
% import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
% import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GameLevelDisplayChangeEventListenersFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameLevelDisplayChangeEventListenersFactory':new()),
    ok.

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


getInstance() ->
        get({'GameLevelDisplayChangeEventListenersFactory', instance}).

add(This, DisplayChangeEventListener) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), DisplayChangeEventListener),
        (fun(Target_N65946) -> (get({Target_N65946, '$class'})):addListenerInterface(Target_N65946, DisplayChangeEventListener) end)('DisplayChangeEventHandler':getInstance()).

clear(This) ->
        DisplayChangeEventHandler = 'DisplayChangeEventHandler':getInstance(),
        put({local, displayChangeEventListener}, undefined),
        put({local, index}, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, displayChangeEventListener}, array:get(get({local, index}), get({get({This, list}), objectArray}))),
            (get({DisplayChangeEventHandler, '$class'})):removeListener(DisplayChangeEventHandler, get({local, displayChangeEventListener})),
            Loop();
        false -> ok end end)(),
        (get({get({This, list}), '$class'})):clear(get({This, list})).

