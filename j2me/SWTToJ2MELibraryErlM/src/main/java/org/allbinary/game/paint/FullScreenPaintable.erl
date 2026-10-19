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
% package org.allbinary.game.paint
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.Paintable

-module('FullScreenPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, displayInfo}, 'DisplayInfoSingleton':getInstance()),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, 'FULLSCREEN_TEXT'}, "F11 - Toggle Fullscreen"),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, 'Y'}, 0),
    put({This, beginWidth}, 0),
    ok.


getInstance() ->
        'FullScreenPaintable':new().

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
        put({This, 'Y'}, (4 * (get({Font, '$class'})):getHeight(Font))),
        put({This, beginWidth}, (((get({Font, '$class'})):stringWidth(Font, get({This, 'FULLSCREEN_TEXT'})) bsr 1))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        HalfWidth = (get({get({This, displayInfo}), '$class'})):getLastHalfWidth(get({This, displayInfo})),
        Height = (get({get({This, displayInfo}), '$class'})):getLastHeight(get({This, displayInfo})),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'FULLSCREEN_TEXT'}), (HalfWidth - get({This, beginWidth})), (Height - get({This, 'Y'})), get({This, anchor})).

