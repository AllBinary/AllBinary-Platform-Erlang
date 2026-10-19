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

-module('GameInfoData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameInfoData':new()),
    ok.

init_fields(This) ->
    put({This, 'GAME_TYPE'}, "GAME_TYPE"),
    put({This, 'GAME_MODE'}, "GAME_MODE"),
    put({This, 'PLAYER_TYPE'}, "PLAYER_TYPE"),
    put({This, 'HIGHEST_LEVEL'}, "HIGHEST_LEVEL"),
    put({This, 'CURRENT_LEVEL'}, "CURRENT_LEVEL"),
    put({This, 'SOFTWARE_INFORMATION'}, "SOFTWARE_INFORMATION"),
    ok.


getInstance() ->
        get({'GameInfoData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

