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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.logic.java.character.CharArrayFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.input.motion.button.CommonButtons

-module('UpgradableRTSLayerHudPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SelectionHudPaintable', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'UpgradableRTSLayerHudPaintable':new()),
    ok.

init_fields(This) ->
    put({This, 'PERCENT'}, "%"),
    put({This, rtsLayer}, 'CollidableDestroyableDamageableLayer':getNullInstance()),
    put({This, costY}, 0),
    put({This, costY1}, 0),
    put({This, percentCompleteX2}, 0),
    put({This, rtsLayerCompositePaintableLateInit}, undefined),
    put({This, charHeight}, 0),
    put({This, charWidth}, 0),
    put({This, percentComplete}, 0),
    put({This, percentCompleteX}, 0),
    put({This, percentCompleteArray}, (fun(Target_N67141) -> (get({Target_N67141, '$class'})):getZeroCharArray(Target_N67141) end)('CharArrayFactory':getInstance())),
    put({This, currentTotalDigits}, 0),
    ok.


getInstance() ->
        get({'UpgradableRTSLayerHudPaintable', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'SelectionHudPaintable':init(This),
    init_fields(This),
        ok.

updateMeasurement(This, Graphics) ->
        'SelectionHudPaintable':updateMeasurement(This, Graphics),
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, charHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, charWidth}, 'MyFontProcessor':defaultCharWidth(Font)).

update(This) ->
        'SelectionHudPaintable':update(This),
        CommonButtons = 'CommonButtons':getInstance(),
        put({This, costY}, ((get({This, y}) + get({CommonButtons, 'STANDARD_BUTTON_SIZE'})))),
        put({This, costY1}, (((get({This, y}) + get({CommonButtons, 'STANDARD_BUTTON_SIZE'})) - get({This, charHeight})))),
        put({This, percentCompleteX2}, ((get({This, imageX}) + get({CommonButtons, 'STANDARD_BUTTON_SIZE'})) - get({This, charWidth}))),
        DisplayInfoSingleton = 'DisplayInfoSingleton':getInstance(),
        case ((get({DisplayInfoSingleton, '$class'})):getLastWidth(DisplayInfoSingleton) > 320) of
            true ->
            put({This, rtsLayerCompositePaintableLateInit}, 'UpgradableWideRTSLayerPaintable':new(This));
            false ->
            put({This, rtsLayerCompositePaintableLateInit}, 'RTSLayerCompositePaintable':new(This))
        end.

updateSelectionInfo(This) ->
        RtsLayer = (get({This, '$class'})):getRtsLayer(This),
        (get({get({This, rtsLayerCompositePaintableLateInit}), '$class'})):update(get({This, rtsLayerCompositePaintableLateInit}), RtsLayer),
        (get({This, '$class'})):setAnimationInterface(This, (get({RtsLayer, '$class'})):getVerticleBuildAnimationInterface(RtsLayer)),
        (get({This, '$class'})):setName(This, (get({RtsLayer, '$class'})):getName(RtsLayer)).

updateInfo(This) ->
        RtsLayer = (get({This, '$class'})):getRtsLayer(This),
        put({This, percentComplete}, (get({RtsLayer, '$class'})):getPercentComplete(RtsLayer)),
        case (get({This, percentComplete}) < 10) of
            true ->
            put({This, percentCompleteX}, 32);
            false ->
            case (get({This, percentComplete}) < 100) of
            true ->
            put({This, percentCompleteX}, 24);
            false ->
            put({This, percentCompleteX}, 16)
        end
        end,
        put({This, percentCompleteArray}, (fun(Target_N67467) -> (get({Target_N67467, '$class'})):getCharArray(Target_N67467, get({This, percentComplete})) end)((get({This, '$class'})):getPrimitiveLongUtil(This))),
        put({This, currentTotalDigits}, (fun(Target_N67520) -> (get({Target_N67520, '$class'})):getCurrentTotalDigits(Target_N67520) end)((get({This, '$class'})):getPrimitiveLongUtil(This))).

paint(This, Graphics) ->
        'SelectionHudPaintable':paint(This, Graphics),
        (get({get({This, rtsLayerCompositePaintableLateInit}), '$class'})):paint(get({This, rtsLayerCompositePaintableLateInit}), Graphics),
        (get({Graphics, '$class'})):drawChars(Graphics, get({This, percentCompleteArray}), 0, get({This, currentTotalDigits}), (get({This, imageX}) + get({This, percentCompleteX})), get({This, costY}), 0),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'PERCENT'}), get({This, percentCompleteX2}), get({This, costY}), 0),
        (fun(Target_N67799) -> (get({Target_N67799, '$class'})):paintXY(Target_N67799, Graphics, get({This, imageX}), get({This, y})) end)((get({This, '$class'})):getAnimationInterface(This)).

setRtsLayer(This, RtsLayer) ->
        put({This, rtsLayer}, RtsLayer).

getRtsLayer(This) ->
        get({This, rtsLayer}).

