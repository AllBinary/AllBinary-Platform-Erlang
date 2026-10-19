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
% package org.allbinary.media
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.time.TimeDelayHelper

-module('AllBinaryVisualDebugVibration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryVibrationME', Function, Arguments).

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(get({'Integer', 'MAX_VALUE'}))),
    put({This, 'VIBRATING'}, "Vibrating"),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, width}, 0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'AllBinaryVibrationME':init(This),
    init_fields(This).


updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, width}, (get({Font, '$class'})):stringWidth(Font, get({This, 'VIBRATING'}))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

vibrate(This, Duration, Type, Volume) when is_integer(Duration), is_integer(Type), is_integer(Volume) ->
        put({get({This, timeDelayHelper}), delay}, Duration).

paint(This, Graphics) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTimeTNT(get({This, timeDelayHelper})) of
            true ->
            put({get({This, timeDelayHelper}), delay}, get({'Integer', 'MAX_VALUE'})),
            (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
            (get({Graphics, '$class'})):drawString(Graphics, get({This, 'VIBRATING'}), ((get({get({This, displayInfoSingleton}), '$class'})):getLastHalfWidth(get({This, displayInfoSingleton})) - ((get({This, width}) bsr 1))), 0, get({This, anchor}));
            false -> ok
        end.

