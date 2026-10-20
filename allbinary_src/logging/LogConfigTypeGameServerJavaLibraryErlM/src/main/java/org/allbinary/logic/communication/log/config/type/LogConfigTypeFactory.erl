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
% package org.allbinary.logic.communication.log.config.type
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory

-module('LogConfigTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogConfigTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NO_DESCRIPTION'}, "No Description"),
    put({This, 'INIT_SERVER'}, 'LogConfigType':new("Init Server", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'LOBBY_SERVER'}, 'LogConfigType':new("Lobby Server", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'GAME_SERVER'}, 'LogConfigType':new("Game Server", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'GAME_SIMULATOR'}, 'LogConfigType':new("Game Simulator", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'CUSTOM_TYPES'}, 'LogConfigType':new("Custom Types", get({This, 'NO_DESCRIPTION'}))),
    ok.


getInstance() ->
        get({'LogConfigTypeFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):add(get({'LogConfigTypes', 'LOGGING'}), get({This, 'INIT_SERVER'})).

