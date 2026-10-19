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
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.event.GameKeyEventHandler
% import org.allbinary.game.input.event.GameKeyEventUtil
% import org.allbinary.game.score.displayable.HighScoresCanvas
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.util.BasicArrayList

-module('HighScoresCanvasLevelChangeInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScoresCanvasInputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, 'INSTRUCTIONS'}, "(Right = Next Track, Left = Previous Track)"),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, fontHeight}, 0),
    ok.


new(HighScoresCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HighScoresCanvas),
    This.

init(This, HighScoresCanvas) ->
        'HighScoresCanvasInputProcessor':init(This, HighScoresCanvas),
        init_fields(This).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

open(This) ->
        (fun(Target_N66436) -> (get({Target_N66436, '$class'})):addListener(Target_N66436, This) end)('GameKeyEventHandler':getInstance()).

close(This) ->
        (fun(Target_N66510) -> (get({Target_N66510, '$class'})):removeListener(Target_N66510, This) end)('GameKeyEventHandler':getInstance()).

update(This) ->
        List = (get({This, '$class'})):getGameKeyEventList(This),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            AnyType = array:get(Index, get({List, objectArray})),
            Key = 'GameKeyEventUtil':getKey(AnyType),
            case (Key =:= get({'Canvas', 'RIGHT'})) of
                true ->
                (fun(Target_N66914) -> (get({Target_N66914, '$class'})):nextGameLevel(Target_N66914) end)((fun(Target_N66921) -> (get({Target_N66921, '$class'})):getGameInfo(Target_N66921) end)((get({This, '$class'})):getHighScoresCanvas(This)));
                false ->
                case (Key =:= get({'Canvas', 'LEFT'})) of
                true ->
                (fun(Target_N66871) -> (get({Target_N66871, '$class'})):previousGameLevel(Target_N66871) end)((fun(Target_N66878) -> (get({Target_N66878, '$class'})):getGameInfo(Target_N66878) end)((get({This, '$class'})):getHighScoresCanvas(This)));
                false -> ok
            end
            end,
            (fun(Target_N66952) -> (get({Target_N66952, '$class'})):executeUpdate(Target_N66952) end)((get({This, '$class'})):getHighScoresCanvas(This))
        end, lists:seq(0, Size - 1)),
        (get({List, '$class'})):clear(List).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        Width = (get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton})),
        TopScoresWidth = (((fun(Target_N67210) -> (get({Target_N67210, '$class'})):stringWidth(Target_N67210, get({This, 'INSTRUCTIONS'})) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1)),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'INSTRUCTIONS'}), (((Width bsr 1)) - TopScoresWidth), (get({This, fontHeight}) * 2), get({This, anchor})).

