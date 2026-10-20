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
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration
% import org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory
% import org.allbinary.input.motion.touch.action.DiagonalDownLeftTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.DiagonalDownRightTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.DiagonalUpLeftTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.DiagonalUpRightTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.DownTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.LeftTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.ReleaseTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.RightTouchInputToGameKeyEventAction
% import org.allbinary.input.motion.touch.action.UpTouchInputToGameKeyEventAction
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CompleteMotionGestureInputToGameMotionGestureInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CompleteMotionGestureInputToGameMotionGestureInput':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CompleteMotionGestureInputToGameMotionGestureInput', instance}).

init(This) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            'PreLogUtil':put("Compound Motion Gestures", This, get({CommonStrings, 'INIT'})),
            MotionGestureConfiguration = 'MotionGestureConfigurationFactory':getInstance(),
            TouchMotionGestureFactory = 'TouchMotionGestureFactory':getInstance(),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'DIAGONAL_DOWN_LEFT'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'DiagonalDownLeftTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'DIAGONAL_DOWN_RIGHT'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'DiagonalDownRightTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'DIAGONAL_UP_LEFT'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'DiagonalUpLeftTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'DIAGONAL_UP_RIGHT'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'DiagonalUpRightTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'LEFT'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'LeftTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'RIGHT'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'RightTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'DOWN'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'DownTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'UP'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'UpTouchInputToGameKeyEventAction':getInstance()),
            put({local, list}, 'BasicArrayListD':new()),
            (get({get({local, list}), '$class'})):add(get({local, list}), get({TouchMotionGestureFactory, 'RELEASED'})),
            (get({MotionGestureConfiguration, '$class'})):addMotionGestureAction(MotionGestureConfiguration, get({local, list}), 'ReleaseTouchInputToGameKeyEventAction':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'INIT'}), E)
        end.

