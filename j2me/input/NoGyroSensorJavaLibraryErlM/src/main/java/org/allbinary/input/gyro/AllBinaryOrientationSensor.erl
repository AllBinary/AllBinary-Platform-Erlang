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
% package org.allbinary.input.gyro
% import org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface
% import org.allbinary.game.input.motion.action.NoCompleteMotionGestureInputEventListener
% import org.allbinary.input.AllBinarySensor
% import org.allbinary.logic.math.Orientation

-module('AllBinaryOrientationSensor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinarySensor', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_ALLBINARY_ORIENTATION_SENSOR'}, 'AllBinaryOrientationSensor':new()),
    ok.

init_fields(This) ->
    put({This, listener}, 'NoCompleteMotionGestureInputEventListener':getInstance()),
    ok.


setListener(This, CompleteMotionGestureInputEventListenerInterface) ->
        put({This, listener}, CompleteMotionGestureInputEventListenerInterface).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'AllBinarySensor':init(This),
    init_fields(This),
        ok.

% throws Exception
getOrientation(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

