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

-module('KeyUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isNormallyDisplayed(KeyCode) when is_integer(KeyCode) ->
        try
        begin
            Switch_N65637 = KeyCode,
            case lists:member(Switch_N65637, [get({'KeyEvent', 'VK_SPACE'}), get({'KeyEvent', 'VK_COMMA'}), get({'KeyEvent', 'VK_MINUS'}), get({'KeyEvent', 'VK_PERIOD'}), get({'KeyEvent', 'VK_SLASH'}), get({'KeyEvent', 'VK_0'}), get({'KeyEvent', 'VK_1'}), get({'KeyEvent', 'VK_2'}), get({'KeyEvent', 'VK_3'}), get({'KeyEvent', 'VK_4'}), get({'KeyEvent', 'VK_5'}), get({'KeyEvent', 'VK_6'}), get({'KeyEvent', 'VK_7'}), get({'KeyEvent', 'VK_8'}), get({'KeyEvent', 'VK_9'}), get({'KeyEvent', 'VK_SEMICOLON'}), get({'KeyEvent', 'VK_EQUALS'}), get({'KeyEvent', 'VK_A'}), get({'KeyEvent', 'VK_B'}), get({'KeyEvent', 'VK_C'}), get({'KeyEvent', 'VK_D'}), get({'KeyEvent', 'VK_E'}), get({'KeyEvent', 'VK_F'}), get({'KeyEvent', 'VK_G'}), get({'KeyEvent', 'VK_H'}), get({'KeyEvent', 'VK_I'}), get({'KeyEvent', 'VK_J'}), get({'KeyEvent', 'VK_K'}), get({'KeyEvent', 'VK_L'}), get({'KeyEvent', 'VK_M'}), get({'KeyEvent', 'VK_N'}), get({'KeyEvent', 'VK_O'}), get({'KeyEvent', 'VK_P'}), get({'KeyEvent', 'VK_Q'}), get({'KeyEvent', 'VK_R'}), get({'KeyEvent', 'VK_S'}), get({'KeyEvent', 'VK_T'}), get({'KeyEvent', 'VK_U'}), get({'KeyEvent', 'VK_V'}), get({'KeyEvent', 'VK_W'}), get({'KeyEvent', 'VK_X'}), get({'KeyEvent', 'VK_Y'}), get({'KeyEvent', 'VK_Z'}), get({'KeyEvent', 'VK_OPEN_BRACKET'}), get({'KeyEvent', 'VK_BACK_SLASH'}), get({'KeyEvent', 'VK_CLOSE_BRACKET'}), get({'KeyEvent', 'VK_NUMPAD0'}), get({'KeyEvent', 'VK_NUMPAD1'}), get({'KeyEvent', 'VK_NUMPAD2'}), get({'KeyEvent', 'VK_NUMPAD3'}), get({'KeyEvent', 'VK_NUMPAD4'}), get({'KeyEvent', 'VK_NUMPAD5'}), get({'KeyEvent', 'VK_NUMPAD6'}), get({'KeyEvent', 'VK_NUMPAD7'}), get({'KeyEvent', 'VK_NUMPAD8'}), get({'KeyEvent', 'VK_NUMPAD9'}), get({'KeyEvent', 'VK_MULTIPLY'}), get({'KeyEvent', 'VK_ADD'}), get({'KeyEvent', 'VK_SEPARATER'}), get({'KeyEvent', 'VK_SUBTRACT'}), get({'KeyEvent', 'VK_DECIMAL'}), get({'KeyEvent', 'VK_DIVIDE'})]) of true ->
                throw({'$return', true}); false ->
            begin
                throw({'$return', false}) end end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

