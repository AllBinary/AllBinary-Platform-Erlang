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
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.geological.resources.GeologicalGeographicMapCellPosition
% import org.allbinary.game.layer.geological.resources.GeologicalResource
% import org.allbinary.game.layer.unit.UnitLayer
% import org.allbinary.game.layer.unit.UnitWaypointBehavior
% import org.allbinary.media.audio.WorkSound
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.math.SmallIntegerSingletonFactory

-module('WorkWaypoint').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Waypoint', Function, Arguments).

static_init() ->
    put({?MODULE, 'ID'}, (fun(Target_N65925) -> (get({Target_N65925, '$class'})):getAt(Target_N65925, 25) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    ok.


new(OwnerLayer) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OwnerLayer),
    This.

init(This, OwnerLayer) ->
        'Waypoint':init(This, OwnerLayer, 'WorkSound':getInstance()).

% throws Exception
visit(This, UnitLayer) ->
        try
        case (array:get(0, (get({UnitLayer, '$class'})):getGroupInterface(UnitLayer)) =/= array:get(0, (get({get({This, ownerLayer}), '$class'})):getGroupInterface(get({This, ownerLayer})))) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        Size = (fun(Target_N66163) -> (get({Target_N66163, '$class'})):size(Target_N66163) end)((get({This, '$class'})):getConnectedWaypointList(This)),
        case (Size > 0) of
            true ->
            OccupyList = (fun(Target_N66237) -> (get({Target_N66237, '$class'})):getOccupyingGeographicMapCellPositionList(Target_N66237) end)((get({get({This, ownerLayer}), '$class'})):getGeographicMapCellPositionArea(get({This, ownerLayer}))),
            put({local, outOfResources}, true),
            put({local, geologicalGeographicMapCellPosition}, undefined),
            put({local, geologicalResource}, undefined),
            put({local, index}, (get({OccupyList, '$class'})):size(OccupyList)),
            (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
                put({local, geologicalGeographicMapCellPosition}, (get({OccupyList, '$class'})):get(OccupyList, get({local, index}))),
                put({local, geologicalResource}, (get({get({local, geologicalGeographicMapCellPosition}), '$class'})):getGeologicalResource(get({local, geologicalGeographicMapCellPosition}))),
                case ((get({get({local, geologicalResource}), '$class'})):getTotal(get({local, geologicalResource})) >= 1) of
                    true ->
                    put({local, outOfResources}, false),
                    MaxResourceLoad = trunc((get({UnitLayer, '$class'})):getMaxResourceLoad(UnitLayer)),
                    (get({get({local, geologicalResource}), '$class'})):remove(get({local, geologicalResource}), MaxResourceLoad),
                    (get({UnitLayer, '$class'})):setLoad(UnitLayer, MaxResourceLoad);
                    false -> ok
                end,
                Loop();
            false -> ok end end)(),
            WaypointInfoHudPaintable = (get({get({This, ownerLayer}), '$class'})):getHudPaintable(get({This, ownerLayer})),
            case (get({This, ownerLayer}) =:= (get({WaypointInfoHudPaintable, '$class'})):getRtsLayer(WaypointInfoHudPaintable)) of
                true ->
                (get({WaypointInfoHudPaintable, '$class'})):updateSelectionInfo(WaypointInfoHudPaintable);
                false -> ok
            end,
            case (not get({local, outOfResources})) of
                true ->
                UnitWaypointBehavior = (get({UnitLayer, '$class'})):getWaypointBehavior(UnitLayer),
                put({local, rtsLayer}, undefined),
                (fun Loop() -> case ((fun(Target_N67127) -> (get({Target_N67127, '$class'})):size(Target_N67127) end)((get({This, '$class'})):getConnectedWaypointList(This)) > 0) of true ->
                    put({local, rtsLayer}, (fun(Target_N66978) -> (get({Target_N66978, '$class'})):get(Target_N66978, 0) end)((get({This, '$class'})):getConnectedWaypointList(This))),
                    case (get({get({local, rtsLayer}), '$class'})):isDestroyed(get({local, rtsLayer})) of
                        true ->
                        (fun(Target_N67087) -> (get({Target_N67087, '$class'})):remove(Target_N67087, get({local, rtsLayer})) end)((get({This, '$class'})):getConnectedWaypointList(This));
                        false ->
                        (get({UnitWaypointBehavior, '$class'})):insertWaypoint(UnitWaypointBehavior, 0, get({local, rtsLayer})),
                        throw('$break')
                    end,
                    Loop();
                false -> ok end end)();
                false -> ok
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getType(This) ->
        2.

