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
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.FontDebugFactory
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.InitUpdatePaintable
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('StartIntermissionPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitUpdatePaintable', Function, Arguments).

init_fields(This) ->
    put({This, fontDebugFactory}, 'FontDebugFactory':getInstance()),
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, gameCanvas}, undefined),
    put({This, stringArray}, undefined),
    put({This, fontSize}, 0),
    put({This, font}, undefined),
    put({This, lastWidth}, undefined),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'BLACK'})),
    put({This, color}, 0),
    put({This, lineYOffsetArray}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'})),
    put({This, hasChanged}, true),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, fontHeightP}, 0),
    put({This, 'BEGIN_LEVEL'}, "Begin Level "),
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(GameCanvas, StringArray, BasicColor, Font) when (is_tuple(StringArray) orelse StringArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameCanvas, StringArray, BasicColor, Font),
    This.

init(This, GameCanvas, StringArray, BasicColor, Font) when (is_tuple(StringArray) orelse StringArray =:= undefined) ->
    'InitUpdatePaintable':init(This),
    init_fields(This),
        put({This, gameCanvas}, GameCanvas),
        put({This, stringArray}, StringArray),
        put({This, lastWidth}, array:new(array:size(get({This, stringArray})), {default, 0})),
        (get({This, '$class'})):setBasicColorP(This, BasicColor),
        put({This, color}, (get({BasicColor, '$class'})):intValue(BasicColor)),
        put({This, fontSize}, (get({Font, '$class'})):getSize(Font)),
        put({This, font}, Font).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeightP}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        ExistingFont = (get({Graphics, '$class'})):getFont(Graphics),
        (get({get({This, fontDebugFactory}), '$class'})):setFont(get({This, fontDebugFactory}), get({This, font}), Graphics),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, get({This, basicColor}), get({This, color})),
        put({local, beginWidth}, 0),
        lists:foreach(fun(Index) ->
            case get({This, hasChanged}) of
                true ->
                put({This, lastWidth}, array:set(Index, (((fun(Target_N67523) -> (get({Target_N67523, '$class'})):stringWidth(Target_N67523, array:get(Index, get({This, stringArray}))) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1)), get({This, lastWidth})));
                false -> ok
            end,
            put({local, beginWidth}, array:get(Index, get({This, lastWidth}))),
            (get({Graphics, '$class'})):drawString(Graphics, array:get(Index, get({This, stringArray})), ((get({DisplayInfo, '$class'})):getLastHalfWidth(DisplayInfo) - get({local, beginWidth})), ((get({DisplayInfo, '$class'})):getLastHalfHeight(DisplayInfo) - array:get(Index, get({This, lineYOffsetArray}))), get({This, anchor}))
        end, lists:seq((array:size(get({This, lineYOffsetArray})) - 1), 0, -1)),
        put({This, hasChanged}, false),
        (get({get({This, fontDebugFactory}), '$class'})):setFont(get({This, fontDebugFactory}), ExistingFont, Graphics).

update(This) ->
        Level = (fun(Target_N68069) -> (get({Target_N68069, '$class'})):getCurrentLevel(Target_N68069) end)((fun(Target_N68076) -> (get({Target_N68076, '$class'})):getGameInfo(Target_N68076) end)((get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas})))),
        put({This, stringArray}, array:set(0, (fun(Target_N68142) -> (get({Target_N68142, '$class'})):toString(Target_N68142) end)((fun(Target_N68149) -> (get({Target_N68149, '$class'})):appendint(Target_N68149, Level) end)((fun(Target_N68156) -> (get({Target_N68156, '$class'})):append(Target_N68156, get({This, 'BEGIN_LEVEL'})) end)('StringMaker':new()))), get({This, stringArray}))),
        lists:foreach(fun(Index) ->
            put({This, stringArray}, array:set(Index, get({This, 'EMPTY_STRING'}), get({This, stringArray})))
        end, lists:seq((array:size(get({This, stringArray})) - 1), 1, -1)).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor).

getBasicColorP(This) ->
        get({This, basicColor}).

