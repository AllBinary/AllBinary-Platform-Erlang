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
% package org.allbinary.animation.text
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.graphics.font.FontDebugFactory
% import org.allbinary.logic.string.StringUtil

-module('CustomTextAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TextInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TextAnimation', Function, Arguments).

init_fields(This) ->
    put({This, fontDebugFactory}, 'FontDebugFactory':getInstance()),
    put({This, fontSize}, 0),
    put({This, font}, undefined),
    put({This, lastText}, get({'StringUtil':getInstance(), 'INIT_STRING'})),
    put({This, hasChanged}, true),
    put({This, textWidth}, 0),
    ok.


new(Text, FontSize, AnimationBehavior) when (is_list(Text) orelse Text =:= undefined), is_integer(FontSize) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Text, FontSize, AnimationBehavior),
    This.

'$init'(This, Text, FontSize, AnimationBehavior) when (is_list(Text) orelse Text =:= undefined), is_integer(FontSize) ->
        'TextAnimation':'$init'(This, Text, AnimationBehavior),
        init_fields(This),
        put({This, fontSize}, FontSize),
        put({This, font}, 'Font':getFont(get({'Font', 'FACE_SYSTEM'}), get({'Font', 'STYLE_PLAIN'}), FontSize)).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        ExistingFont = (get({Graphics, '$class'})):getFont(Graphics),
        (get({get({This, fontDebugFactory}), '$class'})):setFont(get({This, fontDebugFactory}), get({This, font}), Graphics),
        'TextAnimation':paintXYNoUpdate(This, Graphics, X, Y),
        (get({get({This, fontDebugFactory}), '$class'})):setFont(get({This, fontDebugFactory}), ExistingFont, Graphics).

setScale(This, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        case (ScaleX =/= ScaleY) of
            true ->
            erlang:error({'RuntimeException'});
            false -> ok
        end,
        put({This, hasChanged}, true),
        put({This, font}, 'Font':getFont(get({'Font', 'FACE_SYSTEM'}), get({'Font', 'STYLE_PLAIN'}), trunc(((float(get({This, fontSize})) * ScaleX))))).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        case (get({This, lastText}) =/= Text) of
            true ->
            put({This, hasChanged}, true),
            put({This, lastText}, Text),
            'TextAnimation':setText(This, Text);
            false -> ok
        end.

getText(This) ->
        get({This, lastText}).

getWidth(This) ->
        case get({This, hasChanged}) of
            true ->
            put({This, textWidth}, (get({get({This, font}), '$class'})):stringWidth(get({This, font}), array:get(0, get({This, textArrayP})))),
            put({This, hasChanged}, false);
            false -> ok
        end,
        get({This, textWidth}).

getFontHeight(This) ->
        (get({get({This, font}), '$class'})):getHeight(get({This, font})).

