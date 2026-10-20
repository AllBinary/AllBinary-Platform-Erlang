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
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.NullCommandListener
% import org.allbinary.game.init.BasicBuildGameInitializerFactory
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.score.NoHighScoresFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('NullGameCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryGameCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({?MODULE, 'NO_GAME'}, "No Background Game"),
    put({?MODULE, 'TYPE'}, 1),
    ok.

init_fields(This) ->
    put({This, runningNull}, true),
    ok.


createNull() ->
        try
            'NullGameCanvas':new('AllBinaryGameLayerManager':getNullInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (fun(Target_N65915) -> (get({Target_N65915, '$class'})):put(Target_N65915, get({'CommonStrings':getInstance(), 'EXCEPTION'}), "NullGameCanvas", get({'CommonStrings':getInstance(), 'GET_INSTANCE'}), E) end)('LogUtil':getInstance()),
            erlang:error({'RuntimeException'})
        end.

getInstance() ->
        case (get({'NullGameCanvas', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'NullGameCanvas', instance}, 'NullGameCanvas':createNull());
            false -> ok
        end,
        get({'NullGameCanvas', instance}).

% throws Exception
createCanvas(GameLayerManager) ->
        NullGameCanvas = 'NullGameCanvas':new(GameLayerManager),
        (get({NullGameCanvas, '$class'})):setInitialized(NullGameCanvas, true),
        (get({NullGameCanvas, '$class'})):setTitle(NullGameCanvas, get({'NullGameCanvas', 'NO_GAME'})),
        NullGameCanvas.

new(GameLayerManager) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameLayerManager),
    This.

'$init'(This, GameLayerManager) ->
        'AllBinaryGameCanvas':'$init'(This, get({'NullCommandListener', 'NULL_COMMAND_LISTENER'}), GameLayerManager, 'NoHighScoresFactory':getInstance(), get({'BasicBuildGameInitializerFactory', 'NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY'}), false),
        init_fields(This),
        'AllBinaryGameCanvas':setWait(This, 1200).

isGameOver(This) ->
        false.

setRunning(This, Running) when is_boolean(Running) ->
        put({This, runningNull}, Running).

isRunning(This) ->
        get({This, runningNull}).

pause(This) ->
        (get({This, '$class'})):setPaused(This, true).

unPause(This) ->
        (get({This, '$class'})):setPaused(This, false).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

% throws Exception
buildGameInit(This, IsProgress) when is_boolean(IsProgress) ->
        ok.

draw(This, Graphics) ->
        ok.

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

getType(This) ->
        get({'NullGameCanvas', 'TYPE'}).

