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
% package org.allbinary.game.input.motion.action
% import org.allbinary.game.input.CompleteMotionGestureInputEvent
% import org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('NoCompleteMotionGestureInputEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CompleteMotionGestureInputEventListenerInterface

static_init() ->
    put({?MODULE, instance}, 'NoCompleteMotionGestureInputEventListener':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onCompleteMotionGestureInputEvent(This, CompleteMotionGestureInputEvent) ->
        ok.

getInstance() ->
        get({'NoCompleteMotionGestureInputEventListener', instance}).

