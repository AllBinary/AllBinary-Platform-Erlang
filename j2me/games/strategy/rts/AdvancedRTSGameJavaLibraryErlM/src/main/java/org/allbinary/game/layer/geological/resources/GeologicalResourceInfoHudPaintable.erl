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
% package org.allbinary.game.layer.geological.resources
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.waypoint.WaypointInfoHudPaintable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.graphics.draw.KeyValueDrawCharArray

-module('GeologicalResourceInfoHudPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointInfoHudPaintable', Function, Arguments).

static_init() ->
    put({?MODULE, 'RESOURCES'}, "Resources: "),
    ok.

init_fields(This) ->
    put({This, keyvalueDrawString}, undefined),
    put({This, fontHeight}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'WaypointInfoHudPaintable':init(This),
    init_fields(This),
        put({This, keyvalueDrawString}, 'KeyValueDrawCharArray':new(get({'GeologicalResourceInfoHudPaintable', 'RESOURCES'}), get({This, textX}))).

updateMeasurement(This, Graphics) ->
        'WaypointInfoHudPaintable':updateMeasurement(This, Graphics),
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, ((2 * (get({Font, '$class'})):getHeight(Font)))).

updateSelectionInfo(This) ->
        'WaypointInfoHudPaintable':updateSelectionInfo(This),
        RtsLayer = get({This, rtsLayerP}),
        List = (get({get({RtsLayer, geographicMapCellPositionAreaBase}), '$class'})):getOccupyingGeographicMapCellPositionList(get({RtsLayer, geographicMapCellPositionAreaBase})),
        put({local, total}, 0),
        put({local, index}, (get({List, '$class'})):size(List)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            GeographicMapCellPosition = (get({List, '$class'})):get(List, get({local, index})),
            put({local, total}, (get({local, total}) + (fun(Target_N66414) -> (get({Target_N66414, '$class'})):getTotal(Target_N66414) end)((get({GeographicMapCellPosition, '$class'})):getGeologicalResource(GeographicMapCellPosition)))),
            Loop();
        false -> ok end end)(),
        (get({get({This, keyvalueDrawString}), '$class'})):update(get({This, keyvalueDrawString}), (fun(Target_N66526) -> (get({Target_N66526, '$class'})):getCharArray(Target_N66526, get({local, total})) end)((get({This, '$class'})):getPrimitiveLongUtil(This)), (fun(Target_N66556) -> (get({Target_N66556, '$class'})):getCurrentTotalDigits(Target_N66556) end)((get({This, '$class'})):getPrimitiveLongUtil(This))).

paint(This, Graphics) ->
        'WaypointInfoHudPaintable':paint(This, Graphics),
        (get({get({This, keyvalueDrawString}), '$class'})):paint(get({This, keyvalueDrawString}), Graphics, ((get({This, y}) + get({This, fontHeight})))).

