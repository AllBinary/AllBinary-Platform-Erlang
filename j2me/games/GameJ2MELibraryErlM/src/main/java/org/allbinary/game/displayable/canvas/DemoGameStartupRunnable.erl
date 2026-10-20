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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.ABRunnable

-module('DemoGameStartupRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABRunnable', Function, Arguments).

static_init() ->
    put({?MODULE, 'TYPE'}, 4),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, demoCanvas}, undefined),
    ok.


new(DemoCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DemoCanvas),
    This.

'$init'(This, DemoCanvas) ->
    'ABRunnable':'$init'(This),
    init_fields(This),
        put({This, demoCanvas}, DemoCanvas).

run(This) ->
        try
            (get({This, '$class'})):setRunning(This, true),
            (get({get({This, demoCanvas}), '$class'})):stopGameDemo(get({This, demoCanvas})),
            (get({get({This, demoCanvas}), '$class'})):create(get({This, demoCanvas})),
            (get({get({This, demoCanvas}), '$class'})):start(get({This, demoCanvas})),
            (get({This, '$class'})):setRunning(This, false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({This, '$class'})):setRunning(This, false),
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E)
        end.

getType(This) ->
        get({'DemoGameStartupRunnable', 'TYPE'}).

