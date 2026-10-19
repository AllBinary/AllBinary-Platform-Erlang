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
% package org.allbinary.game.layer
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('AdvancedPlayerOwnedRTSLayers').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerOwnedRTSLayers', Function, Arguments).

init_fields(This) ->
    put({This, unitsList}, 'BasicArrayListD':new()),
    put({This, waypointsList}, 'BasicArrayListD':new()),
    put({This, buildingList}, 'BasicArrayListD':new()),
    put({This, baseList}, 'BasicArrayListD':new()),
    put({This, garrisonList}, 'BasicArrayListD':new()),
    put({This, houseList}, 'BasicArrayListD':new()),
    put({This, labList}, 'BasicArrayListD':new()),
    put({This, factoryList}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'PlayerOwnedRTSLayers':init(This),
    init_fields(This).


addUnit(This, RtsLayer) ->
        (get({get({This, unitsList}), '$class'})):add(get({This, unitsList}), RtsLayer),
        (get({get({This, rtsLayerList}), '$class'})):add(get({This, rtsLayerList}), RtsLayer).

addWaypoint(This, RtsLayer) ->
        (get({get({This, waypointsList}), '$class'})):add(get({This, waypointsList}), RtsLayer),
        (get({get({This, rtsLayerList}), '$class'})):add(get({This, rtsLayerList}), RtsLayer).

addBase(This, RtsLayer) ->
        (get({get({This, baseList}), '$class'})):add(get({This, baseList}), RtsLayer),
        (get({get({This, buildingList}), '$class'})):add(get({This, buildingList}), RtsLayer),
        (get({get({This, rtsLayerList}), '$class'})):add(get({This, rtsLayerList}), RtsLayer).

addGarrison(This, RtsLayer) ->
        (get({get({This, garrisonList}), '$class'})):add(get({This, garrisonList}), RtsLayer),
        (get({get({This, buildingList}), '$class'})):add(get({This, buildingList}), RtsLayer),
        (get({get({This, rtsLayerList}), '$class'})):add(get({This, rtsLayerList}), RtsLayer).

addHouse(This, RtsLayer) ->
        (get({get({This, houseList}), '$class'})):add(get({This, houseList}), RtsLayer),
        (get({get({This, buildingList}), '$class'})):add(get({This, buildingList}), RtsLayer),
        (get({get({This, rtsLayerList}), '$class'})):add(get({This, rtsLayerList}), RtsLayer).

addLab(This, RtsLayer) ->
        (get({get({This, labList}), '$class'})):add(get({This, labList}), RtsLayer),
        (get({get({This, buildingList}), '$class'})):add(get({This, buildingList}), RtsLayer),
        (get({get({This, rtsLayerList}), '$class'})):add(get({This, rtsLayerList}), RtsLayer).

addFactory(This, RtsLayer) ->
        (get({get({This, factoryList}), '$class'})):add(get({This, factoryList}), RtsLayer),
        (get({get({This, buildingList}), '$class'})):add(get({This, buildingList}), RtsLayer),
        (get({get({This, rtsLayerList}), '$class'})):add(get({This, rtsLayerList}), RtsLayer).

removeUnit(This, GameLayer) ->
        (get({get({This, unitsList}), '$class'})):remove(get({This, unitsList}), GameLayer),
        (get({get({This, rtsLayerList}), '$class'})):remove(get({This, rtsLayerList}), GameLayer).

removeWaypoint(This, GameLayer) ->
        (get({get({This, waypointsList}), '$class'})):remove(get({This, waypointsList}), GameLayer),
        (get({get({This, rtsLayerList}), '$class'})):remove(get({This, rtsLayerList}), GameLayer).

getUnitsList(This) ->
        get({This, unitsList}).

getWaypointsList(This) ->
        get({This, waypointsList}).

getBaseList(This) ->
        get({This, baseList}).

getGarrisonList(This) ->
        get({This, garrisonList}).

getHouseList(This) ->
        get({This, houseList}).

getLabList(This) ->
        get({This, labList}).

getFactoryList(This) ->
        get({This, factoryList}).

getTotalBuildings(This) ->
        (((((get({get({This, baseList}), '$class'})):size(get({This, baseList})) + (get({get({This, garrisonList}), '$class'})):size(get({This, garrisonList}))) + (get({get({This, houseList}), '$class'})):size(get({This, houseList}))) + (get({get({This, labList}), '$class'})):size(get({This, labList}))) + (get({get({This, factoryList}), '$class'})):size(get({This, factoryList}))).

removeBuilding(This, LayerInterface) ->
        (get({get({This, buildingList}), '$class'})):add(get({This, buildingList}), LayerInterface),
        case (fun(Target_N67766) -> (get({Target_N67766, '$class'})):remove(Target_N67766, LayerInterface) end)((get({This, '$class'})):getBaseList(This)) of
            true ->
            (get({get({This, rtsLayerList}), '$class'})):remove(get({This, rtsLayerList}), LayerInterface);
            false ->
            case (fun(Target_N67799) -> (get({Target_N67799, '$class'})):remove(Target_N67799, LayerInterface) end)((get({This, '$class'})):getFactoryList(This)) of
            true ->
            (get({get({This, rtsLayerList}), '$class'})):remove(get({This, rtsLayerList}), LayerInterface);
            false ->
            case (fun(Target_N67832) -> (get({Target_N67832, '$class'})):remove(Target_N67832, LayerInterface) end)((get({This, '$class'})):getGarrisonList(This)) of
            true ->
            (get({get({This, rtsLayerList}), '$class'})):remove(get({This, rtsLayerList}), LayerInterface);
            false ->
            case (fun(Target_N67865) -> (get({Target_N67865, '$class'})):remove(Target_N67865, LayerInterface) end)((get({This, '$class'})):getLabList(This)) of
            true ->
            (get({get({This, rtsLayerList}), '$class'})):remove(get({This, rtsLayerList}), LayerInterface);
            false ->
            case (fun(Target_N67898) -> (get({Target_N67898, '$class'})):remove(Target_N67898, LayerInterface) end)((get({This, '$class'})):getHouseList(This)) of
            true ->
            (get({get({This, rtsLayerList}), '$class'})):remove(get({This, rtsLayerList}), LayerInterface);
            false -> ok
        end
        end
        end
        end
        end.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'PlayerOwnedRTSLayers':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Bases: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (fun(Target_N68314) -> (get({Target_N68314, '$class'})):size(Target_N68314) end)((get({This, '$class'})):getBaseList(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Factory: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (fun(Target_N68383) -> (get({Target_N68383, '$class'})):size(Target_N68383) end)((get({This, '$class'})):getFactoryList(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Garrison: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (fun(Target_N68452) -> (get({Target_N68452, '$class'})):size(Target_N68452) end)((get({This, '$class'})):getGarrisonList(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Labs: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (fun(Target_N68521) -> (get({Target_N68521, '$class'})):size(Target_N68521) end)((get({This, '$class'})):getLabList(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Houses: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (fun(Target_N68590) -> (get({Target_N68590, '$class'})):size(Target_N68590) end)((get({This, '$class'})):getHouseList(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Waypoints: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (fun(Target_N68659) -> (get({Target_N68659, '$class'})):size(Target_N68659) end)((get({This, '$class'})):getWaypointsList(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Units: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (fun(Target_N68728) -> (get({Target_N68728, '$class'})):size(Target_N68728) end)((get({This, '$class'})):getUnitsList(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getBuildingList(This) ->
        get({This, buildingList}).

