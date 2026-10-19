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

-module('PlayerTypesFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'PlayerTypesFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'PLAYER_TYPE_ONE'}, 'PlayerType':new("Player Type One", 0)),
    put({This, 'PLAYER_TYPE_TWO'}, 'PlayerType':new("Player Type Two", 1)),
    put({This, 'PLAYER_TYPE_THREE'}, 'PlayerType':new("Player Type Three", 2)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'PlayerTypesFactory', 'SINGLETON'}).

