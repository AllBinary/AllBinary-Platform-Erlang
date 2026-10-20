% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.android.activity
% import android.view.View

-module('NullKeyInputViewComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements KeyInputViewCompositeInterface

static_init() ->
    put({?MODULE, 'NULL_KEY_INPUT_VIEW_COMPOSITE'}, 'NullKeyInputViewComposite':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


setKeyInputView(This, KeyInputView) ->
        ok.

getRootView(This) ->
        erlang:error({'RuntimeException'}).

getView(This) ->
        erlang:error({'RuntimeException'}).

runOnUiThread(This, Action) ->
        ok.

