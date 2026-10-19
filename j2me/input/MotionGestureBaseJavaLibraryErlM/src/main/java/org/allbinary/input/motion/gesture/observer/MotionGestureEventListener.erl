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

-module('MotionGestureEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseMotionGestureEventListener', Function, Arguments).


onPressedMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onPressedMotionGestureEvent}).

onUpMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onUpMotionGestureEvent}).

onDownMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onDownMotionGestureEvent}).

onLeftMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onLeftMotionGestureEvent}).

onRightMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onRightMotionGestureEvent}).

onDiagonalDownRightMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onDiagonalDownRightMotionGestureEvent}).

onDiagonalDownLeftMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onDiagonalDownLeftMotionGestureEvent}).

onDiagonalUpRightMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onDiagonalUpRightMotionGestureEvent}).

onDiagonalUpLeftMotionGestureEvent(This, Ev) ->
    erlang:error({abstract_method, onDiagonalUpLeftMotionGestureEvent}).

% throws Exception
released(This, Ev) ->
    erlang:error({abstract_method, released}).

