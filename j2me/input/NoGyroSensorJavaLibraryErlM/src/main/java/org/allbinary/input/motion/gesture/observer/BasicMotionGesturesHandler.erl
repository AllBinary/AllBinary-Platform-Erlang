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
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.handler.BasicEventHandler

-module('BasicMotionGesturesHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'BasicMotionGesturesHandler':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'BasicMotionGesturesHandler', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicEventHandler':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
process(This, EventObject, EventListenerInterface) ->
        BaseMotionGestureEventListener = EventListenerInterface,
        (get({BaseMotionGestureEventListener, '$class'})):onMotionGestureEvent(BaseMotionGestureEventListener, EventObject).

