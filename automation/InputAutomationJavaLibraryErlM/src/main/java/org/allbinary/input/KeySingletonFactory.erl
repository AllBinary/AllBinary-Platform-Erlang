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
% package org.allbinary.input
% import java.awt.event.KeyEvent
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('KeySingletonFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, keyStringHashtable}, (fun(Target_N65782) -> (get({Target_N65782, '$class'})):createHashtable(Target_N65782) end)('StdUtil':getInstance())),
    put({?MODULE, keyArray}, array:from_list([get({'KeyEvent', 'VK_0'}), get({'KeyEvent', 'VK_1'}), get({'KeyEvent', 'VK_2'}), get({'KeyEvent', 'VK_3'}), get({'KeyEvent', 'VK_4'}), get({'KeyEvent', 'VK_5'}), get({'KeyEvent', 'VK_6'}), get({'KeyEvent', 'VK_7'}), get({'KeyEvent', 'VK_8'}), get({'KeyEvent', 'VK_9'}), get({'KeyEvent', 'VK_A'}), get({'KeyEvent', 'VK_B'}), get({'KeyEvent', 'VK_C'}), get({'KeyEvent', 'VK_D'}), get({'KeyEvent', 'VK_E'}), get({'KeyEvent', 'VK_F'}), get({'KeyEvent', 'VK_G'}), get({'KeyEvent', 'VK_H'}), get({'KeyEvent', 'VK_I'}), get({'KeyEvent', 'VK_J'}), get({'KeyEvent', 'VK_K'}), get({'KeyEvent', 'VK_L'}), get({'KeyEvent', 'VK_M'}), get({'KeyEvent', 'VK_N'}), get({'KeyEvent', 'VK_O'}), get({'KeyEvent', 'VK_Q'}), get({'KeyEvent', 'VK_R'}), get({'KeyEvent', 'VK_S'}), get({'KeyEvent', 'VK_T'}), get({'KeyEvent', 'VK_U'}), get({'KeyEvent', 'VK_V'}), get({'KeyEvent', 'VK_W'}), get({'KeyEvent', 'VK_X'}), get({'KeyEvent', 'VK_Y'}), get({'KeyEvent', 'VK_Z'}), get({'KeyEvent', 'VK_NUMPAD0'}), get({'KeyEvent', 'VK_NUMPAD1'}), get({'KeyEvent', 'VK_NUMPAD2'}), get({'KeyEvent', 'VK_NUMPAD3'}), get({'KeyEvent', 'VK_NUMPAD4'}), get({'KeyEvent', 'VK_NUMPAD5'}), get({'KeyEvent', 'VK_NUMPAD6'}), get({'KeyEvent', 'VK_NUMPAD7'}), get({'KeyEvent', 'VK_NUMPAD8'}), get({'KeyEvent', 'VK_NUMPAD9'}), get({'KeyEvent', 'VK_NUM_LOCK'}), get({'KeyEvent', 'VK_F1'}), get({'KeyEvent', 'VK_F2'}), get({'KeyEvent', 'VK_F3'}), get({'KeyEvent', 'VK_F4'}), get({'KeyEvent', 'VK_F5'}), get({'KeyEvent', 'VK_F6'}), get({'KeyEvent', 'VK_F7'}), get({'KeyEvent', 'VK_F8'}), get({'KeyEvent', 'VK_F9'}), get({'KeyEvent', 'VK_F10'}), get({'KeyEvent', 'VK_F11'}), get({'KeyEvent', 'VK_F12'}), get({'KeyEvent', 'VK_F13'}), get({'KeyEvent', 'VK_F14'}), get({'KeyEvent', 'VK_F15'}), get({'KeyEvent', 'VK_F16'}), get({'KeyEvent', 'VK_F17'}), get({'KeyEvent', 'VK_F18'}), get({'KeyEvent', 'VK_F19'}), get({'KeyEvent', 'VK_F20'}), get({'KeyEvent', 'VK_F21'}), get({'KeyEvent', 'VK_F22'}), get({'KeyEvent', 'VK_F23'}), get({'KeyEvent', 'VK_F24'}), get({'KeyEvent', 'VK_ACCEPT'}), get({'KeyEvent', 'VK_ADD'}), get({'KeyEvent', 'VK_AGAIN'}), get({'KeyEvent', 'VK_ALL_CANDIDATES'}), get({'KeyEvent', 'VK_ALPHANUMERIC'}), get({'KeyEvent', 'VK_ALT'}), get({'KeyEvent', 'VK_ALT_GRAPH'}), get({'KeyEvent', 'VK_AMPERSAND'}), get({'KeyEvent', 'VK_ASTERISK'}), get({'KeyEvent', 'VK_AT'}), get({'KeyEvent', 'VK_BACK_QUOTE'}), get({'KeyEvent', 'VK_BACK_SLASH'}), get({'KeyEvent', 'VK_BACK_SPACE'}), get({'KeyEvent', 'VK_BEGIN'}), get({'KeyEvent', 'VK_BRACELEFT'}), get({'KeyEvent', 'VK_BRACERIGHT'}), get({'KeyEvent', 'VK_CANCEL'}), get({'KeyEvent', 'VK_CAPS_LOCK'}), get({'KeyEvent', 'VK_CIRCUMFLEX'}), get({'KeyEvent', 'VK_CLEAR'}), get({'KeyEvent', 'VK_CLOSE_BRACKET'}), get({'KeyEvent', 'VK_CODE_INPUT'}), get({'KeyEvent', 'VK_COLON'}), get({'KeyEvent', 'VK_COMMA'}), get({'KeyEvent', 'VK_COMPOSE'}), get({'KeyEvent', 'VK_CONTEXT_MENU'}), get({'KeyEvent', 'VK_CONTROL'}), get({'KeyEvent', 'VK_CONVERT'}), get({'KeyEvent', 'VK_COPY'}), get({'KeyEvent', 'VK_CUT'}), get({'KeyEvent', 'VK_DEAD_ABOVEDOT'}), get({'KeyEvent', 'VK_DEAD_ABOVERING'}), get({'KeyEvent', 'VK_DEAD_ACUTE'}), get({'KeyEvent', 'VK_DEAD_BREVE'}), get({'KeyEvent', 'VK_DEAD_CARON'}), get({'KeyEvent', 'VK_DEAD_CEDILLA'}), get({'KeyEvent', 'VK_DEAD_CIRCUMFLEX'}), get({'KeyEvent', 'VK_DEAD_DIAERESIS'}), get({'KeyEvent', 'VK_DEAD_DOUBLEACUTE'}), get({'KeyEvent', 'VK_DEAD_GRAVE'}), get({'KeyEvent', 'VK_DEAD_IOTA'}), get({'KeyEvent', 'VK_DEAD_MACRON'}), get({'KeyEvent', 'VK_DEAD_OGONEK'}), get({'KeyEvent', 'VK_DEAD_SEMIVOICED_SOUND'}), get({'KeyEvent', 'VK_DEAD_TILDE'}), get({'KeyEvent', 'VK_DEAD_VOICED_SOUND'}), get({'KeyEvent', 'VK_DECIMAL'}), get({'KeyEvent', 'VK_DELETE'}), get({'KeyEvent', 'VK_DIVIDE'}), get({'KeyEvent', 'VK_DOLLAR'}), get({'KeyEvent', 'VK_DOWN'}), get({'KeyEvent', 'VK_END'}), get({'KeyEvent', 'VK_ENTER'}), get({'KeyEvent', 'VK_EQUALS'}), get({'KeyEvent', 'VK_ESCAPE'}), get({'KeyEvent', 'VK_EURO_SIGN'}), get({'KeyEvent', 'VK_EXCLAMATION_MARK'}), get({'KeyEvent', 'VK_FINAL'}), get({'KeyEvent', 'VK_FIND'}), get({'KeyEvent', 'VK_FULL_WIDTH'}), get({'KeyEvent', 'VK_GREATER'}), get({'KeyEvent', 'VK_HALF_WIDTH'}), get({'KeyEvent', 'VK_HELP'}), get({'KeyEvent', 'VK_HIRAGANA'}), get({'KeyEvent', 'VK_HOME'}), get({'KeyEvent', 'VK_INPUT_METHOD_ON_OFF'}), get({'KeyEvent', 'VK_INSERT'}), get({'KeyEvent', 'VK_INVERTED_EXCLAMATION_MARK'}), get({'KeyEvent', 'VK_JAPANESE_HIRAGANA'}), get({'KeyEvent', 'VK_JAPANESE_KATAKANA'}), get({'KeyEvent', 'VK_JAPANESE_ROMAN'}), get({'KeyEvent', 'VK_KANA'}), get({'KeyEvent', 'VK_KANA_LOCK'}), get({'KeyEvent', 'VK_KANJI'}), get({'KeyEvent', 'VK_KATAKANA'}), get({'KeyEvent', 'VK_KP_DOWN'}), get({'KeyEvent', 'VK_KP_LEFT'}), get({'KeyEvent', 'VK_KP_RIGHT'}), get({'KeyEvent', 'VK_KP_UP'}), get({'KeyEvent', 'VK_LEFT'}), get({'KeyEvent', 'VK_LEFT_PARENTHESIS'}), get({'KeyEvent', 'VK_LESS'}), get({'KeyEvent', 'VK_META'}), get({'KeyEvent', 'VK_MINUS'}), get({'KeyEvent', 'VK_MODECHANGE'}), get({'KeyEvent', 'VK_MULTIPLY'}), get({'KeyEvent', 'VK_NONCONVERT'}), get({'KeyEvent', 'VK_NUMBER_SIGN'}), get({'KeyEvent', 'VK_OPEN_BRACKET'}), get({'KeyEvent', 'VK_PAGE_DOWN'}), get({'KeyEvent', 'VK_PAGE_UP'}), get({'KeyEvent', 'VK_PASTE'}), get({'KeyEvent', 'VK_PAUSE'}), get({'KeyEvent', 'VK_PERIOD'}), get({'KeyEvent', 'VK_PLUS'}), get({'KeyEvent', 'VK_PREVIOUS_CANDIDATE'}), get({'KeyEvent', 'VK_PRINTSCREEN'}), get({'KeyEvent', 'VK_PROPS'}), get({'KeyEvent', 'VK_QUOTE'}), get({'KeyEvent', 'VK_QUOTEDBL'}), get({'KeyEvent', 'VK_RIGHT'}), get({'KeyEvent', 'VK_RIGHT_PARENTHESIS'}), get({'KeyEvent', 'VK_SCROLL_LOCK'}), get({'KeyEvent', 'VK_SEMICOLON'}), get({'KeyEvent', 'VK_SEPARATER'}), get({'KeyEvent', 'VK_SEPARATOR'}), get({'KeyEvent', 'VK_SHIFT'}), get({'KeyEvent', 'VK_SLASH'}), get({'KeyEvent', 'VK_SPACE'}), get({'KeyEvent', 'VK_STOP'}), get({'KeyEvent', 'VK_SUBTRACT'}), get({'KeyEvent', 'VK_TAB'}), get({'KeyEvent', 'VK_UNDEFINED'}), get({'KeyEvent', 'VK_UNDERSCORE'}), get({'KeyEvent', 'VK_UNDO'}), get({'KeyEvent', 'VK_UP'}), get({'KeyEvent', 'VK_WINDOWS'})])),
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        STATIC_BLOCK = "Static Block",
        try
            lists:foreach(fun(Index) ->
                KeyAsString = 'KeyEvent':getKeyText(array:get(Index, get({'KeySingletonFactory', keyArray}))),
                (get({get({'KeySingletonFactory', keyStringHashtable}), '$class'})):put(get({'KeySingletonFactory', keyStringHashtable}), KeyAsString, array:get(Index, get({'KeySingletonFactory', keyArray})))
            end, lists:seq(0, array:size(get({'KeySingletonFactory', keyArray})) - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), "KeySingleFactory", STATIC_BLOCK, E)
        end,
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.



new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getHashtable() ->
        get({'KeySingletonFactory', keyStringHashtable}).

getInstance(Index) when is_integer(Index) ->
        allbinary_java:to_string(Index).

getArray() ->
        get({'KeySingletonFactory', keyArray}).

