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
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('CreateGameRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Runnable

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, demoGameMidlet}, undefined),
    put({This, hashtable}, undefined),
    put({This, startGameMidletEvent}, undefined),
    ok.


new(DemoGameMidlet, Hashtable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DemoGameMidlet, Hashtable),
    This.

'$init'(This, DemoGameMidlet, Hashtable) ->
    init_fields(This),
        put({This, demoGameMidlet}, DemoGameMidlet),
        put({This, hashtable}, Hashtable),
        put({This, startGameMidletEvent}, 'DemoGameMidletEvent':new(This, get({'DemoGameMidletStateFactory':getInstance(), 'START_GAME'}))).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            (get({get({This, demoGameMidlet}), '$class'})):commandAction(get({This, demoGameMidlet}), get({'MyCommandsFactory':getInstance(), 'SET_DISPLAYABLE'}), ProgressCanvas),
            (get({get({This, demoGameMidlet}), '$class'})):stopGameCanvasRunnableInterface(get({This, demoGameMidlet})),
            (get({get({This, demoGameMidlet}), '$class'})):setGameCanvasRunnableInterface(get({This, demoGameMidlet}), (get({get({This, demoGameMidlet}), '$class'})):createGameCanvasRunnableInterface(get({This, demoGameMidlet}))),
            (fun(Target_N66495) -> (get({Target_N66495, '$class'})):setLoadStateHashtable(Target_N66495, get({This, hashtable})) end)((get({get({This, demoGameMidlet}), '$class'})):getGameCanvasRunnableInterface(get({This, demoGameMidlet}))),
            (get({get({This, demoGameMidlet}), '$class'})):startGameCanvasRunnableInterface(get({This, demoGameMidlet})),
            (fun(Target_N66567) -> (get({Target_N66567, '$class'})):fireEvent(Target_N66567, get({This, startGameMidletEvent})) end)('DemoGameMidletEventHandler':getInstance()),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

