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
% package org.allbinary.android.api30
% import android.app.Activity
% import android.view.Window
% import androidx.core.view.WindowCompat
% import androidx.core.view.WindowInsetsCompat
% import androidx.core.view.WindowInsetsControllerCompat
% import org.allbinary.android.api5.ActivityFractureUtilAPI5

-module('ActivityFractureUtilAPI30').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ActivityFractureUtilAPI5', Function, Arguments).

static_init() ->
    put({?MODULE, instance30}, 'ActivityFractureUtilAPI30':new()),
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
        get({'ActivityFractureUtilAPI30', instance30}).

setFullScreen(This, Activity) ->
        Window = (get({Activity, '$class'})):getWindow(Activity),
        WindowInsetsController = 'WindowCompat':getInsetsController(Window, (get({Window, '$class'})):getDecorView(Window)),
        (get({WindowInsetsController, '$class'})):hide(WindowInsetsController, (get({get({'WindowInsetsCompat', 'Type'}), '$class'})):systemBars(get({'WindowInsetsCompat', 'Type'}))),
        (get({WindowInsetsController, '$class'})):setSystemBarsBehavior(WindowInsetsController, get({'WindowInsetsControllerCompat', 'BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE'})).

