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
% package org.allbinary.game.score.displayable
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Graphics
% import org.allbinary.J2MEUtil
% import org.allbinary.game.GameInfo
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.displayable.canvas.GameCommandCanvas
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.paint.ColorFillBasePaintable
% import org.allbinary.game.paint.ColorFillPaintableFactory
% import org.allbinary.game.score.HighScoreCommandsFactory
% import org.allbinary.game.score.HighScores
% import org.allbinary.game.score.HighScoresCanvasInputProcessor
% import org.allbinary.game.score.HighScoresCanvasInputProcessorFactoryInterface
% import org.allbinary.game.score.HighScoresFactoryInterface
% import org.allbinary.game.score.HighScoresHelperBase
% import org.allbinary.game.score.HighScoresPaintable
% import org.allbinary.game.score.HighScoresResultsListener
% import org.allbinary.game.score.NoHighScoresFactory
% import org.allbinary.game.score.NullHighScoresSingletonFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.SimpleTextPaintable
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.ARunnable
% import org.allbinary.thread.SecondaryThreadPool
% import org.allbinary.logic.ABSystemWrapper

-module('HighScoresCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements HighScoresResultsListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameCommandCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "HighScoresCanvas"),
    ok.

init_fields(This) ->
    put({This, paintable}, 'NullPaintable':getInstance()),
    put({This, highScoreCommandsFactory}, 'HighScoreCommandsFactory':getInstance()),
    put({This, waitPaintable}, 'SimpleTextPaintable':new(get({get({This, commonStrings}), 'PLEASE_WAIT_FOR_SERVER'}), get({'BasicColorFactory':getInstance(), 'WHITE'}))),
    put({This, highScoresPaintable}, undefined),
    put({This, highScoresFactoryInterface}, undefined),
    put({This, colorFillPaintable}, undefined),
    put({This, highScoresHelper}, 'HighScoresHelperBase':new()),
    put({This, gameInfo}, undefined),
    put({This, highScoresCanvasInputProcessor}, undefined),
    put({This, currentCommand}, array:get(0, get({get({This, highScoreCommandsFactory}), 'HIGH_SCORE_COMMANDS'}))),
    put({This, hasPainted}, false),
    ok.


new(CommandListener, AllBinaryGameLayerManager, GameInfo, Paintable, HighScoresFactoryInterface, HighScoresCanvasInputProcessorFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CommandListener, AllBinaryGameLayerManager, GameInfo, Paintable, HighScoresFactoryInterface, HighScoresCanvasInputProcessorFactoryInterface),
    This.

'$init'(This, CommandListener, AllBinaryGameLayerManager, GameInfo, Paintable, HighScoresFactoryInterface, HighScoresCanvasInputProcessorFactoryInterface) ->
        'GameCommandCanvas':'$init'(This, CommandListener, get({'HighScoresCanvas', 'NAME'}), (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), (get({AllBinaryGameLayerManager, '$class'})):getForegroundBasicColor(AllBinaryGameLayerManager)),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, highScoresPaintable}, Paintable),
        put({This, highScoresFactoryInterface}, HighScoresFactoryInterface),
        put({This, highScoresCanvasInputProcessor}, (get({HighScoresCanvasInputProcessorFactoryInterface, '$class'})):getInstance(HighScoresCanvasInputProcessorFactoryInterface, This)),
        put({This, gameInfo}, GameInfo),
        (get({get({This, waitPaintable}), '$class'})):setBasicColorP(get({This, waitPaintable}), (get({AllBinaryGameLayerManager, '$class'})):getForegroundBasicColor(AllBinaryGameLayerManager)),
        (fun(Target_N67313) -> (get({Target_N67313, '$class'})):setBasicColorP(Target_N67313, (get({AllBinaryGameLayerManager, '$class'})):getForegroundBasicColor(AllBinaryGameLayerManager)) end)((get({This, '$class'})):getHighScoresPaintable(This)),
        put({This, colorFillPaintable}, (fun(Target_N67370) -> (get({Target_N67370, '$class'})):getInstance(Target_N67370, (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), false) end)('ColorFillPaintableFactory':getInstance())),
        case ((get({get({This, highScoresHelper}), '$class'})):getHighScoresArray(get({This, highScoresHelper})) =:= get({'NoHighScoresFactory':getInstance(), 'NO_HIGH_SCORES'})) of
            true ->
            (get({This, '$class'})):setPaintable(This, get({This, waitPaintable}));
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Show HighScores that are already loaded", This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            (get({This, '$class'})):updateCommand(This, get({This, currentCommand})),
            (get({This, '$class'})):setPaintable(This, (get({This, '$class'})):getHighScoresPaintable(This))
        end,
        ok % Java nested type HighScoreRunnable: move it to its own module
,
        (fun(Target_N68653) -> (get({Target_N68653, '$class'})):runTask(Target_N68653, 'HighScoreRunnable':new(This)) end)('SecondaryThreadPool':getInstance()).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

open(This) ->
        'GameCommandCanvas':open(This),
        (get({get({This, highScoresCanvasInputProcessor}), '$class'})):open(get({This, highScoresCanvasInputProcessor})).

% throws Exception
close(This) ->
        'GameCommandCanvas':close(This),
        (get({get({This, highScoresCanvasInputProcessor}), '$class'})):close(get({This, highScoresCanvasInputProcessor})).

paint(This, Graphics) ->
        (get({get({This, colorFillPaintable}), '$class'})):paint(get({This, colorFillPaintable}), Graphics),
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics),
        case (get({This, waitPaintable}) =/= get({This, paintable})) of
            true ->
            (get({get({This, highScoresCanvasInputProcessor}), '$class'})):paint(get({This, highScoresCanvasInputProcessor}), Graphics);
            false -> ok
        end,
        'GameCommandCanvas':paint(This, Graphics),
        put({This, hasPainted}, true).

executeUpdate(This) ->
        try
            (get({get({This, highScoresFactoryInterface}), '$class'})):fetchHighScores(get({This, highScoresFactoryInterface}), (get({This, '$class'})):getGameInfo(This), This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'UPDATE'}), E)
        end.

getHighScoresPaintable(This) ->
        get({This, highScoresPaintable}).

setHighScoresArray(This, HighScoresArray) when (is_tuple(HighScoresArray) orelse HighScoresArray =:= undefined) ->
        try
            case (HighScoresArray =/= undefined) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69768) -> (get({Target_N69768, '$class'})):toString(Target_N69768) end)((fun(Target_N69775) -> (get({Target_N69775, '$class'})):appendint(Target_N69775, array:size(HighScoresArray)) end)((fun(Target_N69782) -> (get({Target_N69782, '$class'})):append(Target_N69782, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new()))), This, "setHighScoresArray");
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "setHighScoresArray")
            end,
            (get({get({This, highScoresHelper}), '$class'})):setHighScoresArray(get({This, highScoresHelper}), HighScoresArray),
            (get({This, '$class'})):updateCommand(This, get({This, currentCommand})),
            (get({This, '$class'})):setPaintable(This, (get({This, '$class'})):getHighScoresPaintable(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'UPDATE'}), E)
        end.

% throws Exception
updateCommand(This, Command) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70150) -> (get({Target_N70150, '$class'})):toString(Target_N70150) end)((fun(Target_N70157) -> (get({Target_N70157, '$class'})):append(Target_N70157, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Command)) end)((fun(Target_N70164) -> (get({Target_N70164, '$class'})):append(Target_N70164, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'UPDATE'})),
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        case (get({get({This, highScoreCommandsFactory}), '$class'})):isHighScoreCommand(get({This, highScoreCommandsFactory}), Command) of
            true ->
            Index = (get({get({This, highScoreCommandsFactory}), '$class'})):getIndex(get({This, highScoreCommandsFactory}), Command),
            put({local, nextIndex}, (Index + 1)),
            HighScoresArray = (get({get({This, highScoresHelper}), '$class'})):getHighScoresArray(get({This, highScoresHelper})),
            case (get({local, nextIndex}) >= array:size(HighScoresArray)) of
                true ->
                put({local, nextIndex}, 0);
                false -> ok
            end,
            case (array:size(HighScoresArray) > 0) of
                true ->
                (fun(Target_N70662) -> (get({Target_N70662, '$class'})):setHighScores(Target_N70662, array:get(Index, HighScoresArray)) end)((get({This, '$class'})):getHighScoresPaintable(This));
                false ->
                (fun(Target_N70613) -> (get({Target_N70613, '$class'})):setHighScores(Target_N70613, 'NullHighScoresSingletonFactory':getInstance()) end)((get({This, '$class'})):getHighScoresPaintable(This))
            end,
            case (Index =/= get({local, nextIndex})) of
                true ->
                (get({This, '$class'})):removeAllCommands(This),
                (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'CLOSE_AND_SHOW_GAME_CANVAS'})),
                (get({This, '$class'})):addCommand(This, array:get(get({local, nextIndex}), get({get({This, highScoreCommandsFactory}), 'HIGH_SCORE_COMMANDS'})));
                false -> ok
            end;
            false -> ok
        end,
        put({This, currentCommand}, Command),
        (get({This, '$class'})):close(This),
        'GameCommandCanvas':initMenu(This),
        (get({This, '$class'})):open(This),
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This).

getGameInfo(This) ->
        get({This, gameInfo}).

setPaintable(This, Paintable) ->
        put({This, paintable}, Paintable),
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This).

