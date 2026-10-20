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
% package org.allbinary.graphics.canvas.transition.progress
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.NullCanvas
% import javax.microedition.lcdui.NullCommandListener
% import org.allbinary.canvas.Processor
% import org.allbinary.canvas.RunnableCanvas
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.form.item.ABCustomGaugeItem
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.midlet.AllBinaryMidlet
% import org.allbinary.thread.PathFindingThreadPool
% import org.allbinary.thread.ThreadPool

-module('ProgressCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaintableInterface
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RunnableCanvas', Function, Arguments).

init_fields(This) ->
    put({This, hasPainted}, false),
    put({This, backgroundBasicColor}, undefined),
    put({This, 'GAUGE_PAINTABLE'}, 'ProgressPaintable':new(This)),
    put({This, maxValue}, 100.0),
    put({This, gauge}, undefined),
    put({This, 'TEXT'}, get({get({This, commonStrings}), 'LOADING'})),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, allbinaryMidlet}, 'AllBinaryMidlet':getNullInstance()),
    put({This, value}, 0.0),
    put({This, text}, get({This, 'TEXT'})),
    put({This, background}, true),
    put({This, paintable}, get({This, 'GAUGE_PAINTABLE'})),
    put({This, inProgress}, false),
    put({This, 'IN_GAME_PROCESSOR'}, 'Processor':new() % Java anonymous class body: implement it as a module
%         put({This, pathFindingThreadPool}, 'PathFindingThreadPool':getInstance())
%         ok % process
),
    put({This, inGameProcessor}, 'Processor':getInstance()),
    put({This, progressEndListener}, get({'ProgressEndListener', instance})),
    put({This, backgroundLabel}, "Background AI Game Loading..."),
    put({This, 'START_BACKGROUND'}, "startBackground"),
    put({This, 'ADD_PORTION'}, "addPortion"),
    put({This, 'ADD_EARLY_PORTION'}, "addEarlyPortion"),
    ok.


new(Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Title, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'RunnableCanvas':'$init'(This, get({'NullCommandListener', 'NULL_COMMAND_LISTENER'}), get({'CanvasStrings':getInstance(), 'EMPTY_CHILD_NAME_LIST'}), false),
        init_fields(This),
        put({This, backgroundBasicColor}, BackgroundBasicColor),
        put({This, gauge}, 'ABCustomGaugeItem':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), trunc(get({This, maxValue})), 0, BackgroundBasicColor, ForegroundBasicColor)).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        (get({get({This, gauge}), '$class'})):setHeight(get({This, gauge}), ((get({Font, '$class'})):getHeight(Font) + 2)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

init(This, GameMidlet) ->
        put({This, allbinaryMidlet}, GameMidlet).

% throws Exception
update(This, Graphics) ->
        ok.

initCommands(This, CmdListener) ->
        ok.

getMaxValue(This) ->
        get({This, maxValue}).

start(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'START_METHOD_NAME'})),
        (get({This, '$class'})):setBackground(This, true),
        (get({get({This, gauge}), '$class'})):setHeight(get({This, gauge}), 30),
        (get({get({This, gauge}), '$class'})):setLabel(get({This, gauge}), get({get({This, commonStrings}), 'PLEASE_WAIT'})),
        (get({This, '$class'})):setText(This, get({This, 'TEXT'})),
        (get({This, '$class'})):setValue(This, 0),
        put({This, inGameProcessor}, 'Processor':getInstance()),
        put({This, paintable}, get({This, 'GAUGE_PAINTABLE'})),
        put({This, inProgress}, true).

startBackground(This, Background) when is_boolean(Background) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({This, 'START_BACKGROUND'})),
        (get({This, '$class'})):setBackground(This, Background),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
        (get({get({This, gauge}), '$class'})):setLabel(get({This, gauge}), get({This, backgroundLabel})),
        (get({This, '$class'})):setText(This, get({This, 'TEXT'})),
        (get({This, '$class'})):setValue(This, 0),
        put({This, inGameProcessor}, 'Processor':getInstance()),
        put({This, paintable}, get({This, 'GAUGE_PAINTABLE'})).

endActual(This) ->
        (get({get({This, allbinaryMidlet}), '$class'})):commandAction(get({This, allbinaryMidlet}), get({'GameCommandsFactory':getInstance(), 'SHOW_GAME_CANVAS'}), get({'NullCanvas', 'NULL_CANVAS'})),
        put({This, inProgress}, false),
        (get({This, '$class'})):inGame(This).

inGame(This) ->
        (get({get({This, progressEndListener}), '$class'})):onEndEvent(get({This, progressEndListener})),
        put({This, inGameProcessor}, get({This, 'IN_GAME_PROCESSOR'})).

'end'(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'})),
        (get({get({This, gauge}), '$class'})):setValue(get({This, gauge}), (get({This, '$class'})):getMaxValue(This)),
        (get({This, '$class'})):endActual(This),
        put({This, paintable}, 'NullPaintable':getInstance()).

endFromInitialLazyLoadingComplete(This) ->
        (get({get({This, progressEndListener}), '$class'})):onEndEvent(get({This, progressEndListener})),
        (get({get({This, gauge}), '$class'})):setValue(get({This, gauge}), (get({This, '$class'})):getMaxValue(This)),
        put({This, inGameProcessor}, get({This, 'IN_GAME_PROCESSOR'})).

isInGame(This) ->
        try
        case (get({This, inGameProcessor}) =:= get({This, 'IN_GAME_PROCESSOR'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

endIfPaintedSinceStart(This) ->
        ok.

addEarlyPortion(This, Value, Text, Index) when is_integer(Value), (is_list(Text) orelse Text =:= undefined), is_integer(Index) ->
        (get({This, '$class'})):setText(This, (fun(Target_N69448) -> (get({Target_N69448, '$class'})):toString(Target_N69448) end)((fun(Target_N69455) -> (get({Target_N69455, '$class'})):append(Target_N69455, (fun(Target_N69495) -> (get({Target_N69495, '$class'})):toString(Target_N69495) end)((fun(Target_N69502) -> (get({Target_N69502, '$class'})):getAt(Target_N69502, Index) end)('SmallIntegerSingletonFactory':getInstance()))) end)((fun(Target_N69462) -> (get({Target_N69462, '$class'})):append(Target_N69462, Text) end)('StringMaker':new())))),
        (get({get({This, gauge}), '$class'})):setValue(get({This, gauge}), ((get({get({This, gauge}), '$class'})):getValue(get({This, gauge})) + ((get({This, '$class'})):getMaxValue(This) / float(Value)))).

addPortion(This, Value, Text, Index) when is_integer(Value), (is_list(Text) orelse Text =:= undefined), is_integer(Index) ->
        (get({This, '$class'})):setText(This, (fun(Target_N69708) -> (get({Target_N69708, '$class'})):toString(Target_N69708) end)((fun(Target_N69715) -> (get({Target_N69715, '$class'})):append(Target_N69715, (fun(Target_N69755) -> (get({Target_N69755, '$class'})):toString(Target_N69755) end)((fun(Target_N69762) -> (get({Target_N69762, '$class'})):getAt(Target_N69762, Index) end)('SmallIntegerSingletonFactory':getInstance()))) end)((fun(Target_N69722) -> (get({Target_N69722, '$class'})):append(Target_N69722, Text) end)('StringMaker':new())))),
        'PreLogUtil':put(get({This, text}), This, get({This, 'ADD_PORTION'})),
        (get({get({This, gauge}), '$class'})):setValue(get({This, gauge}), ((get({get({This, gauge}), '$class'})):getValue(get({This, gauge})) + ((get({This, '$class'})):getMaxValue(This) / float(Value)))).

addNormalPortion(This, Value, Text) when is_integer(Value), (is_list(Text) orelse Text =:= undefined) ->
        case (get({This, text}) =/= Text) of
            true ->
            'PreLogUtil':put(Text, This, get({This, 'ADD_PORTION'}));
            false -> ok
        end,
        (get({This, '$class'})):setText(This, Text),
        (get({get({This, gauge}), '$class'})):setValue(get({This, gauge}), ((get({get({This, gauge}), '$class'})):getValue(get({This, gauge})) + ((get({This, '$class'})):getMaxValue(This) / float(Value)))).

setValue(This, Value) when is_integer(Value) ->
        put({This, value}, float(Value)),
        (get({get({This, gauge}), '$class'})):setValue(get({This, gauge}), float(Value)).

paint(This, Graphics) ->
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics).

paint2(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({Graphics, '$class'})):setColor(Graphics, (get({get({This, backgroundBasicColor}), '$class'})):intValue(get({This, backgroundBasicColor}))),
        (get({Graphics, '$class'})):fillRect(Graphics, 0, 0, (get({get({This, displayInfo}), '$class'})):getLastWidth(get({This, displayInfo})), (get({get({This, displayInfo}), '$class'})):getLastHeight(get({This, displayInfo}))),
        (get({get({This, gauge}), '$class'})):paintXY(get({This, gauge}), Graphics, 0, 0),
        put({This, hasPainted}, true).

paintThreed(This, Graphics) ->
        ok.

getValue(This) ->
        get({This, value}).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        put({This, text}, Text).

getText(This) ->
        get({This, text}).

setBackground(This, Background) when is_boolean(Background) ->
        put({This, background}, Background).

isBackground(This) ->
        get({This, background}).
% Java nested class ProgressPaintable: move it to its own module 'ProgressPaintable'

