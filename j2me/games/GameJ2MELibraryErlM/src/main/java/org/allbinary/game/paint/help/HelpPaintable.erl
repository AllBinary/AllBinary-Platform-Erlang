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
% package org.allbinary.game.paint.help
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil

-module('HelpPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, displayInfo}, 'DisplayInfoSingleton':getInstance()),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, title}, undefined),
    put({This, inputInfo}, (fun(Target_N66154) -> (get({Target_N66154, '$class'})):getArrayInstance(Target_N66154) end)('StringUtil':getInstance())),
    put({This, basicColor}, undefined),
    put({This, titleBeginWidth}, 0),
    put({This, beginWidthArray}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'})),
    put({This, charHeight}, 0),
    ok.


new(Title, BackgroundBasicColor, BasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Title, BackgroundBasicColor, BasicColor),
    This.

'$init'(This, Title, BackgroundBasicColor, BasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    'Paintable':'$init'(This),
    init_fields(This),
        put({This, title}, Title),
        put({This, basicColor}, BasicColor).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, titleBeginWidth}, (((get({Font, '$class'})):stringWidth(Font, get({This, title})) bsr 1))),
        put({This, charHeight}, (get({Font, '$class'})):getHeight(Font)),
        Size = array:size(get({This, inputInfo})),
        lists:foreach(fun(Index) ->
            put({This, beginWidthArray}, array:set(Index, (((get({Font, '$class'})):stringWidth(Font, array:get(Index, get({This, inputInfo}))) bsr 1)), get({This, beginWidthArray})))
        end, lists:seq(0, Size - 1)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

setInputInfoP(This, InputInfo) when (is_tuple(InputInfo) orelse InputInfo =:= undefined) ->
        put({This, inputInfo}, InputInfo),
        put({This, beginWidthArray}, array:new(array:size(get({This, inputInfo})), {default, 0})),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        HalfWidth = (get({get({This, displayInfo}), '$class'})):getLastHalfWidth(get({This, displayInfo})),
        (get({Graphics, '$class'})):setColor(Graphics, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor}))),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, title}), (HalfWidth - get({This, titleBeginWidth})), get({This, charHeight}), get({This, anchor})),
        Size = array:size(get({This, inputInfo})),
        lists:foreach(fun(Index) ->
            (get({Graphics, '$class'})):drawString(Graphics, array:get(Index, get({This, inputInfo})), (HalfWidth - array:get(Index, get({This, beginWidthArray}))), (((Index + 3)) * get({This, charHeight})), get({This, anchor}))
        end, lists:seq(0, Size - 1)).

