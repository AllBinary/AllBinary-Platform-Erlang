% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.waypoint
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.layer.NullPathFindingLayer
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.SelectionHudPaintable
% import org.allbinary.graphics.draw.KeyValueDrawString

-module('WaypointInfoHudPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SelectionHudPaintable', Function, Arguments).

init_fields(This) ->
    put({This, keyvalueDrawString}, undefined),
    put({This, rtsLayerP}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    put({This, textLine2Y}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'SelectionHudPaintable':init(This),
    init_fields(This),
        put({This, keyvalueDrawString}, 'KeyValueDrawString':new("Owner: ", get({This, textX}))).

updateMeasurement(This, Graphics) ->
        'SelectionHudPaintable':updateMeasurement(This, Graphics),
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, textLine2Y}, ((get({This, y}) + (get({Font, '$class'})):getHeight(Font)))).

updateSelectionInfo(This) ->
        RtsLayer = get({This, rtsLayerP}),
        (get({This, '$class'})):setName(This, (get({RtsLayer, '$class'})):getName(RtsLayer)),
        (get({This, '$class'})):setAnimationInterface(This, (get({RtsLayer, '$class'})):getVerticleBuildAnimationInterface(RtsLayer)),
        (get({get({This, keyvalueDrawString}), '$class'})):update(get({This, keyvalueDrawString}), (fun(Target_N66340) -> (get({Target_N66340, '$class'})):getName(Target_N66340) end)((get({RtsLayer, '$class'})):getParentLayer(RtsLayer))).

setRtsLayer(This, RtsLayer) ->
        put({This, rtsLayerP}, RtsLayer).

getRtsLayer(This) ->
        get({This, rtsLayerP}).

paint(This, Graphics) ->
        'SelectionHudPaintable':paint(This, Graphics),
        (get({get({This, keyvalueDrawString}), '$class'})):paint(get({This, keyvalueDrawString}), Graphics, get({This, textLine2Y})),
        (fun(Target_N66595) -> (get({Target_N66595, '$class'})):paintXY(Target_N66595, Graphics, get({This, imageX}), get({This, y})) end)((get({This, '$class'})):getAnimationInterface(This)).

