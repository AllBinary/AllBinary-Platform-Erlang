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
% import javax.microedition.lcdui.Canvas
% import org.allbinary.logic.NullUtil
% import org.allbinary.string.CommonPhoneStrings

-module('GameKeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'NONE'}, 'GameKey':new((get({'InputFactory':getInstance(), 'MAX'}) - 1), "None")),
    put({This, 'UP'}, 'GameKey':new(get({'Canvas', 'UP'}), get({'CommonPhoneStrings':getInstance(), 'UP'}))),
    put({This, 'DOWN'}, 'GameKey':new(get({'Canvas', 'DOWN'}), get({'CommonPhoneStrings':getInstance(), 'DOWN'}))),
    put({This, 'LEFT'}, 'GameKey':new(get({'Canvas', 'LEFT'}), get({'CommonPhoneStrings':getInstance(), 'LEFT'}))),
    put({This, 'RIGHT'}, 'GameKey':new(get({'Canvas', 'RIGHT'}), get({'CommonPhoneStrings':getInstance(), 'RIGHT'}))),
    put({This, 'KEY_POUND'}, 'GameKey':new(get({'Canvas', 'KEY_POUND'}), "POUND")),
    put({This, 'KEY_STAR'}, 'GameKey':new(get({'Canvas', 'KEY_STAR'}), "STAR")),
    put({This, 'KEY_NUM0'}, 'GameKey':new(get({'Canvas', 'KEY_NUM0'}), get({'CommonPhoneStrings':getInstance(), 'ZERO'}))),
    put({This, 'KEY_NUM1'}, 'GameKey':new(get({'Canvas', 'KEY_NUM1'}), get({'CommonPhoneStrings':getInstance(), 'ONE'}))),
    put({This, 'KEY_NUM2'}, 'GameKey':new(get({'Canvas', 'KEY_NUM2'}), get({'CommonPhoneStrings':getInstance(), 'TWO'}))),
    put({This, 'KEY_NUM3'}, 'GameKey':new(get({'Canvas', 'KEY_NUM3'}), get({'CommonPhoneStrings':getInstance(), 'THREE'}))),
    put({This, 'KEY_NUM4'}, 'GameKey':new(get({'Canvas', 'KEY_NUM4'}), get({'CommonPhoneStrings':getInstance(), 'FOUR'}))),
    put({This, 'KEY_NUM5'}, 'GameKey':new(get({'Canvas', 'KEY_NUM5'}), get({'CommonPhoneStrings':getInstance(), 'FIVE'}))),
    put({This, 'KEY_NUM6'}, 'GameKey':new(get({'Canvas', 'KEY_NUM6'}), get({'CommonPhoneStrings':getInstance(), 'SIX'}))),
    put({This, 'KEY_NUM7'}, 'GameKey':new(get({'Canvas', 'KEY_NUM7'}), get({'CommonPhoneStrings':getInstance(), 'SEVEN'}))),
    put({This, 'KEY_NUM8'}, 'GameKey':new(get({'Canvas', 'KEY_NUM8'}), get({'CommonPhoneStrings':getInstance(), 'EIGHT'}))),
    put({This, 'KEY_NUM9'}, 'GameKey':new(get({'Canvas', 'KEY_NUM9'}), get({'CommonPhoneStrings':getInstance(), 'NINE'}))),
    put({This, 'GAME_A'}, 'GameKey':new(get({'Canvas', 'GAME_A'}), "Game A")),
    put({This, 'GAME_B'}, 'GameKey':new(get({'Canvas', 'GAME_B'}), "Game B")),
    put({This, 'GAME_C'}, 'GameKey':new(get({'Canvas', 'GAME_C'}), "Game C")),
    put({This, 'GAME_D'}, 'GameKey':new(get({'Canvas', 'GAME_D'}), "Game D")),
    put({This, 'FIRE'}, 'GameKey':new(get({'Canvas', 'FIRE'}), get({'CommonPhoneStrings':getInstance(), 'FIRE'}))),
    put({This, 'LEVEL_DOWN'}, 'GameKey':new((get({'Canvas', 'KEY_NUM9'}) + 1), "Cheat Level Up")),
    put({This, 'LEVEL_UP'}, 'GameKey':new((get({'Canvas', 'KEY_NUM9'}) + 2), "Cheat Level Down")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        case (get({'GameKeyFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameKeyFactory', instance}, 'GameKeyFactory':new());
            false -> ok
        end,
        get({'GameKeyFactory', instance}).

