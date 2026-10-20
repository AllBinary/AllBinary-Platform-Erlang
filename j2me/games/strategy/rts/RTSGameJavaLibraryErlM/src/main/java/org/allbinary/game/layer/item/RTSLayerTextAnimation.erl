% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer.item
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.Animation
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor

-module('RTSLayerTextAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, image}, undefined),
    put({This, text}, undefined),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, fontHeight}, 0),
    ok.


new(Text, Image) when (is_list(Text) orelse Text =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Text, Image),
    This.

'$init'(This, Text, Image) when (is_list(Text) orelse Text =:= undefined) ->
    'Animation':'$init'(This),
    init_fields(This),
        put({This, text}, Text),
        put({This, image}, Image).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        'Animation':paintXY(This, Graphics, X, Y),
        AdjustedCostY = ((get({get({This, image}), '$class'})):getHeight(get({This, image})) - get({This, fontHeight})),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, text}), X, (Y + AdjustedCostY), 0).

