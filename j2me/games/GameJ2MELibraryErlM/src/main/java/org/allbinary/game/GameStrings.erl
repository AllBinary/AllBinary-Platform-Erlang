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

-module('GameStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'PROCESS_TICK'}, "processTick"),
    put({This, 'ON_GAME_INITIALIZED'}, "onGameInitialized"),
    put({This, 'UPDATESURFACE'}, "updateSurface"),
    put({This, 'ON_SET_DISPLAYABLE'}, "onSetDisplayable"),
    put({This, 'UNPAUSE'}, "unPause"),
    put({This, 'TOGGLE_MENU'}, "toggleMenu"),
    put({This, 'SET_GAME_OVER'}, "setGameOver"),
    put({This, 'GAME_STATE'}, "Game State: "),
    put({This, 'SET_GAME_STATE'}, "setGameState"),
    put({This, 'STOP_GAME_CANVAS_RUNNABLE_INTERFACE'}, "stopGameCanvasRunnableInterface"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GameStrings', instance}).

