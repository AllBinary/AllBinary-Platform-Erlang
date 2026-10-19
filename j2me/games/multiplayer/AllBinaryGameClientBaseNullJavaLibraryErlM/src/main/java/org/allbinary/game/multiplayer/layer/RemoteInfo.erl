% 
% To change this license header, choose License Headers in Project Properties. 
% To change this template file, choose Tools | Templates 
% and open the template in the editor.  
% Generated Code Do Not Modify
% package org.allbinary.game.multiplayer.layer
% import org.allbinary.logic.string.StringUtil

-module('RemoteInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NEW_PLAYER_ID'}, 0),
    put({?MODULE, 'REMOTE_INFO'}, 'RemoteInfo':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), (-1), (-1), get({'RemoteInfo', 'NEW_PLAYER_ID'}))),
    ok.

init_fields(This) ->
    ok.


new(Username, ActorSessionId, PlayerInputId, Id) when (is_list(Username) orelse Username =:= undefined), is_integer(ActorSessionId), is_integer(PlayerInputId), is_integer(Id) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Username, ActorSessionId, PlayerInputId, Id),
    This.

init(This, Username, ActorSessionId, PlayerInputId, Id) when (is_list(Username) orelse Username =:= undefined), is_integer(ActorSessionId), is_integer(PlayerInputId), is_integer(Id) ->
    init_fields(This),
        ok.

