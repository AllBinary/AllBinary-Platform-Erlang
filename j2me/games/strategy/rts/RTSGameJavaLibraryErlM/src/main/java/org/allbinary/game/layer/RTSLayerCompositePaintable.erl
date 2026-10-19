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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.string.StringMaker

-module('RTSLayerCompositePaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, upgradeCost}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, downGradeCost}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'UPGRADE'}, "Up: $"),
    put({This, 'DOWNGRADE'}, "Down: $-"),
    put({This, upgradableRTSLayerHudPaintable}, undefined),
    ok.


new(UpgradableRTSLayerHudPaintable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UpgradableRTSLayerHudPaintable),
    This.

init(This, UpgradableRTSLayerHudPaintable) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, upgradableRTSLayerHudPaintable}, UpgradableRTSLayerHudPaintable).

update(This, RtsLayer) ->
        case (get({RtsLayer, '$class'})):isUpgradeable(RtsLayer) of
            true ->
            (get({This, '$class'})):setUpgradeCost(This, (fun(Target_N66093) -> (get({Target_N66093, '$class'})):toString(Target_N66093) end)((fun(Target_N66100) -> (get({Target_N66100, '$class'})):appendint(Target_N66100, trunc((get({RtsLayer, '$class'})):getUpgradeCost(RtsLayer))) end)((fun(Target_N66107) -> (get({Target_N66107, '$class'})):append(Target_N66107, get({This, 'UPGRADE'})) end)('StringMaker':new()))));
            false ->
            (get({This, '$class'})):setUpgradeCost(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
        end,
        case (get({RtsLayer, '$class'})):isDowngradeable(RtsLayer) of
            true ->
            (get({This, '$class'})):setDownGradeCost(This, (fun(Target_N66256) -> (get({Target_N66256, '$class'})):toString(Target_N66256) end)((fun(Target_N66263) -> (get({Target_N66263, '$class'})):appendint(Target_N66263, trunc((get({RtsLayer, '$class'})):getDowngradeCost(RtsLayer))) end)((fun(Target_N66270) -> (get({Target_N66270, '$class'})):append(Target_N66270, get({This, 'DOWNGRADE'})) end)('StringMaker':new()))));
            false ->
            (get({This, '$class'})):setDownGradeCost(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
        end.

paint(This, Graphics) ->
        (get({Graphics, '$class'})):drawString(Graphics, (get({This, '$class'})):getDownGradeCost(This), get({get({This, upgradableRTSLayerHudPaintable}), textX}), get({get({This, upgradableRTSLayerHudPaintable}), costY1}), 0),
        (get({Graphics, '$class'})):drawString(Graphics, (get({This, '$class'})):getUpgradeCost(This), get({get({This, upgradableRTSLayerHudPaintable}), textX}), get({get({This, upgradableRTSLayerHudPaintable}), costY}), 0).

setUpgradeCost(This, UpgradeCost) when (is_list(UpgradeCost) orelse UpgradeCost =:= undefined) ->
        put({This, upgradeCost}, UpgradeCost).

getUpgradeCost(This) ->
        get({This, upgradeCost}).

setDownGradeCost(This, DownGradeCost) when (is_list(DownGradeCost) orelse DownGradeCost =:= undefined) ->
        put({This, downGradeCost}, DownGradeCost).

getDownGradeCost(This) ->
        get({This, downGradeCost}).

