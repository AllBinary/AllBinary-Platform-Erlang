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
% import org.allbinary.game.input.InputFactory
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.logic.util.event.AllBinaryEventCircularPool

-module('MotionEventCircularPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'MIN'}, (fun(Target_N65824) -> (get({Target_N65824, '$class'})):getId(Target_N65824) end)(get({'TouchMotionGestureFactory':getInstance(), 'LAST_MOTION'}))),
    put({This, eventPool}, 'AllBinaryEventCircularPool':new((((get({'InputFactory':getInstance(), 'MAX'}) - 1)) - get({This, 'MIN'})))),
    ok.


createPool(Id) when is_integer(Id) ->
        'MotionEventCircularPool':new(Id).

new(Id) when is_integer(Id) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Id),
    This.

'$init'(This, Id) when is_integer(Id) ->
    init_fields(This),
        (get({get({This, eventPool}), '$class'})):initAllBinaryEventCircularPool(get({This, eventPool}), 'MotionEventFactory':new(get({This, eventPool}), Id)).

% throws Exception
getInstance(This, MotionGestureInput) ->
        (get({get({This, eventPool}), '$class'})):getInstance(get({This, eventPool}), ((get({MotionGestureInput, '$class'})):getId(MotionGestureInput) - get({This, 'MIN'}))).

