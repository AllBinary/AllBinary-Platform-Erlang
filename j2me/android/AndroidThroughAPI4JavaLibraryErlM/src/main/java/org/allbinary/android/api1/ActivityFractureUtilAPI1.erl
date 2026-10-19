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
% package org.allbinary.android.api1
% import org.allbinary.android.ActivityFractureUtil
% import android.app.Activity
% import android.view.WindowManager

-module('ActivityFractureUtilAPI1').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ActivityFractureUtil', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'ActivityFractureUtilAPI1':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'ActivityFractureUtil':init(This),
    init_fields(This).


getInstance() ->
        get({'ActivityFractureUtilAPI1', instance}).

% throws Exception
process(This, Activity) ->
        ok.

setFullScreen(This, Activity) ->
        (fun(Target_N65848) -> (get({Target_N65848, '$class'})):setFlags(Target_N65848, get({get({'WindowManager', 'LayoutParams'}), 'FLAG_FULLSCREEN'}), get({get({'WindowManager', 'LayoutParams'}), 'FLAG_FULLSCREEN'})) end)((get({Activity, '$class'})):getWindow(Activity)).

