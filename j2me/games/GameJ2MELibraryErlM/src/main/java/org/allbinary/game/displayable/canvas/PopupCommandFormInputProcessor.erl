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
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.util.BasicArrayList

-module('PopupCommandFormInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CommandFormInputProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new(GameKeyEventList, PlayerInputId, GameCanvas, Form, PopupMenuInputProcessor) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameKeyEventList, PlayerInputId, GameCanvas, Form, PopupMenuInputProcessor),
    This.

'$init'(This, GameKeyEventList, PlayerInputId, GameCanvas, Form, PopupMenuInputProcessor) when is_integer(PlayerInputId) ->
        'CommandFormInputProcessor':'$init'(This, GameKeyEventList, PlayerInputId, GameCanvas, Form).

% throws Exception
processInput(This, Key) when is_integer(Key) ->
        'CommandFormInputProcessor':processInput(This, Key).

% throws Exception
processMotionInput(This, MotionGestureEvent) ->
        'CommandFormInputProcessor':processMotionInput(This, MotionGestureEvent).

