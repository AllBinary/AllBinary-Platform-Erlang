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
% import org.allbinary.game.configuration.persistance.GamePersistanceStrings
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.game.input.mapping.PersistentInputMapping

-module('NormalJ2MEDefaultGameInputMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PersistentInputMapping', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'PersistentInputMapping':'$init'(This, get({'GamePersistanceStrings':getInstance(), 'DEFAULT_INPUT_MAPPING_RECORD_ID'})),
        InputToGameKeyMapping = (get({This, '$class'})):getInputMapping(This),
        GameKeyFactory = 'GameKeyFactory':getInstance(),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({GameKeyFactory, 'KEY_NUM2'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({GameKeyFactory, 'KEY_NUM4'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({GameKeyFactory, 'KEY_NUM6'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({GameKeyFactory, 'KEY_NUM8'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({GameKeyFactory, 'GAME_A'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM3'}), get({GameKeyFactory, 'GAME_B'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM7'}), get({GameKeyFactory, 'GAME_C'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM9'}), get({GameKeyFactory, 'GAME_D'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEVEL_DOWN'}), get({GameKeyFactory, 'LEVEL_DOWN'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEVEL_UP'}), get({GameKeyFactory, 'LEVEL_UP'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({GameKeyFactory, 'UP'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({GameKeyFactory, 'DOWN'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({GameKeyFactory, 'LEFT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({GameKeyFactory, 'RIGHT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_POUND'}), get({GameKeyFactory, 'KEY_POUND'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_STAR'}), get({GameKeyFactory, 'KEY_STAR'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({GameKeyFactory, 'KEY_NUM1'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM3'}), get({GameKeyFactory, 'KEY_NUM3'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM5'}), get({GameKeyFactory, 'KEY_NUM5'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM7'}), get({GameKeyFactory, 'KEY_NUM7'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM9'}), get({GameKeyFactory, 'KEY_NUM9'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM0'}), get({GameKeyFactory, 'KEY_NUM0'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({GameKeyFactory, 'FIRE'})).

