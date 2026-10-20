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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.NullCanvas
% import org.allbinary.game.input.PlayerGameInput
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicMenuInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BaseMotionGestureEventListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

init_fields(This) ->
    put({This, motionGestureEventList}, 'BasicArrayListD':new()),
    put({This, canvas}, get({'NullCanvas', 'NULL_CANVAS'})),
    ok.


new(GameKeyEventList, PlayerInputId, GameCanvas) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameKeyEventList, PlayerInputId, GameCanvas),
    This.

'$init'(This, GameKeyEventList, PlayerInputId, GameCanvas) when is_integer(PlayerInputId) ->
        'PlayerGameInput':'$init'(This, GameKeyEventList, 'BasicArrayListD':new(), PlayerInputId),
        init_fields(This),
        put({This, canvas}, GameCanvas).

onMotionGestureEvent(This, MotionGestureEvent) ->
        (get({get({This, motionGestureEventList}), '$class'})):add(get({This, motionGestureEventList}), MotionGestureEvent).

onScrolledMotionGestureEvent(This, MotionGestureEvent) ->
        ok.

setCanvas(This, Canvas) ->
        put({This, canvas}, Canvas).

getCanvas(This) ->
        get({This, canvas}).

% throws Exception
processInputList(This) ->
        (-1).

