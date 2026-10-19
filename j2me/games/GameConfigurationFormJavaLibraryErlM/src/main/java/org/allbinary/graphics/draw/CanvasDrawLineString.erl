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
% package org.allbinary.graphics.draw
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor

-module('CanvasDrawLineString').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements UpdateMyFontInterface

static_init() ->
    put({?MODULE, 'NULL_CANVAS_DRAW_LINE_STRING'}, 'CanvasDrawLineString':new(0, 0)),
    ok.

init_fields(This) ->
    put({This, drawStringUtil}, 'DrawStringUtil':getInstance()),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, x}, 0),
    put({This, y}, 0),
    put({This, fontHeight}, 0),
    ok.


new(X, Y) when is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, X, Y),
    This.

init(This, X, Y) when is_integer(X), is_integer(Y) ->
    init_fields(This),
        put({This, x}, X),
        put({This, y}, Y).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paint(This, Graphics, String, Line) when (is_list(String) orelse String =:= undefined), is_integer(Line) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, drawStringUtil}), '$class'})):drawCenterString(get({This, drawStringUtil}), Graphics, String, 0, string:length(String), get({This, x}), (get({This, y}) + ((Line * get({This, fontHeight}))))).

