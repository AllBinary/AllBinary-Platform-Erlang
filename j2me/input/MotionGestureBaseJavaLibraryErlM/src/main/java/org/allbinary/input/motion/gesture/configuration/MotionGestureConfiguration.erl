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
% package org.allbinary.input.motion.gesture.configuration
% import org.allbinary.game.input.CompleteMotionGestureInputEvent
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('MotionGestureConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, diagonalMotionGestureAllowed}, true),
    put({This, diagonalTolerance}, 7),
    put({This, minimumMotionGesture}, 9),
    put({This, button}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, color}, get({'BasicColorFactory':getInstance(), 'BLUE'})),
    put({This, executingActions}, true),
    put({This, mouseButtonMask}, 0),
    put({This, activeCommands}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

addMotionGestureAction(This, List, CommandAction) ->
        (get({get({This, activeCommands}), '$class'})):add(get({This, activeCommands}), 'MotionGestureToMotionGestureActionAssociation':new(List, CommandAction)).

clearMotionGestureAction(This) ->
        (get({get({This, activeCommands}), '$class'})):clear(get({This, activeCommands})).

getAssociateCommandActionsList(This) ->
        get({This, activeCommands}).

isDiagonalMotionGestureAllowed(This) ->
        get({This, diagonalMotionGestureAllowed}).

isExecutingActionsAllowed(This) ->
        get({This, executingActions}).

setExecutingActionsAllowed(This, ExecutingActionAllowed) when is_boolean(ExecutingActionAllowed) ->
        put({This, executingActions}, ExecutingActionAllowed).

setDiagonalMotionGestureAllowed(This, DiagonalMotionGestureAllowed) when is_boolean(DiagonalMotionGestureAllowed) ->
        put({This, diagonalMotionGestureAllowed}, DiagonalMotionGestureAllowed).

getDiagonalTolerance(This) ->
        get({This, diagonalTolerance}).

setDiagonalTolerance(This, DiagonalTolerance) when is_integer(DiagonalTolerance) ->
        put({This, diagonalTolerance}, DiagonalTolerance).

getMinimumMotionGesture(This) ->
        get({This, minimumMotionGesture}).

setMinimumMotionGesture(This, MinimumMotionGesture) when is_integer(MinimumMotionGesture) ->
        put({This, minimumMotionGesture}, MinimumMotionGesture).

getButton(This) ->
        get({This, button}).

setButton(This, Button) when (is_list(Button) orelse Button =:= undefined) ->
        put({This, button}, Button).

getColor(This) ->
        get({This, color}).

setColor(This, Color) ->
        put({This, color}, Color).

getMouseButtonMask(This) ->
        get({This, mouseButtonMask}).

setMouseButtonMask(This, MouseButtonMask) when is_integer(MouseButtonMask) ->
        put({This, mouseButtonMask}, MouseButtonMask).

