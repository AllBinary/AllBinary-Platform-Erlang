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
% package org.allbinary.graphics.displayable

-module('GameTickDisplayInfoSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameTickDisplayInfoSingleton':new()),
    ok.

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, lastWidth}, (get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton}))),
    put({This, lastHeight}, (get({get({This, displayInfoSingleton}), '$class'})):getLastHeight(get({This, displayInfoSingleton}))),
    put({This, lastHalfWidth}, (get({get({This, displayInfoSingleton}), '$class'})):getLastHalfWidth(get({This, displayInfoSingleton}))),
    put({This, lastHalfHeight}, (get({get({This, displayInfoSingleton}), '$class'})):getLastHalfHeight(get({This, displayInfoSingleton}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'GameTickDisplayInfoSingleton', instance}).

update(This) ->
        put({This, lastWidth}, (get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton}))),
        put({This, lastHeight}, (get({get({This, displayInfoSingleton}), '$class'})):getLastHeight(get({This, displayInfoSingleton}))),
        put({This, lastHalfWidth}, (get({get({This, displayInfoSingleton}), '$class'})):getLastHalfWidth(get({This, displayInfoSingleton}))),
        put({This, lastHalfHeight}, (get({get({This, displayInfoSingleton}), '$class'})):getLastHalfHeight(get({This, displayInfoSingleton}))).

getLastWidth(This) ->
        get({This, lastWidth}).

getLastHeight(This) ->
        get({This, lastHeight}).

getLastHalfWidth(This) ->
        get({This, lastHalfWidth}).

getLastHalfHeight(This) ->
        get({This, lastHalfHeight}).

