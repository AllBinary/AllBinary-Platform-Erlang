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
% import org.allbinary.input.motion.button.BasicTouchInputFactory
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory

-module('MotionLaptopDefaultGameInputMapping').
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
        PcKeyFactory = 'PCKeyFactory':getInstance(),
        InputToGameKeyMapping = (get({This, '$class'})):getInputMapping(This),
        GameKeyFactory = 'GameKeyFactory':getInstance(),
        TouchMotionGestureFactory = 'TouchMotionGestureFactory':getInstance(),
        BasicTouchInputFactory = 'BasicTouchInputFactory':getInstance(),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'FIRE'}), get({PcKeyFactory, 'ENTER'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({PcKeyFactory, 'FOUR'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({PcKeyFactory, '_P'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({PcKeyFactory, p})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({PcKeyFactory, 'DPAD_UP'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({PcKeyFactory, 'DPAD_DOWN'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({PcKeyFactory, 'DPAD_LEFT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({PcKeyFactory, 'DPAD_RIGHT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM7'}), get({PcKeyFactory, '_Y'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM9'}), get({PcKeyFactory, '_I'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({PcKeyFactory, '_U'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({PcKeyFactory, '_H'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({PcKeyFactory, '_J'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({PcKeyFactory, '_N'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM5'}), get({PcKeyFactory, '_M'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM7'}), get({PcKeyFactory, y})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM9'}), get({PcKeyFactory, i})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({PcKeyFactory, u})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({PcKeyFactory, h})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({PcKeyFactory, j})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({PcKeyFactory, n})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM5'}), get({PcKeyFactory, m})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM7'}), get({PcKeyFactory, '_Q'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM9'}), get({PcKeyFactory, '_E'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({PcKeyFactory, '_W'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({PcKeyFactory, '_A'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({PcKeyFactory, '_D'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({PcKeyFactory, '_S'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM5'}), get({PcKeyFactory, '_X'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM7'}), get({PcKeyFactory, q})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM9'}), get({PcKeyFactory, e})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({PcKeyFactory, w})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({PcKeyFactory, a})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({PcKeyFactory, d})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({PcKeyFactory, s})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM5'}), get({PcKeyFactory, x})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({TouchMotionGestureFactory, 'UP'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({TouchMotionGestureFactory, 'DOWN'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({TouchMotionGestureFactory, 'LEFT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({TouchMotionGestureFactory, 'RIGHT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({BasicTouchInputFactory, 'UP'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({BasicTouchInputFactory, 'LEFT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({BasicTouchInputFactory, 'RIGHT'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({BasicTouchInputFactory, 'DOWN'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM0'}), get({BasicTouchInputFactory, 'SPECIAL_BUTTON_FIVE'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM7'}), get({BasicTouchInputFactory, 'SPECIAL_BUTTON_FOUR'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM9'}), get({BasicTouchInputFactory, 'SPECIAL_BUTTON_THREE'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({BasicTouchInputFactory, 'SPECIAL_BUTTON_TWO'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM3'}), get({BasicTouchInputFactory, 'SPECIAL_BUTTON_ONE'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM2'}), get({BasicTouchInputFactory, 'SPECIAL_BUTTON_SIX'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM3'}), get({PcKeyFactory, 'THREE'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM0'}), get({PcKeyFactory, 'ZERO'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM0'}), get({PcKeyFactory, 'ONE'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM0'}), get({PcKeyFactory, 'SPACE'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_POUND'}), get({PcKeyFactory, 'DEL'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_POUND'}), get({PcKeyFactory, 'TWO'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_STAR'}), get({PcKeyFactory, 'ESCAPE'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_STAR'}), get({PcKeyFactory, 'STAR'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEVEL_DOWN'}), get({PcKeyFactory, 'COMMA'})),
        (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEVEL_UP'}), get({PcKeyFactory, 'PERIOD'})).

