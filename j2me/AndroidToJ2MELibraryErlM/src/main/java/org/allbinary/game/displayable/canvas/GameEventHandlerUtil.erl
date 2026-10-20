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
% import org.allbinary.android.input.motion.GameInputMotionEventProcessorFactory
% import org.allbinary.game.input.event.GameKeyEventHandler
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler

-module('GameEventHandlerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


removeAllListeners() ->
        (fun(Target_N65709) -> (get({Target_N65709, '$class'})):removeAllListeners(Target_N65709) end)('BasicMotionGesturesHandler':getInstance()),
        (fun(Target_N65737) -> (get({Target_N65737, '$class'})):removeAllListeners(Target_N65737) end)('GameKeyEventHandler':getInstance()),
        (fun(Target_N65769) -> (get({Target_N65769, '$class'})):addListener(Target_N65769) end)('GameInputMotionEventProcessorFactory':getInstance()).

