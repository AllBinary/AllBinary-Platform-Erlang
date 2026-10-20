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
% package org.allbinary.game.part
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.layer.AllBinaryLayer

-module('CountedLayersHudPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PaintableInterface
% implements UpdateMyFontInterface

static_init() ->
    put({?MODULE, 'XXStringWidth'}, 0),
    ok.

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, partInterfaceArray}, undefined),
    put({This, countedTotalStringColor}, 0),
    put({This, countedPartsBorder}, 0),
    put({This, startIndex}, 0),
    put({This, dropSize}, 0),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, height}, 0),
    ok.


new(PartInterfaceArray, DropSize, StartIndex, CountedTotalStringColor, CountedPartsBorder) when (is_tuple(PartInterfaceArray) orelse PartInterfaceArray =:= undefined), is_integer(DropSize), is_integer(StartIndex), is_integer(CountedTotalStringColor), is_integer(CountedPartsBorder) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PartInterfaceArray, DropSize, StartIndex, CountedTotalStringColor, CountedPartsBorder),
    This.

'$init'(This, PartInterfaceArray, DropSize, StartIndex, CountedTotalStringColor, CountedPartsBorder) when (is_tuple(PartInterfaceArray) orelse PartInterfaceArray =:= undefined), is_integer(DropSize), is_integer(StartIndex), is_integer(CountedTotalStringColor), is_integer(CountedPartsBorder) ->
    init_fields(This),
        put({This, partInterfaceArray}, PartInterfaceArray),
        put({This, startIndex}, StartIndex),
        put({This, countedTotalStringColor}, CountedTotalStringColor),
        put({This, countedPartsBorder}, CountedPartsBorder),
        put({This, dropSize}, DropSize).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, height}, (get({Font, '$class'})):getHeight(Font)),
        case (get({This, dropSize}) > (get({Font, '$class'})):getHeight(Font)) of
            true ->
            put({This, height}, get({This, dropSize}));
            false -> ok
        end,
        case (get({'CountedLayersHudPaintable', 'XXStringWidth'}) =:= 0) of
            true ->
            XXString = "XX",
            put({'CountedLayersHudPaintable', 'XXStringWidth'}, (get({Font, '$class'})):stringWidth(Font, XXString));
            false -> ok
        end,
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        LastWidth = (get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton})),
        WidthEdge = (LastWidth - get({This, dropSize})),
        Size = array:size(get({This, partInterfaceArray})),
        put({local, count}, 0),
        put({local, y}, 0),
        put({local, countedLayerInterfaceFactory}, undefined),
        put({local, pickedUpLayerInterfaceFactoryInterface}, undefined),
        put({local, layerInterface}, undefined),
        put({local, charArray}, undefined),
        lists:foreach(fun(Index) ->
            put({local, countedLayerInterfaceFactory}, array:get(Index, get({This, partInterfaceArray}))),
            case ((get({get({local, countedLayerInterfaceFactory}), '$class'})):getTotal(get({local, countedLayerInterfaceFactory})) > 0) of
                true ->
                put({local, pickedUpLayerInterfaceFactoryInterface}, (get({get({local, countedLayerInterfaceFactory}), '$class'})):getCountedPickedUpLayerInterfaceFactory(get({local, countedLayerInterfaceFactory}))),
                put({local, layerInterface}, (get({get({local, pickedUpLayerInterfaceFactoryInterface}), '$class'})):getIconLayer(get({local, pickedUpLayerInterfaceFactoryInterface}))),
                put({local, y}, (40 + ((get({local, count}) * get({This, height}))))),
                (get({get({local, layerInterface}), '$class'})):setPosition(get({local, layerInterface}), WidthEdge, get({local, y}), (get({get({local, layerInterface}), '$class'})):getZP(get({local, layerInterface}))),
                (get({get({local, layerInterface}), '$class'})):paint(get({local, layerInterface}), Graphics),
                (get({Graphics, '$class'})):setColor(Graphics, get({This, countedTotalStringColor})),
                (get({get({local, countedLayerInterfaceFactory}), '$class'})):paint(get({local, countedLayerInterfaceFactory}), Graphics),
                put({local, charArray}, (get({get({local, countedLayerInterfaceFactory}), '$class'})):getTotalString(get({local, countedLayerInterfaceFactory}))),
                (get({Graphics, '$class'})):drawChars(Graphics, get({local, charArray}), 0, array:size(get({local, charArray})), (WidthEdge - (get({get({local, countedLayerInterfaceFactory}), '$class'})):getXOffset(get({local, countedLayerInterfaceFactory}))), get({local, y}), 0),
                put({local, count}, get({local, count}) + 1);
                false -> ok
            end
        end, lists:seq(get({This, startIndex}), Size - 1)),
        case (get({local, count}) > 0) of
            true ->
            (get({Graphics, '$class'})):setColor(Graphics, get({This, countedPartsBorder})),
            (get({Graphics, '$class'})):drawRect(Graphics, (LastWidth - ((get({'CountedLayersHudPaintable', 'XXStringWidth'}) + get({This, dropSize})))), 40, (get({'CountedLayersHudPaintable', 'XXStringWidth'}) + get({This, dropSize})), (((get({local, count}) * get({This, height}))) + 3));
            false -> ok
        end.

paintThreed(This, Graphics) ->
        ok.

