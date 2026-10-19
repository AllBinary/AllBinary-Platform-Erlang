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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.logic.string.StringUtil

-module('KeyValueDrawString').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

init_fields(This) ->
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, 'LABEL'}, undefined),
    put({This, labelX}, 0),
    put({This, valueX}, 0),
    put({This, value}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Label, X) when (is_list(Label) orelse Label =:= undefined), is_integer(X) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, X),
    This.

init(This, Label, X) when (is_list(Label) orelse Label =:= undefined), is_integer(X) ->
    init_fields(This),
        put({This, 'LABEL'}, Label),
        put({This, labelX}, X).

updateMeasurement(This, Graphics) ->
        LabelWidth = ((fun(Target_N66076) -> (get({Target_N66076, '$class'})):stringWidth(Target_N66076, get({This, 'LABEL'})) end)((get({Graphics, '$class'})):getFont(Graphics)) - string:length(get({This, 'LABEL'}))),
        put({This, valueX}, (LabelWidth + get({This, labelX}))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paint(This, Graphics, Y) when is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'LABEL'}), get({This, labelX}), Y, 0),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, value}), get({This, valueX}), Y, 0).

update(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        case (Value =/= undefined) of
            true ->
            put({This, value}, Value);
            false -> ok
        end.

