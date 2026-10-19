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
% import org.allbinary.canvas.RunnableCanvas
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('RunnableCanvasSingleThreadStartRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameRunnable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, runnableCanvas}, undefined),
    ok.


new(DemoCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, DemoCanvas),
    This.

init(This, DemoCanvas) ->
    'GameRunnable':init(This),
    init_fields(This),
        put({This, runnableCanvas}, DemoCanvas).

run(This) ->
        try
            (get({get({This, runnableCanvas}), '$class'})):run(get({This, runnableCanvas}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E)
        end.

% throws Exception
processLoopSleep(This) ->
        (get({get({This, runnableCanvas}), '$class'})):processLoopSleep(get({This, runnableCanvas})).

