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
% package org.allbinary.input.motion

-module('MotionRecognizer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
processStartMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        ok.

% throws Exception
processEndMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        ok.

% throws Exception
processDraggedMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        ok.

