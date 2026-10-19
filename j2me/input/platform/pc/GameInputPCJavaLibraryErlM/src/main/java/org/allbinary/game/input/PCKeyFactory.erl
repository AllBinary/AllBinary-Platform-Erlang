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
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps

-module('PCKeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'PCKeyFactory':new()),
    ok.

init_fields(This) ->
    put({This, keyEventWrapper}, 'ABKeyEventWrapper':getInstance()),
    put({This, 'UNKNOWN'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_UNDEFINED'}), "UNKNOWN")),
    put({This, 'ENTER'}, 'PCGameKey':new(5, "Enter")),
    put({This, '_A'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_A'}), "A")),
    put({This, '_B'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_B'}), "B")),
    put({This, '_C'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_C'}), "C")),
    put({This, '_D'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_D'}), "D")),
    put({This, '_E'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_E'}), "E")),
    put({This, '_F'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_F'}), "F")),
    put({This, '_G'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_G'}), "G")),
    put({This, '_H'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_H'}), "H")),
    put({This, '_I'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_I'}), "I")),
    put({This, '_J'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_J'}), "J")),
    put({This, '_K'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_K'}), "K")),
    put({This, '_L'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_L'}), "L")),
    put({This, '_M'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_M'}), "M")),
    put({This, '_N'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_N'}), "N")),
    put({This, '_O'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_O'}), "O")),
    put({This, '_P'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_P'}), "P")),
    put({This, '_Q'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_Q'}), "Q")),
    put({This, '_R'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_R'}), "R")),
    put({This, '_S'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_S'}), "S")),
    put({This, '_T'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_T'}), "T")),
    put({This, '_U'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_U'}), "U")),
    put({This, '_V'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_V'}), "V")),
    put({This, '_W'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_W'}), "W")),
    put({This, '_X'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_X'}), "X")),
    put({This, '_Y'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_Y'}), "Y")),
    put({This, '_Z'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_Z'}), "Z")),
    put({This, a}, 'PCGameKey':new(97, "a")),
    put({This, b}, 'PCGameKey':new(98, "b")),
    put({This, c}, 'PCGameKey':new(99, "c")),
    put({This, d}, 'PCGameKey':new(100, "d")),
    put({This, e}, 'PCGameKey':new(101, "e")),
    put({This, f}, 'PCGameKey':new(102, "f")),
    put({This, g}, 'PCGameKey':new(103, "g")),
    put({This, h}, 'PCGameKey':new(104, "h")),
    put({This, i}, 'PCGameKey':new(105, "i")),
    put({This, j}, 'PCGameKey':new(106, "j")),
    put({This, k}, 'PCGameKey':new(107, "k")),
    put({This, l}, 'PCGameKey':new(108, "l")),
    put({This, m}, 'PCGameKey':new(109, "m")),
    put({This, n}, 'PCGameKey':new(110, "n")),
    put({This, o}, 'PCGameKey':new(111, "o")),
    put({This, p}, 'PCGameKey':new(112, "p")),
    put({This, q}, 'PCGameKey':new(113, "q")),
    put({This, r}, 'PCGameKey':new(114, "r")),
    put({This, s}, 'PCGameKey':new(115, "s")),
    put({This, t}, 'PCGameKey':new(116, "t")),
    put({This, u}, 'PCGameKey':new(117, "u")),
    put({This, v}, 'PCGameKey':new(118, "v")),
    put({This, w}, 'PCGameKey':new(119, "w")),
    put({This, x}, 'PCGameKey':new(120, get({'PositionStrings':getInstance(), 'X'}))),
    put({This, y}, 'PCGameKey':new(121, get({'PositionStrings':getInstance(), 'Y'}))),
    put({This, z}, 'PCGameKey':new(122, "z")),
    put({This, 'ZERO'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_0'}), get({'CommonPhoneStrings':getInstance(), 'ZERO'}))),
    put({This, 'ONE'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_1'}), get({'CommonPhoneStrings':getInstance(), 'ONE'}))),
    put({This, 'TWO'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_2'}), get({'CommonPhoneStrings':getInstance(), 'TWO'}))),
    put({This, 'THREE'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_3'}), get({'CommonPhoneStrings':getInstance(), 'THREE'}))),
    put({This, 'FOUR'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_4'}), get({'CommonPhoneStrings':getInstance(), 'FOUR'}))),
    put({This, 'FIVE'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_5'}), get({'CommonPhoneStrings':getInstance(), 'FIVE'}))),
    put({This, 'SIX'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_6'}), get({'CommonPhoneStrings':getInstance(), 'SIX'}))),
    put({This, 'SEVEN'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_7'}), get({'CommonPhoneStrings':getInstance(), 'SEVEN'}))),
    put({This, 'EIGHT'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_8'}), get({'CommonPhoneStrings':getInstance(), 'EIGHT'}))),
    put({This, 'NINE'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_9'}), get({'CommonPhoneStrings':getInstance(), 'NINE'}))),
    put({This, 'DPAD_UP'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_UP'}), get({'CommonPhoneStrings':getInstance(), 'UP'}))),
    put({This, 'DPAD_DOWN'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_DOWN'}), get({'CommonPhoneStrings':getInstance(), 'DOWN'}))),
    put({This, 'DPAD_LEFT'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_LEFT'}), get({'CommonPhoneStrings':getInstance(), 'LEFT'}))),
    put({This, 'DPAD_RIGHT'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_RIGHT'}), get({'CommonPhoneStrings':getInstance(), 'RIGHT'}))),
    put({This, 'DPAD_UP2'}, get({This, 'DPAD_UP'})),
    put({This, 'DPAD_DOWN2'}, get({This, 'DPAD_DOWN'})),
    put({This, 'DPAD_LEFT2'}, get({This, 'DPAD_LEFT'})),
    put({This, 'DPAD_RIGHT2'}, get({This, 'DPAD_RIGHT'})),
    put({This, 'COMMA'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_COMMA'}), "COMMA")),
    put({This, 'SPACE'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_SPACE'}), "SPACE")),
    put({This, 'DEL'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_DELETE'}), "DEL")),
    put({This, 'STAR'}, 'PCGameKey':new(42, get({'CommonPhoneStrings':getInstance(), 'STAR'}))),
    put({This, 'QUESTION'}, 'PCGameKey':new(47, "?")),
    put({This, 'PERIOD'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_PERIOD'}), get({'CommonSeps':getInstance(), 'PERIOD'}))),
    put({This, 'ESCAPE'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_ESCAPE'}), "Esc")),
    put({This, 'BACK_SPACE'}, 'PCGameKey':new(get({get({This, keyEventWrapper}), 'VK_BACK_SPACE'}), "Backspace")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'PCKeyFactory', 'SINGLETON'}).

isSubmission(This, Input) ->
        try
        case (Input =:= get({This, 'ENTER'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDelete(This, Input) ->
        try
        case (Input =:= get({This, 'DEL'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isBackSpace(This, Input) ->
        try
        case (Input =:= get({This, 'BACK_SPACE'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isUp(This, Input) ->
        try
        case ((Input =:= get({This, 'DPAD_UP'})) orelse (Input =:= get({This, 'DPAD_UP2'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDown(This, Input) ->
        try
        case ((Input =:= get({This, 'DPAD_DOWN'})) orelse (Input =:= get({This, 'DPAD_DOWN2'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isLeft(This, Input) ->
        try
        case ((Input =:= get({This, 'DPAD_LEFT'})) orelse (Input =:= get({This, 'DPAD_LEFT2'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isRight(This, Input) ->
        try
        case ((Input =:= get({This, 'DPAD_RIGHT'})) orelse (Input =:= get({This, 'DPAD_RIGHT2'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isEnter(This, Input) ->
        try
        case (Input =:= get({This, 'ENTER'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

