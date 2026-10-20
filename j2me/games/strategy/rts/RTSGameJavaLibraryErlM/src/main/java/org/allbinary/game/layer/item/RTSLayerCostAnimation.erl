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
% import org.allbinary.game.layer.CostLayerInterfaceFactoryInterface
% import org.allbinary.game.rts.technology.event.TechEventListenerInterface
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.animation.Animation
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.math.PrimitiveLongUtil
% import org.allbinary.logic.util.event.EventStrings

-module('RTSLayerCostAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TechEventListenerInterface
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(10000)),
    put({This, 'DOLLAR'}, "$"),
    put({This, image}, undefined),
    put({This, layerInterfaceFactoryInterface}, undefined),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, costString}, get({'NullUtil':getInstance(), 'NULL_CHAR_ARRAY'})),
    put({This, len}, 0),
    put({This, adjustedCostX}, 0),
    put({This, fontHeight}, 0),
    ok.


new(Image, LayerInterfaceFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, LayerInterfaceFactoryInterface),
    This.

'$init'(This, Image, LayerInterfaceFactoryInterface) ->
    'Animation':'$init'(This),
    init_fields(This),
        put({This, image}, Image),
        put({This, layerInterfaceFactoryInterface}, LayerInterfaceFactoryInterface),
        (get({This, '$class'})):update(This).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, adjustedCostX}, (get({Font, '$class'})):stringWidth(Font, get({This, 'DOLLAR'}))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

onEvent(This, Event) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onTechEvent(This, Event) ->
        try
            (get({This, '$class'})):update(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "onTechEvent", E)
        end.

% throws Exception
update(This) ->
        put({This, len}, 0),
        put({This, costString}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), (get({get({This, layerInterfaceFactoryInterface}), '$class'})):getCost(get({This, layerInterfaceFactoryInterface})))),
        put({This, len}, (get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil}))).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        'Animation':paintXY(This, Graphics, X, Y),
        AdjustedCostY = ((get({get({This, image}), '$class'})):getHeight(get({This, image})) - get({This, fontHeight})),
        Xa = (X + 2),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'DOLLAR'}), Xa, (Y + AdjustedCostY), 0),
        (get({Graphics, '$class'})):drawChars(Graphics, get({This, costString}), 0, get({This, len}), (X + get({This, adjustedCostX})), (Y + AdjustedCostY), 0).

