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
% package org.allbinary.android.api16
% import android.app.Activity
% import android.view.View
% import org.allbinary.android.api5.ActivityFractureUtilAPI5

-module('ActivityFractureUtilAPI16').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ActivityFractureUtilAPI5', Function, Arguments).

static_init() ->
    put({?MODULE, instance16}, 'ActivityFractureUtilAPI16':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ActivityFractureUtilAPI5':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'ActivityFractureUtilAPI16', instance16}).

setFullScreen(This, Activity) ->
        DecorView = (fun(Target_N65798) -> (get({Target_N65798, '$class'})):getDecorView(Target_N65798) end)((get({Activity, '$class'})):getWindow(Activity)),
        Visibility = (get({'View', 'SYSTEM_UI_FLAG_HIDE_NAVIGATION'}) bor get({'View', 'SYSTEM_UI_FLAG_FULLSCREEN'})),
        (get({DecorView, '$class'})):setSystemUiVisibility(DecorView, Visibility).

