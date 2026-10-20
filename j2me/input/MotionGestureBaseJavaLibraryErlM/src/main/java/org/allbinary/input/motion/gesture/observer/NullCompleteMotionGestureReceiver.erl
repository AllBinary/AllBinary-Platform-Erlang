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
% package org.allbinary.input.motion.gesture.observer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('NullCompleteMotionGestureReceiver').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CompleteMotionGestureListenerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Null Gesture Reciever", This, get({CommonStrings, 'CONSTRUCTOR'})).

% throws Exception
onMotionGestureCompleted(This, List) ->
        ok.

