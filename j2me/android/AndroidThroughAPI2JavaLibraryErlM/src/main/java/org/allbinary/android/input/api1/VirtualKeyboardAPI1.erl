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
% package org.allbinary.android.input.api1
% import org.allbinary.android.input.VirtualKeyboard
% import org.allbinary.input.event.VirtualKeyboardEventListenerInterface
% import android.app.Activity

-module('VirtualKeyboardAPI1').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements VirtualKeyboardEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('VirtualKeyboard', Function, Arguments).

static_init() ->
    put({?MODULE, 'MIN_API'}, 1),
    put({?MODULE, 'MAX_API'}, 2),
    ok.

init_fields(This) ->
    ok.


new(Activity) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Activity),
    This.

'$init'(This, Activity) ->
    'VirtualKeyboard':'$init'(This),
    init_fields(This),
        ok.

