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

-module('NullProgressActivity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ProgressActivityInterface

static_init() ->
    put({?MODULE, 'NULL_PROGRESS_ACTIVITY'}, 'NullProgressActivity':new()),
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


runOnUiThread(This, Action) ->
        ok.

onDismissTitleProgressBar(This) ->
        ok.

onShowTitleProgressBar(This, Value, Indeterminate) when is_integer(Value), is_boolean(Indeterminate) ->
        ok.

onTitleProgressBarSetProgress(This, Value) when is_integer(Value) ->
        ok.

