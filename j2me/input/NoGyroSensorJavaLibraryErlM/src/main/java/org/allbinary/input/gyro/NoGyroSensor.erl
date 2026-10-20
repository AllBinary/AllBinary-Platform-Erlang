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
% import org.allbinary.input.AllBinarySensorListener
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.Orientation

-module('NoGyroSensor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AllBinarySensorListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryOrientationSensor', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'AllBinaryOrientationSensor':'$init'(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

% throws Exception
getOrientation(This) ->
        get({'Orientation', 'NONE'}).

onSensorChange(This) ->
        ok.

