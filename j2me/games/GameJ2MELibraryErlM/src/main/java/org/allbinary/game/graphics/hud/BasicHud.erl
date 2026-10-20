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
% package org.allbinary.game.graphics.hud
% import javax.microedition.lcdui.Graphics
% import org.allbinary.J2MEUtil
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonStrings

-module('BasicHud').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, canvasStrings}, 'CanvasStrings':getInstance()),
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, displayInfo}, 'DisplayInfoSingleton':getInstance()),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, location}, 0),
    put({This, direction}, 0),
    put({This, bufferZone}, 0),
    put({This, bufferZoneY}, 0),
    put({This, hudGraphicsPosition}, get({'HudGraphicsPosition', 'NULL_HUD_GRAPHICS_POSITION'})),
    put({This, x}, 0),
    put({This, y}, 0),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'BLACK'})),
    put({This, color}, 0),
    put({This, updateMaxWidth}, 0),
    put({This, updateMaxHeight}, 0),
    put({This, offsetY}, 0),
    ok.


new(Location, Direction, BufferZone, BasicColor) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Location, Direction, BufferZone, BasicColor),
    This.

'$init'(This, Location, Direction, BufferZone, BasicColor) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
    init_fields(This),
        (get({This, '$class'})):setLocation(This, Location),
        (get({This, '$class'})):setDirection(This, Direction),
        (get({This, '$class'})):setBufferZone(This, BufferZone),
        (get({This, '$class'})):onDisplayChangeEvent(This, get({'DisplayInfoSingleton':getInstance(), displayChangeEvent})),
        (get({This, '$class'})):setBasicColorP(This, BasicColor),
        put({This, color}, (get({BasicColor, '$class'})):intValue(BasicColor)).

updateMeasurement(This, Graphics) ->
        try
            put({This, hudGraphicsPosition}, (get({This, '$class'})):getHudGraphicsPositionWH(This, (get({get({This, displayInfo}), '$class'})):getLastWidth(get({This, displayInfo})), (get({get({This, displayInfo}), '$class'})):getLastHeight(get({This, displayInfo})), get({This, updateMaxWidth}), get({This, updateMaxHeight}))),
            put({This, x}, (fun(Target_N67294) -> (get({Target_N67294, '$class'})):getX(Target_N67294) end)((get({get({This, hudGraphicsPosition}), '$class'})):getPoint(get({This, hudGraphicsPosition})))),
            (get({This, '$class'})):setY(This, (fun(Target_N67338) -> (get({Target_N67338, '$class'})):getY(Target_N67338) end)((get({get({This, hudGraphicsPosition}), '$class'})):getPoint(get({This, hudGraphicsPosition}))))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'}), E)
        end,
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

getLocation(This) ->
        get({This, location}).

getDirection(This) ->
        get({This, direction}).

% throws Exception
getHudGraphicsPositionWH(This, Width, Height, MaxWidth, MaxHeight) when is_integer(Width), is_integer(Height), is_integer(MaxWidth), is_integer(MaxHeight) ->
        put({local, x}, 0),
        put({local, y}, 0),
        put({local, anchor}, 0),
        BasicHudFactory = 'BasicHudFactory':getInstance(),
        case (get({BasicHudFactory, 'BOTTOMLEFT'}) =:= (get({This, '$class'})):getLocation(This)) of
            true ->
            put({local, x}, (get({This, bufferZone}) + 2)),
            put({local, y}, ((Height - MaxHeight) - get({This, bufferZone}))),
            put({local, anchor}, (get({'Graphics', 'BOTTOM'}) band get({'Graphics', 'LEFT'})));
            false ->
            case (get({BasicHudFactory, 'BOTTOMRIGHT'}) =:= (get({This, '$class'})):getLocation(This)) of
            true ->
            put({local, x}, (Width - MaxWidth)),
            put({local, y}, ((Height - MaxHeight) - get({This, bufferZone}))),
            put({local, anchor}, (get({'Graphics', 'BOTTOM'}) band get({'Graphics', 'RIGHT'})));
            false ->
            case (get({BasicHudFactory, 'TOPLEFT'}) =:= (get({This, '$class'})):getLocation(This)) of
            true ->
            put({local, x}, (get({This, bufferZone}) + 2)),
            put({local, y}, get({This, bufferZoneY})),
            put({local, anchor}, get({'Anchor', 'TOP_LEFT'}));
            false ->
            case (get({BasicHudFactory, 'TOPRIGHT'}) =:= (get({This, '$class'})):getLocation(This)) of
            true ->
            put({local, x}, (Width - MaxWidth)),
            put({local, y}, get({This, bufferZoneY})),
            put({local, anchor}, (get({'Graphics', 'TOP'}) band get({'Graphics', 'RIGHT'})));
            false ->
            case (get({BasicHudFactory, 'TOPCENTER'}) =:= (get({This, '$class'})):getLocation(This)) of
            true ->
            put({local, x}, ((((Width - MaxWidth)) div 2))),
            put({local, y}, get({This, bufferZoneY})),
            put({local, anchor}, (get({'Graphics', 'TOP'}) band get({'Graphics', 'HCENTER'})));
            false ->
            case (get({BasicHudFactory, 'BOTTOMCENTER'}) =:= (get({This, '$class'})):getLocation(This)) of
            true ->
            put({local, x}, ((((Width - MaxWidth)) div 2))),
            put({local, y}, ((Height - MaxHeight) - get({This, bufferZone}))),
            put({local, anchor}, (get({'Graphics', 'BOTTOM'}) band get({'Graphics', 'HCENTER'})));
            false ->
            case (get({BasicHudFactory, 'ABSOLUTE'}) =:= (get({This, '$class'})):getLocation(This)) of
            true ->
            put({local, x}, MaxHeight),
            put({local, y}, MaxWidth),
            put({local, anchor}, 0);
            false -> ok
        end
        end
        end
        end
        end
        end
        end,
        'HudGraphicsPosition':new((get({This, '$class'})):getPoint(This, get({local, x}), get({local, y})), get({local, anchor})).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

getPoint(This, X, Y) when is_integer(X), is_integer(Y) ->
        (fun(Target_N69394) -> (get({Target_N69394, '$class'})):createXY(Target_N69394, X, Y) end)('PointFactory':getInstance()).

getBufferZone(This) ->
        get({This, bufferZone}).

setBufferZone(This, BufferZone) when is_integer(BufferZone) ->
        put({This, bufferZone}, BufferZone),
        case 'J2MEUtil':isHTML() of
            true ->
            put({This, bufferZoneY}, get({This, bufferZone}));
            false ->
            put({This, bufferZoneY}, (get({This, bufferZone}) + 5))
        end.

setLocation(This, Location) when is_integer(Location) ->
        put({This, location}, Location).

setDirection(This, Direction) when is_integer(Direction) ->
        put({This, direction}, Direction).

getHudGraphicsPosition(This) ->
        get({This, hudGraphicsPosition}).

getColor(This) ->
        get({This, color}).

getX(This) ->
        get({This, x}).

setX(This, X) when is_integer(X) ->
        put({This, x}, X).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor).

getBasicColorP(This) ->
        get({This, basicColor}).

setY(This, Y) when is_integer(Y) ->
        put({This, y}, Y).

getY(This) ->
        get({This, y}).

paintSSO(This, Graphics, String, String2, Offset) when (is_list(String) orelse String =:= undefined), (is_list(String2) orelse String2 =:= undefined), is_integer(Offset) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This)),
        (get({Graphics, '$class'})):drawString(Graphics, String, get({This, x}), (get({This, '$class'})):getY(This), (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))),
        (get({Graphics, '$class'})):drawString(Graphics, String2, (get({This, x}) + Offset), (get({This, '$class'})):getY(This), (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))).

paintSSOO(This, Graphics, String, String2, Offset, Offset2) when (is_list(String) orelse String =:= undefined), (is_list(String2) orelse String2 =:= undefined), is_integer(Offset), is_integer(Offset2) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({Graphics, '$class'})):setColor(Graphics, (get({This, '$class'})):getColor(This)),
        (get({Graphics, '$class'})):drawString(Graphics, String, (get({This, x}) + Offset), (get({This, '$class'})):getY(This), (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))),
        (get({Graphics, '$class'})):drawString(Graphics, String2, (get({This, x}) + Offset2), (get({This, '$class'})):getY(This), (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))).

paintDXY(This, Graphics, CharArray, Offset, Len, CharArray2, Offset2, Len2, XOffset, XOffset2) when (is_tuple(CharArray) orelse CharArray =:= undefined), is_integer(Offset), is_integer(Len), (is_tuple(CharArray2) orelse CharArray2 =:= undefined), is_integer(Offset2), is_integer(Len2), is_integer(XOffset), is_integer(XOffset2) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This)),
        Y = (get({This, '$class'})):getY(This),
        (get({Graphics, '$class'})):drawChars(Graphics, CharArray, Offset, Len, (get({This, x}) + XOffset), Y, (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))),
        (get({Graphics, '$class'})):drawChars(Graphics, CharArray2, Offset2, Len2, (get({This, x}) + XOffset2), Y, (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))).

paintDX(This, Graphics, CharArray, Offset, Len, CharArray2, Offset2, Len2, XOffset) when (is_tuple(CharArray) orelse CharArray =:= undefined), is_integer(Offset), is_integer(Len), (is_tuple(CharArray2) orelse CharArray2 =:= undefined), is_integer(Offset2), is_integer(Len2), is_integer(XOffset) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This)),
        Y = (get({This, '$class'})):getY(This),
        (get({Graphics, '$class'})):drawChars(Graphics, CharArray, Offset, Len, get({This, x}), Y, (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))),
        (get({Graphics, '$class'})):drawChars(Graphics, CharArray2, Offset2, Len2, (get({This, x}) + XOffset), Y, (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))).

paintOffsetAndLength(This, Graphics, CharArray, Offset, Len) when (is_tuple(CharArray) orelse CharArray =:= undefined), is_integer(Offset), is_integer(Len) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This)),
        Y = (get({This, '$class'})):getY(This),
        (get({Graphics, '$class'})):drawChars(Graphics, CharArray, Offset, Len, get({This, x}), Y, (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))).

paintString(This, Graphics, String) when (is_list(String) orelse String =:= undefined) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This)),
        Y = ((get({This, '$class'})):getY(This) + get({This, offsetY})),
        (get({Graphics, '$class'})):drawString(Graphics, String, get({This, x}), Y, (get({get({This, hudGraphicsPosition}), '$class'})):getAnchor(get({This, hudGraphicsPosition}))).

