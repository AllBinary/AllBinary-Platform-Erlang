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
% package org.allbinary.android.input
% import org.allbinary.android.AndroidInfoFactory
% import org.allbinary.android.input.api1.VirtualKeyboardAPI1
% import org.allbinary.android.input.api3.VirtualKeyboardAPI3
% import android.app.Activity

-module('VirtualKeyboardFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, virtualKeyboard}, get({'VirtualKeyboard', 'NULL_VIRTUAL_KEYBOARD'})),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


init(Activity) ->
        SDK_VERSION = (fun(Target_N65767) -> (get({Target_N65767, '$class'})):getVersion(Target_N65767) end)('AndroidInfoFactory':getInstance()),
        case (SDK_VERSION =< 2) of
            true ->
            put({'VirtualKeyboardFactory', virtualKeyboard}, 'VirtualKeyboardAPI1':new(Activity));
            false ->
            put({'VirtualKeyboardFactory', virtualKeyboard}, 'VirtualKeyboardAPI3':new(Activity))
        end.

getInstance() ->
        get({'VirtualKeyboardFactory', virtualKeyboard}).

