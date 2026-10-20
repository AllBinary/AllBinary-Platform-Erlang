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
% import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.system.security.licensing.ClientInformationFactory
% import org.allbinary.thread.PrimaryThreadPool
% import org.allbinary.game.displayable.canvas.NullGameCanvasRunnable
% import org.allbinary.util.ABHashtable

-module('DemoGameMidlet').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameMidlet', Function, Arguments).

init_fields(This) ->
    ok.


new(ClientInformationFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ClientInformationFactory),
    This.

'$init'(This, ClientInformationFactory) ->
        'GameMidlet':'$init'(This, ClientInformationFactory).

% throws Exception
isContinue(This) ->
        try
        Hashtable = (get({This, '$class'})):getStartStateHashtable(This),
        case ((Hashtable =/= undefined) andalso ((get({Hashtable, '$class'})):size(Hashtable) > 0)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getHighestLevel(This) ->
        1.

% throws Exception
createDemoGameCanvasRunnableInterface(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This, get({get({This, commonStrings}), 'CREATE'})),
        get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'}).

% throws Exception
createGameCanvasRunnable(This, AllBinaryGameLayerManager) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
createGameCanvasRunnableInterface(This) ->
        (get({This, '$class'})):createGameCanvasRunnable(This, (get({This, '$class'})):createGameLayerManager(This)).

demoSetup(This) ->
        ok.

postDemoSetup(This) ->
        ok.

% throws Exception
setDemo(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "setDemo"),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):start(ProgressCanvas),
        (fun(Target_N66642) -> (get({Target_N66642, '$class'})):runTask(Target_N66642, 'DemoRunnable':new(This)) end)('PrimaryThreadPool':getInstance()).

% throws Exception
createGame(This) ->
        CREATE_GAME = "createGame",
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, CREATE_GAME),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):start(ProgressCanvas),
        Hashtable = (get({This, '$class'})):getStartStateHashtable(This),
        (get({This, '$class'})):setStartStateHashtable(This, get({'StdUtil':getInstance(), 'NULL_TABLE'})),
        (fun(Target_N67009) -> (get({Target_N67009, '$class'})):runTask(Target_N67009, 'CreateGameRunnable':new(This, Hashtable)) end)('PrimaryThreadPool':getInstance()),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, CREATE_GAME).

isReady(This) ->
        true.

