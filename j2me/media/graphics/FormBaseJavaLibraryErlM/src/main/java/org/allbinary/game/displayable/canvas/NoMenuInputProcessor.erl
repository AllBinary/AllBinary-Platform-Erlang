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
% import javax.microedition.lcdui.NullCanvas
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.util.BasicArrayListUtil

-module('NoMenuInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicMenuInputProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'NoMenuInputProcessor':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'NoMenuInputProcessor', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'BasicMenuInputProcessor':'$init'(This, (fun(Target_N65846) -> (get({Target_N65846, '$class'})):getImmutableInstance(Target_N65846) end)('BasicArrayListUtil':getInstance()), (-1), get({'NullCanvas', 'NULL_CANVAS'})).

onDownGameKeyEvent(This, GameKeyEvent) ->
        ok.

onUpGameKeyEvent(This, GameKeyEvent) ->
        ok.

onMotionGestureEvent(This, MotionGestureEvent) ->
        ok.

