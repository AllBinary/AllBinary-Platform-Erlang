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
% import org.allbinary.input.motion.button.TouchButtonRecognizer

-module('OnlyTouchButtonRecognizer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionRecognizer', Function, Arguments).

init_fields(This) ->
    put({This, touchButtonRecognizer}, undefined),
    put({This, touchButtonProcessing}, false),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'MotionRecognizer':'$init'(This),
    init_fields(This),
        put({This, touchButtonRecognizer}, 'TouchButtonRecognizer':new()).

% throws Exception
processStartMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        case (get({get({This, touchButtonRecognizer}), '$class'})):pressTouchButtonInput(get({This, touchButtonRecognizer}), X, Y, DeviceId) of
            true ->
            put({This, touchButtonProcessing}, true);
            false -> ok
        end.

% throws Exception
processEndMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        try
        case get({This, touchButtonProcessing}) of
            true ->
            put({This, touchButtonProcessing}, false);
            false -> ok
        end,
        case (get({get({This, touchButtonRecognizer}), '$class'})):releaseTouchButtonInput(get({This, touchButtonRecognizer}), X, Y, DeviceId) of
            true ->
            throw({'$return', ok});
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processDraggedMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        case get({This, touchButtonProcessing}) of
            true ->
            (get({get({This, touchButtonRecognizer}), '$class'})):pressTouchButtonInput(get({This, touchButtonRecognizer}), X, Y, DeviceId);
            false -> ok
        end.

