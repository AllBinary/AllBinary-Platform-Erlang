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
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('UpgradableWideRTSLayerPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSLayerCompositePaintable', Function, Arguments).

init_fields(This) ->
    put({This, cost}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(UpgradableRTSLayerHudPaintable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UpgradableRTSLayerHudPaintable),
    This.

'$init'(This, UpgradableRTSLayerHudPaintable) ->
        'RTSLayerCompositePaintable':'$init'(This, UpgradableRTSLayerHudPaintable),
        init_fields(This).

update(This, RtsLayer) ->
        'RTSLayerCompositePaintable':update(This, RtsLayer),
        (get({This, '$class'})):setCost(This, (fun(Target_N65865) -> (get({Target_N65865, '$class'})):toString(Target_N65865) end)((fun(Target_N65872) -> (get({Target_N65872, '$class'})):append(Target_N65872, (get({This, '$class'})):getDownGradeCost(This)) end)((fun(Target_N65879) -> (get({Target_N65879, '$class'})):append(Target_N65879, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N65886) -> (get({Target_N65886, '$class'})):append(Target_N65886, (get({This, '$class'})):getUpgradeCost(This)) end)('StringMaker':new()))))).

paint(This, Graphics) ->
        (get({Graphics, '$class'})):drawString(Graphics, (get({This, '$class'})):getCost(This), get({get({This, upgradableRTSLayerHudPaintable}), textX}), get({get({This, upgradableRTSLayerHudPaintable}), costY}), 0).

setCost(This, Cost) when (is_list(Cost) orelse Cost =:= undefined) ->
        put({This, cost}, Cost).

getCost(This) ->
        get({This, cost}).

