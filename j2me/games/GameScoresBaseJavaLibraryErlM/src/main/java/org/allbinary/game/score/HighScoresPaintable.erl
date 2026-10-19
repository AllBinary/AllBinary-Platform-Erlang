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
% package org.allbinary.game.score
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.ColorChangeEvent
% import org.allbinary.graphics.color.ColorChangeListener
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.util.BasicArrayList

-module('HighScoresPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorChangeListener
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'WHITE'})),
    put({This, highScores}, 'NullHighScoresSingletonFactory':getInstance()),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, charHeight}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Paintable':init(This),
    init_fields(This),
        ok.

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, charHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

onEvent(This, EventObject) ->
        ColorChangeEvent = EventObject,
        put({This, basicColor}, (get({ColorChangeEvent, '$class'})):getBasicColorP(ColorChangeEvent)).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        Width = (get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton})),
        Height = (get({get({This, displayInfoSingleton}), '$class'})):getLastHeight(get({This, displayInfoSingleton})),
        (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N66805) -> (get({Target_N66805, '$class'})):intValue(Target_N66805) end)((get({This, '$class'})):getBasicColorP(This))),
        Heading = (get({get({This, highScores}), '$class'})):getHeading(get({This, highScores})),
        TopScoresWidth = (((fun(Target_N66898) -> (get({Target_N66898, '$class'})):stringWidth(Target_N66898, Heading) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1)),
        CharHeight = get({This, charHeight}),
        (get({Graphics, '$class'})):drawString(Graphics, Heading, (((Width bsr 1)) - TopScoresWidth), CharHeight, get({This, anchor})),
        (get({Graphics, '$class'})):drawString(Graphics, (get({get({This, highScores}), '$class'})):getColumnOneHeading(get({This, highScores})), 10, (CharHeight * 3), get({This, anchor})),
        ColumnTwoHeading = (get({get({This, highScores}), '$class'})):getColumnTwoHeading(get({This, highScores})),
        ColumnTwoHeadingWidth = (fun(Target_N67214) -> (get({Target_N67214, '$class'})):stringWidth(Target_N67214, ColumnTwoHeading) end)((get({Graphics, '$class'})):getFont(Graphics)),
        (get({Graphics, '$class'})):drawString(Graphics, ColumnTwoHeading, ((Width - 10) - ColumnTwoHeadingWidth), (CharHeight * 3), get({This, anchor})),
        put({local, index}, 4),
        put({local, largestSecondColumnWidth}, ColumnTwoHeadingWidth),
        List = (get({get({This, highScores}), '$class'})):getList(get({This, highScores})),
        Size = (get({List, '$class'})):size(List),
        put({local, vectorIndex}, 0),
        put({local, highScore}, undefined),
        (fun Loop() -> case ((get({local, vectorIndex}) < Size) andalso ((CharHeight * get({local, index})) < (Height - ((CharHeight * 2))))) of true ->
            put({local, highScore}, array:get(get({local, vectorIndex}), get({List, objectArray}))),
            NextScoreWidth = (fun(Target_N67623) -> (get({Target_N67623, '$class'})):stringWidth(Target_N67623, (get({get({local, highScore}), '$class'})):getScoreString(get({local, highScore}))) end)((get({Graphics, '$class'})):getFont(Graphics)),
            case (NextScoreWidth > get({local, largestSecondColumnWidth})) of
                true ->
                put({local, largestSecondColumnWidth}, NextScoreWidth);
                false -> ok
            end,
            put({local, vectorIndex}, get({local, vectorIndex}) + 1),
            Loop();
        false -> ok end end)(),
        put({local, vectorIndex}, 0),
        (fun Loop() -> case ((get({local, vectorIndex}) < Size) andalso ((CharHeight * get({local, index})) < (Height - ((CharHeight * 2))))) of true ->
            put({local, highScore}, array:get(get({local, vectorIndex}), get({List, objectArray}))),
            (get({Graphics, '$class'})):drawString(Graphics, (get({get({local, highScore}), '$class'})):getName(get({local, highScore})), 10, (CharHeight * get({local, index})), get({This, anchor})),
            (get({Graphics, '$class'})):drawString(Graphics, (get({get({local, highScore}), '$class'})):getScoreString(get({local, highScore})), ((Width - 10) - get({local, largestSecondColumnWidth})), (CharHeight * get({local, index})), get({This, anchor})),
            put({local, index}, get({local, index}) + 1),
            put({local, vectorIndex}, get({local, vectorIndex}) + 1),
            Loop();
        false -> ok end end)().

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor).

getBasicColorP(This) ->
        get({This, basicColor}).

setHighScores(This, HighScores) ->
        put({This, highScores}, HighScores).

