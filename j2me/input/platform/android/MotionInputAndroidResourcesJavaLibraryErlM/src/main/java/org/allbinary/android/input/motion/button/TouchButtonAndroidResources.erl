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
% package org.allbinary.android.input.motion.button
% import org.allbinary.AndroidResources
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.init.Init
% import org.allbinary.input.motion.button.CommonButtons
% import org.allbinary.input.motion.button.TouchButtonBlankResource
% import org.allbinary.input.motion.button.TouchButtonDownResource
% import org.allbinary.input.motion.button.TouchButtonGenericActionResource
% import org.allbinary.input.motion.button.TouchButtonResource
% import org.allbinary.input.motion.button.TouchButtonStartResource
% import org.allbinary.input.motion.button.TouchButtonStrafeLeftResource
% import org.allbinary.input.motion.button.TouchButtonStrafeRightResource
% import org.allbinary.input.motion.button.TouchButtonTurnLeftResource
% import org.allbinary.input.motion.button.TouchButtonTurnRightResource
% import org.allbinary.input.motion.button.TouchButtonUpResource
% import org.allbinary.logic.system.os.OperatingSystemFactory

-module('TouchButtonAndroidResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Init', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Init':init(This),
    init_fields(This).


init(This) ->
        ResourceUtil = 'ResourceUtil':getInstance(),
        AndroidResources = 'AndroidResources':getInstance(),
        RESOURCE_STRING_ARRAY = array:from_list(['TouchButtonBlankResource':getInstance(), 'TouchButtonGenericActionResource':getInstance(), 'TouchButtonStartResource':getInstance(), 'TouchButtonUpResource':getInstance(), 'TouchButtonDownResource':getInstance(), 'TouchButtonTurnLeftResource':getInstance(), 'TouchButtonTurnRightResource':getInstance(), 'TouchButtonStrafeLeftResource':getInstance(), 'TouchButtonStrafeRightResource':getInstance()]),
        RESOURCE_ARRAY = array:new(array:size(RESOURCE_STRING_ARRAY), {default, 0}),
        case (get({'CommonButtons':getInstance(), 'STANDARD_BUTTON_SIZE'}) =:= 128) of
            true ->
            array:set(0, get({get({AndroidResources, raw}), touch_button_128_by_128}), RESOURCE_ARRAY),
            array:set(1, get({get({AndroidResources, raw}), touch_button_generic_action_128_by_128}), RESOURCE_ARRAY),
            array:set(2, get({get({AndroidResources, raw}), touch_button_start_128_by_128}), RESOURCE_ARRAY),
            array:set(3, get({get({AndroidResources, raw}), touch_button_up_arrow_128_by_128}), RESOURCE_ARRAY),
            array:set(4, get({get({AndroidResources, raw}), touch_button_down_arrow_128_by_128}), RESOURCE_ARRAY),
            array:set(5, get({get({AndroidResources, raw}), touch_button_turn_left_arrow_128_by_128}), RESOURCE_ARRAY),
            array:set(6, get({get({AndroidResources, raw}), touch_button_turn_right_arrow_128_by_128}), RESOURCE_ARRAY),
            array:set(7, get({get({AndroidResources, raw}), touch_button_strafe_left_arrow_128_by_128}), RESOURCE_ARRAY),
            array:set(8, get({get({AndroidResources, raw}), touch_button_strafe_right_arrow_128_by_128}), RESOURCE_ARRAY),
            case (fun(Target_N67400) -> (get({Target_N67400, '$class'})):isOverScan(Target_N67400) end)((fun(Target_N67407) -> (get({Target_N67407, '$class'})):getOperatingSystemInstance(Target_N67407) end)('OperatingSystemFactory':getInstance())) of
                true ->
                (get({ResourceUtil, '$class'})):addResource(ResourceUtil, get({array:get(2, RESOURCE_STRING_ARRAY), 'HINT'}), allbinary_java:to_string(get({get({AndroidResources, raw}), ouya_o})));
                false -> ok
            end;
            false ->
            array:set(0, get({get({AndroidResources, raw}), touch_button_64_by_64}), RESOURCE_ARRAY),
            array:set(1, get({get({AndroidResources, raw}), touch_button_generic_action_64_by_64}), RESOURCE_ARRAY),
            array:set(2, get({get({AndroidResources, raw}), touch_button_start_64_by_64}), RESOURCE_ARRAY),
            array:set(3, get({get({AndroidResources, raw}), touch_button_up_arrow_64_by_64}), RESOURCE_ARRAY),
            array:set(4, get({get({AndroidResources, raw}), touch_button_down_arrow_64_by_64}), RESOURCE_ARRAY),
            array:set(5, get({get({AndroidResources, raw}), touch_button_turn_left_arrow_64_by_64}), RESOURCE_ARRAY),
            array:set(6, get({get({AndroidResources, raw}), touch_button_turn_right_arrow_64_by_64}), RESOURCE_ARRAY),
            array:set(7, get({get({AndroidResources, raw}), touch_button_strafe_left_arrow_64_by_64}), RESOURCE_ARRAY),
            array:set(8, get({get({AndroidResources, raw}), touch_button_strafe_right_arrow_64_by_64}), RESOURCE_ARRAY)
        end,
        lists:foreach(fun(Index) ->
            (get({ResourceUtil, '$class'})):addResource(ResourceUtil, get({array:get(Index, RESOURCE_STRING_ARRAY), 'RESOURCE'}), allbinary_java:to_string(array:get(Index, RESOURCE_ARRAY)))
        end, lists:seq(0, array:size(RESOURCE_ARRAY) - 1)).

