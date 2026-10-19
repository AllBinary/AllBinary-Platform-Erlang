% Generated Code Do Not Modify
% package org.allbinary.game.input
% import android.view.KeyEvent
% import org.allbinary.android.ActivityFractureUtil
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil

-module('AndroidKeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ActivityFractureUtil', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'UNKNOWN'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_UNKNOWN'}), "UNKNOWN")),
    put({This, 'KEYCODE_BUTTON_L1'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_R1'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_THUMBR'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_THUMBL'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_START'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_MODE'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_B'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_A'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_X'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_Y'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_L2'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_R2'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_SELECT'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_C'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_Z'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_1'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_10'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_11'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_12'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_13'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_14'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_15'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_16'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_2'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_3'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_4'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_5'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_6'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_7'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_8'}, get({This, 'UNKNOWN'})),
    put({This, 'KEYCODE_BUTTON_9'}, get({This, 'UNKNOWN'})),
    put({This, 'SOFT_LEFT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SOFT_LEFT'}), "SOFT_LEFT")),
    put({This, 'SOFT_RIGHT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SOFT_RIGHT'}), "SOFT_RIGHT")),
    put({This, 'HOME'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_HOME'}), "HOME")),
    put({This, 'BACK'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BACK'}), "BACK")),
    put({This, 'CALL'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_CALL'}), "CALL")),
    put({This, 'ENDCALL'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_ENDCALL'}), "ENDCALL")),
    put({This, 'ZERO'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_0'}), get({'CommonPhoneStrings':getInstance(), 'ZERO'}))),
    put({This, 'ONE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_1'}), get({'CommonPhoneStrings':getInstance(), 'ONE'}))),
    put({This, 'TWO'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_2'}), get({'CommonPhoneStrings':getInstance(), 'TWO'}))),
    put({This, 'THREE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_3'}), get({'CommonPhoneStrings':getInstance(), 'THREE'}))),
    put({This, 'FOUR'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_4'}), get({'CommonPhoneStrings':getInstance(), 'FOUR'}))),
    put({This, 'FIVE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_5'}), get({'CommonPhoneStrings':getInstance(), 'FIVE'}))),
    put({This, 'SIX'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_6'}), get({'CommonPhoneStrings':getInstance(), 'SIX'}))),
    put({This, 'SEVEN'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_7'}), get({'CommonPhoneStrings':getInstance(), 'SEVEN'}))),
    put({This, 'EIGHT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_8'}), get({'CommonPhoneStrings':getInstance(), 'EIGHT'}))),
    put({This, 'NINE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_9'}), get({'CommonPhoneStrings':getInstance(), 'NINE'}))),
    put({This, 'STAR'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_STAR'}), get({'CommonPhoneStrings':getInstance(), 'STAR'}))),
    put({This, 'POUND'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_POUND'}), get({'CommonPhoneStrings':getInstance(), 'POUND'}))),
    put({This, 'DPAD_UP'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_DPAD_UP'}), "UP")),
    put({This, 'DPAD_DOWN'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_DPAD_DOWN'}), "DOWN")),
    put({This, 'DPAD_LEFT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_DPAD_LEFT'}), "LEFT")),
    put({This, 'DPAD_RIGHT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_DPAD_RIGHT'}), "RIGHT")),
    put({This, 'DPAD_CENTER'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_DPAD_CENTER'}), "CENTER")),
    put({This, 'VOLUME_UP'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_VOLUME_UP'}), "VOLUME_UP")),
    put({This, 'VOLUME_DOWN'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_VOLUME_DOWN'}), "VOLUME_DOWN")),
    put({This, 'POWER'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_POWER'}), "POWER")),
    put({This, 'CAMERA'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_CAMERA'}), "CAMERA")),
    put({This, 'CLEAR'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_CLEAR'}), "CLEAR")),
    put({This, 'A'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_A'}), "A")),
    put({This, 'B'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_B'}), "B")),
    put({This, 'C'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_C'}), "C")),
    put({This, 'D'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_D'}), "D")),
    put({This, 'E'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_E'}), "E")),
    put({This, 'F'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_F'}), "F")),
    put({This, 'G'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_G'}), "G")),
    put({This, 'H'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_H'}), "H")),
    put({This, 'I'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_I'}), "I")),
    put({This, 'J'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_J'}), "J")),
    put({This, 'K'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_K'}), "K")),
    put({This, 'L'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_L'}), "L")),
    put({This, 'M'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_M'}), "M")),
    put({This, 'N'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_N'}), "N")),
    put({This, 'O'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_O'}), "O")),
    put({This, 'P'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_P'}), "P")),
    put({This, 'Q'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_Q'}), "Q")),
    put({This, 'R'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_R'}), "R")),
    put({This, 'S'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_S'}), "S")),
    put({This, 'T'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_T'}), "T")),
    put({This, 'U'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_U'}), "U")),
    put({This, 'V'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_V'}), "V")),
    put({This, 'W'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_W'}), "W")),
    put({This, 'X'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_X'}), "X")),
    put({This, 'Y'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_Y'}), "Y")),
    put({This, 'Z'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_Z'}), "Z")),
    put({This, 'COMMA'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_COMMA'}), "COMMA")),
    put({This, 'PERIOD'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_PERIOD'}), get({'AbPathData':getInstance(), 'EXTENSION_SEP'}))),
    put({This, 'ALT_LEFT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_ALT_LEFT'}), "ALT_LEFT")),
    put({This, 'ALT_RIGHT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_ALT_RIGHT'}), "ALT_RIGHT")),
    put({This, 'SHIFT_LEFT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SHIFT_LEFT'}), "SHIFT_LEFT")),
    put({This, 'SHIFT_RIGHT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SHIFT_RIGHT'}), "SHIFT_RIGHT")),
    put({This, 'TAB'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_TAB'}), "TAB")),
    put({This, 'SPACE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SPACE'}), "SPACE")),
    put({This, 'SYM'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SYM'}), "SYM")),
    put({This, 'EXPLORER'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_EXPLORER'}), "EXPLORER")),
    put({This, 'ENVELOPE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_ENVELOPE'}), "ENVELOPE")),
    put({This, 'ENTER'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_ENTER'}), "ENTER")),
    put({This, 'DEL'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_DEL'}), "DEL")),
    put({This, 'GRAVE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_GRAVE'}), "GRAVE")),
    put({This, 'MINUS'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_MINUS'}), "MINUS")),
    put({This, 'EQUALS'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_EQUALS'}), "EQUALS")),
    put({This, 'LEFT_BRACKET'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_LEFT_BRACKET'}), "LEFT_BRACKET")),
    put({This, 'RIGHT_BRACKET'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_RIGHT_BRACKET'}), "RIGHT_BRACKET")),
    put({This, 'BACKSLASH'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BACKSLASH'}), "BACKSLASH")),
    put({This, 'SEMICOLON'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SEMICOLON'}), "SEMICOLON")),
    put({This, 'APOSTROPHE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_APOSTROPHE'}), "APOSTROPHE")),
    put({This, 'SLASH'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SLASH'}), "SLASH")),
    put({This, 'AT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_AT'}), "AT")),
    put({This, 'NUM'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_NUM'}), "NUM")),
    put({This, 'HEADSETHOOK'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_HEADSETHOOK'}), "HEADSETHOOK")),
    put({This, 'FOCUS'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_FOCUS'}), "FOCUS")),
    put({This, 'PLUS'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_PLUS'}), "PLUS")),
    put({This, 'MENU'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_MENU'}), "MENU")),
    put({This, 'NOTIFICATION'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_NOTIFICATION'}), "NOTIFICATION")),
    put({This, 'SEARCH'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_SEARCH'}), "SEARCH")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'ActivityFractureUtil':init(This),
    init_fields(This).


init(This) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Start/End", This, get({CommonStrings, 'INIT'})).

isSubmission(This, Input) ->
        try
        case (Input =:= get({This, 'ENTER'})) of
            true ->
            throw({'$return', true});
            false ->
            case (Input =:= get({This, 'DPAD_CENTER'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDelete(This, Input) ->
        false.

isBackSpace(This, Input) ->
        try
        case (Input =:= get({This, 'DEL'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isLeft(This, Input) ->
        try
        case (Input =:= get({This, 'DPAD_LEFT'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isRight(This, Input) ->
        try
        case (Input =:= get({This, 'DPAD_RIGHT'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isUp(This, Input) ->
        try
        case (Input =:= get({This, 'DPAD_UP'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDown(This, Input) ->
        try
        case (Input =:= get({This, 'DPAD_DOWN'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isEnter(This, Input) ->
        try
        case (Input =:= get({This, 'DPAD_CENTER'})) of
            true ->
            throw({'$return', true});
            false ->
            case (Input =:= get({This, 'ENTER'})) of
            true ->
            throw({'$return', true});
            false ->
            case (Input =:= get({This, 'CALL'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end
        end
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

