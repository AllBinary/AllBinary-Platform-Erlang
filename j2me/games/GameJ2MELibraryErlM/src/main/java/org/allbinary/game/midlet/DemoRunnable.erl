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
% package org.allbinary.game.midlet
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('DemoRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Runnable

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, demoGameMidlet}, undefined),
    put({This, startDemoGameMidletEvent}, undefined),
    ok.


new(DemoGameMidlet) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, DemoGameMidlet),
    This.

init(This, DemoGameMidlet) ->
    init_fields(This),
        put({This, demoGameMidlet}, DemoGameMidlet),
        put({This, startDemoGameMidletEvent}, 'DemoGameMidletEvent':new(get({This, demoGameMidlet}), get({'DemoGameMidletStateFactory':getInstance(), 'START_DEMO'}))).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66131) -> (get({Target_N66131, '$class'})):toString(Target_N66131) end)((fun(Target_N66138) -> (get({Target_N66138, '$class'})):append(Target_N66138, "GameCanvasRunnableInterface") end)((fun(Target_N66145) -> (get({Target_N66145, '$class'})):append(Target_N66145, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'})),
            (get({get({This, demoGameMidlet}), '$class'})):commandAction(get({This, demoGameMidlet}), get({'MyCommandsFactory':getInstance(), 'SET_DISPLAYABLE'}), 'ProgressCanvasFactory':getInstance()),
            (get({get({This, demoGameMidlet}), '$class'})):setGameCanvasRunnableInterface(get({This, demoGameMidlet}), (get({get({This, demoGameMidlet}), '$class'})):createDemoGameCanvasRunnableInterface(get({This, demoGameMidlet}))),
            (get({get({This, demoGameMidlet}), '$class'})):demoSetup(get({This, demoGameMidlet})),
            (fun(Target_N66371) -> (get({Target_N66371, '$class'})):fireEvent(Target_N66371, get({This, startDemoGameMidletEvent})) end)('DemoGameMidletEventHandler':getInstance()),
            (get({get({This, demoGameMidlet}), '$class'})):startGameCanvasRunnableInterface(get({This, demoGameMidlet})),
            (get({get({This, demoGameMidlet}), '$class'})):postDemoSetup(get({This, demoGameMidlet})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

