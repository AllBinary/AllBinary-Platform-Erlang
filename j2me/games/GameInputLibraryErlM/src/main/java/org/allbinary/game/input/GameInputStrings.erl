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
% package org.allbinary.game.input

-module('GameInputStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameInputStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'PROCESS_INPUT'}, "processInput"),
    put({This, 'KEY_PRESSED'}, "keyPressed"),
    put({This, 'KEY_RELEASED'}, "keyReleased"),
    put({This, 'KEY_REPEATED'}, "keyRepeated"),
    put({This, 'ON_PRESS_GAME_KEY'}, "onPressGameKeyEvent"),
    put({This, 'ON_DOWN_GAME_KEY'}, "onDownGameKeyEvent"),
    put({This, 'ON_UP_GAME_KEY'}, "onUpGameKeyEvent"),
    put({This, 'NO_KEY'}, "Key Code Not Mapped For Game: "),
    put({This, 'ADD_KEY_EVENT'}, "addGameKeyEvent"),
    put({This, 'REMOVE_KEY_EVENT'}, "removeGameKeyEvent"),
    put({This, 'STRAFE_LEFT'}, "strafeLeft"),
    put({This, 'STRAFE_RIGHT'}, "strafeRight"),
    put({This, 'PROCESS_MOTION_INPUT'}, "processMotionInput"),
    put({This, 'UDPATE_CURRENT_TOUCH_INPUT_FACTORY'}, "updateCurrentTouchInputFactory"),
    put({This, 'ENABLE_PLAYER_GAME_INPUTS'}, "Enabling PlayerGameInputs: "),
    put({This, 'ENABLE_PLAYER_GAME_INPUT'}, "Enabling PlayerGameInput: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GameInputStrings', instance}).

