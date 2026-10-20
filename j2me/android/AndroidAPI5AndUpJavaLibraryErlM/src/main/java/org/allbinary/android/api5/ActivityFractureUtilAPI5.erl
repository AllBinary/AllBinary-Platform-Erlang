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
% package org.allbinary.android.api5
% import android.app.Activity
% import org.allbinary.input.motion.button.TouchScreenTypeFactory
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.android.api1.ActivityFractureUtilAPI1
% import org.allbinary.input.motion.button.TouchScreenFactory

-module('ActivityFractureUtilAPI5').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ActivityFractureUtilAPI1', Function, Arguments).

static_init() ->
    put({?MODULE, instance5}, 'ActivityFractureUtilAPI5':new()),
    ok.

init_fields(This) ->
    put({This, 'FEATURE_TOUCHSCREEN_MULTITOUCH'}, "android.hardware.touchscreen.multitouch"),
    put({This, 'FEATURE_TOUCHSCREEN'}, "android.hardware.touchscreen"),
    put({This, 'FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT'}, "android.hardware.touchscreen.multitouch.distinct"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ActivityFractureUtilAPI1':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'ActivityFractureUtilAPI5', instance5}).

process(This, Activity) ->
        TouchScreenFactory = 'TouchScreenFactory':getInstance(),
        TouchScreenTypeFactory = 'TouchScreenTypeFactory':getInstance(),
        (get({TouchScreenFactory, '$class'})):setTouch(TouchScreenFactory, (get({This, '$class'})):isTouch(This, Activity)),
        (get({TouchScreenFactory, '$class'})):setMultiTouch(TouchScreenFactory, (get({This, '$class'})):isMultiTouch(This, Activity)),
        (get({TouchScreenFactory, '$class'})):setMultiTouchDistinct(TouchScreenFactory, (get({This, '$class'})):isMultiTouchDistinct(This, Activity)),
        (get({TouchScreenTypeFactory, '$class'})):update(TouchScreenTypeFactory, Activity),
        CommonStrings = 'CommonStrings':getInstance(),
        'PreLogUtil':put((get({TouchScreenFactory, '$class'})):toString(TouchScreenFactory), This, get({CommonStrings, 'PROCESS'})).

isTouch(This, Activity) ->
        (get({This, '$class'})):isFeature(This, Activity, get({This, 'FEATURE_TOUCHSCREEN'})).

isMultiTouch(This, Activity) ->
        (get({This, '$class'})):isFeature(This, Activity, get({This, 'FEATURE_TOUCHSCREEN_MULTITOUCH'})).

isMultiTouchDistinct(This, Activity) ->
        (get({This, '$class'})):isFeature(This, Activity, get({This, 'FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT'})).

isFeature(This, Activity, Property) when (is_list(Property) orelse Property =:= undefined) ->
        (fun(Target_N66730) -> (get({Target_N66730, '$class'})):hasSystemFeature(Target_N66730, Property) end)((get({Activity, '$class'})):getPackageManager(Activity)).

