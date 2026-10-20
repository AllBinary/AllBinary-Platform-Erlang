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
% package org.allbinary.game
% import org.allbinary.logic.string.StringUtil

-module('GameMode').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NONE'}, 'GameMode':new(get({'StringUtil':getInstance(), 'NULL_STRING'}))),
    put({?MODULE, 'SERVER'}, 'GameMode':new("Server")),
    put({?MODULE, 'CLIENT'}, 'GameMode':new("Client")),
    ok.

init_fields(This) ->
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getName(This) ->
        get({This, name}).

toString(This) ->
        (get({This, '$class'})):getName(This).

