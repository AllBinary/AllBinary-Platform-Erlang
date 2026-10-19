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
% import org.allbinary.AppletUtil
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.input.motion.button.TouchScreenFactory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.time.TimeDelayHelper

-module('PressStartMenuPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, displayInfo}, 'DisplayInfoSingleton':getInstance()),
    put({This, 'PRESS_START'}, "Press Screen To Start"),
    put({This, 'KEY_START'}, "Press or Click F2 To Begin"),
    put({This, 'MENU_START'}, "Press Start From The Menu To Begin"),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, startString}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(1100)),
    put({This, flash}, false),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, beginWidth}, 0),
    put({This, line}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Paintable':init(This),
    init_fields(This),
        case (fun(Target_N66296) -> (get({Target_N66296, '$class'})):isTouch(Target_N66296) end)('TouchScreenFactory':getInstance()) of
            true ->
            put({This, startString}, get({This, 'PRESS_START'}));
            false ->
            case 'AppletUtil':isAppletLoader(This) of
            true ->
            put({This, startString}, get({This, 'KEY_START'}));
            false ->
            put({This, startString}, get({This, 'MENU_START'}))
        end
        end.

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, beginWidth}, (((fun(Target_N66652) -> (get({Target_N66652, '$class'})):stringWidth(Target_N66652, get({This, startString})) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1))),
        put({This, line}, (((4 * 'MyFontProcessor':defaultCharWidth(Font))) + (((get({Font, '$class'})):getHeight(Font) bsr 1)))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paint(This, Graphics) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTimeTNT(get({This, timeDelayHelper})) of
            true ->
            case (get({This, '$class'})):isFlash(This) of
                true ->
                (get({This, '$class'})):setFlash(This, false);
                false ->
                (get({This, '$class'})):setFlash(This, true)
            end;
            false -> ok
        end,
        case (get({This, '$class'})):isFlash(This) of
            true ->
            (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
            (get({Graphics, '$class'})):drawString(Graphics, get({This, startString}), ((get({get({This, displayInfo}), '$class'})):getLastHalfWidth(get({This, displayInfo})) - get({This, beginWidth})), ((get({get({This, displayInfo}), '$class'})):getLastHeight(get({This, displayInfo})) - get({This, line})), get({This, anchor}));
            false -> ok
        end.

setFlash(This, Flash) when is_boolean(Flash) ->
        put({This, flash}, Flash).

isFlash(This) ->
        get({This, flash}).

