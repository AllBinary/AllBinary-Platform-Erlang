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
% package org.allbinary.graphics.paint
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor

-module('SimpleTextPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, text}, undefined),
    put({This, basicColor}, undefined),
    put({This, topScoresWidth}, 0),
    put({This, fontHeight}, 0),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(Text, BasicColor) when (is_list(Text) orelse Text =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Text, BasicColor),
    This.

'$init'(This, Text, BasicColor) when (is_list(Text) orelse Text =:= undefined) ->
    'Paintable':'$init'(This),
    init_fields(This),
        put({This, text}, Text),
        put({This, basicColor}, BasicColor).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, topScoresWidth}, (((get({Font, '$class'})):stringWidth(Font, get({This, text})) bsr 1))),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        Width = array:get(get({get({This, displayInfoSingleton}), 'WIDTH'}), (get({get({This, displayInfoSingleton}), '$class'})):getLast(get({This, displayInfoSingleton}))),
        (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N66650) -> (get({Target_N66650, '$class'})):intValue(Target_N66650) end)((get({This, '$class'})):getBasicColorP(This))),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, text}), (((Width bsr 1)) - get({This, topScoresWidth})), get({This, fontHeight}), get({This, anchor})).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor).

getBasicColorP(This) ->
        get({This, basicColor}).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        put({This, text}, Text),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

getText(This) ->
        get({This, text}).

