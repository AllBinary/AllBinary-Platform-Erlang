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
    put({This, 'UNKNOWN'}, 'PCGameKey':new(254, "UNKNOWN")),
    put({This, 'ENTER'}, 'PCGameKey':new(13, "Enter")),
    put({This, '_A'}, 'PCGameKey':new(65, "A")),
    put({This, '_B'}, 'PCGameKey':new(66, "B")),
    put({This, '_C'}, 'PCGameKey':new(67, "C")),
    put({This, '_D'}, 'PCGameKey':new(68, "D")),
    put({This, '_E'}, 'PCGameKey':new(69, "E")),
    put({This, '_F'}, 'PCGameKey':new(70, "F")),
    put({This, '_G'}, 'PCGameKey':new(71, "G")),
    put({This, '_H'}, 'PCGameKey':new(72, "H")),
    put({This, '_I'}, 'PCGameKey':new(73, "I")),
    put({This, '_J'}, 'PCGameKey':new(74, "J")),
    put({This, '_K'}, 'PCGameKey':new(75, "K")),
    put({This, '_L'}, 'PCGameKey':new(76, "L")),
    put({This, '_M'}, 'PCGameKey':new(77, "M")),
    put({This, '_N'}, 'PCGameKey':new(78, "N")),
    put({This, '_O'}, 'PCGameKey':new(79, "O")),
    put({This, '_P'}, 'PCGameKey':new(80, "P")),
    put({This, '_Q'}, 'PCGameKey':new(81, "Q")),
    put({This, '_R'}, 'PCGameKey':new(82, "R")),
    put({This, '_S'}, 'PCGameKey':new(83, "S")),
    put({This, '_T'}, 'PCGameKey':new(84, "T")),
    put({This, '_U'}, 'PCGameKey':new(85, "U")),
    put({This, '_V'}, 'PCGameKey':new(86, "V")),
    put({This, '_W'}, 'PCGameKey':new(87, "W")),
    put({This, '_X'}, 'PCGameKey':new(88, "X")),
    put({This, '_Y'}, 'PCGameKey':new(89, "Y")),
    put({This, '_Z'}, 'PCGameKey':new(90, "Z")),
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
    put({This, 'ZERO'}, 'PCGameKey':new(48, get({'CommonPhoneStrings':getInstance(), 'ZERO'}))),
    put({This, 'ONE'}, 'PCGameKey':new(49, get({'CommonPhoneStrings':getInstance(), 'ONE'}))),
    put({This, 'TWO'}, 'PCGameKey':new(50, get({'CommonPhoneStrings':getInstance(), 'TWO'}))),
    put({This, 'THREE'}, 'PCGameKey':new(51, get({'CommonPhoneStrings':getInstance(), 'THREE'}))),
    put({This, 'FOUR'}, 'PCGameKey':new(52, get({'CommonPhoneStrings':getInstance(), 'FOUR'}))),
    put({This, 'FIVE'}, 'PCGameKey':new(53, get({'CommonPhoneStrings':getInstance(), 'FIVE'}))),
    put({This, 'SIX'}, 'PCGameKey':new(54, get({'CommonPhoneStrings':getInstance(), 'SIX'}))),
    put({This, 'SEVEN'}, 'PCGameKey':new(55, get({'CommonPhoneStrings':getInstance(), 'SEVEN'}))),
    put({This, 'EIGHT'}, 'PCGameKey':new(56, get({'CommonPhoneStrings':getInstance(), 'EIGHT'}))),
    put({This, 'NINE'}, 'PCGameKey':new(57, get({'CommonPhoneStrings':getInstance(), 'NINE'}))),
    put({This, 'DPAD_UP'}, 'PCGameKey':new(38, get({'CommonPhoneStrings':getInstance(), 'UP'}))),
    put({This, 'DPAD_DOWN'}, 'PCGameKey':new(40, get({'CommonPhoneStrings':getInstance(), 'DOWN'}))),
    put({This, 'DPAD_LEFT'}, 'PCGameKey':new(37, get({'CommonPhoneStrings':getInstance(), 'LEFT'}))),
    put({This, 'DPAD_RIGHT'}, 'PCGameKey':new(39, get({'CommonPhoneStrings':getInstance(), 'RIGHT'}))),
    put({This, 'DPAD_UP2'}, get({This, 'DPAD_UP'})),
    put({This, 'DPAD_DOWN2'}, get({This, 'DPAD_DOWN'})),
    put({This, 'DPAD_LEFT2'}, get({This, 'DPAD_LEFT'})),
    put({This, 'DPAD_RIGHT2'}, get({This, 'DPAD_RIGHT'})),
    put({This, 'COMMA'}, 'PCGameKey':new(44, "COMMA")),
    put({This, 'SPACE'}, 'PCGameKey':new(32, "SPACE")),
    put({This, 'DEL'}, 'PCGameKey':new(46, "DEL")),
    put({This, 'STAR'}, 'PCGameKey':new(42, get({'CommonPhoneStrings':getInstance(), 'STAR'}))),
    put({This, 'QUESTION'}, 'PCGameKey':new(47, "?")),
    put({This, 'PERIOD'}, 'PCGameKey':new(46, get({'CommonSeps':getInstance(), 'PERIOD'}))),
    put({This, 'ESCAPE'}, 'PCGameKey':new(27, "Esc")),
    put({This, 'BACK_SPACE'}, 'PCGameKey':new(8, "Backspace")),
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

