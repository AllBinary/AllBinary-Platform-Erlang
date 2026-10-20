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
% package org.allbinary.input.motion.button
% import android.app.Activity
% import android.content.res.Configuration
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.PreLogUtil

-module('TouchScreenTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TouchScreenTypeFactory':new()),
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


getInstance() ->
        get({'TouchScreenTypeFactory', instance}).

update(This, Activity) ->
        CommonStrings = 'CommonStrings':getInstance(),
        TouchScreenFactory = 'TouchScreenFactory':getInstance(),
        TouchScreenTypesFactory = 'TouchScreenTypesFactory':getInstance(),
        Configuration = (fun(Target_N65970) -> (get({Target_N65970, '$class'})):getConfiguration(Target_N65970) end)((get({Activity, '$class'})):getResources(Activity)),
        TouchScreen = get({Configuration, touchscreen}),
        case (TouchScreen =:= get({'Configuration', 'TOUCHSCREEN_FINGER'})) of
            true ->
            (get({TouchScreenFactory, '$class'})):setTouchScreenType(TouchScreenFactory, get({TouchScreenTypesFactory, 'FINGER'})),
            case (not (get({TouchScreenFactory, '$class'})):isTouch(TouchScreenFactory)) of
                true ->
                'PreLogUtil':put("Not Really Exception: This indicates that a touch screen does exist but is not API8 so we will try it", This, get({CommonStrings, 'PROCESS'})),
                (get({TouchScreenFactory, '$class'})):setTouch(TouchScreenFactory, true);
                false -> ok
            end;
            false ->
            case (TouchScreen =:= get({'Configuration', 'TOUCHSCREEN_STYLUS'})) of
            true ->
            (get({TouchScreenFactory, '$class'})):setTouchScreenType(TouchScreenFactory, get({TouchScreenTypesFactory, 'STYLUS'})),
            case (not (get({TouchScreenFactory, '$class'})):isTouch(TouchScreenFactory)) of
                true ->
                'PreLogUtil':put("Not Really Exception: This indicates that a touch screen does exist but is not API8 so we will try it", This, get({CommonStrings, 'PROCESS'})),
                (get({TouchScreenFactory, '$class'})):setTouch(TouchScreenFactory, true);
                false -> ok
            end;
            false ->
            case (TouchScreen =:= get({'Configuration', 'TOUCHSCREEN_NOTOUCH'})) of
            true ->
            (get({TouchScreenFactory, '$class'})):setTouchScreenType(TouchScreenFactory, get({TouchScreenTypesFactory, 'NOTOUCH'}));
            false ->
            case (TouchScreen =:= get({'Configuration', 'TOUCHSCREEN_UNDEFINED'})) of
            true ->
            (get({TouchScreenFactory, '$class'})):setTouchScreenType(TouchScreenFactory, get({TouchScreenTypesFactory, 'UNDEFINED'}));
            false -> ok
        end
        end
        end
        end.

