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
% import org.allbinary.logic.math.PrimitiveFloatUtil

-module('AllBinaryOrientationSensor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinarySensor', Function, Arguments).

init_fields(This) ->
    put({This, sensorDataFloatArray}, 'PrimitiveFloatUtil':getArrayInstance()),
    put({This, listener}, 'NoCompleteMotionGestureInputEventListener':getInstance()),
    ok.


setCompleteMotionGestureInputEventListener(This, CompleteMotionGestureInputEventListenerInterface) ->
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

