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
% import org.allbinary.game.identification.GroupCommonFactory
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.game.GameInfo
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.part.PartInterface
% import org.allbinary.game.part.weapon.BasicWeaponPart
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap
% import org.allbinary.util.ABHashtable

-module('RTSLayerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'RTSLayerUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, groupCommonFactory}, 'GroupCommonFactory':getInstance()),
    put({This, 'MAX_RELOAD_TIME'}, (trunc(get({'Integer', 'MAX_VALUE'})) div 100000)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'RTSLayerUtil', instance}).

createWeaponProperties(This, WeaponProperties, CurrentLevel, LastLevel) when is_integer(CurrentLevel), is_integer(LastLevel) ->
        put({local, reloadTime}, (get({WeaponProperties, '$class'})):getReloadTime(WeaponProperties)),
        case (LastLevel > CurrentLevel) of
            true ->
            put({local, reloadTime}, (get({local, reloadTime}) + 50));
            false ->
            case (LastLevel < CurrentLevel) of
            true ->
            put({local, reloadTime}, (get({local, reloadTime}) - 50));
            false -> ok
        end
        end,
        NewWeaponProperties = 'WeaponProperties':new(get({local, reloadTime}), (get({WeaponProperties, '$class'})):getTargetingTime(WeaponProperties), (fun(Target_N66456) -> (get({Target_N66456, '$class'})):getUnscaled(Target_N66456) end)((get({WeaponProperties, '$class'})):getSpeed(WeaponProperties)), (((get({WeaponProperties, '$class'})):getDamage(WeaponProperties) / LastLevel) * CurrentLevel), (get({WeaponProperties, '$class'})):getDissipation(WeaponProperties)),
        NewWeaponProperties.

downgrade(This, RtsLayer) ->
        (get({RtsLayer, '$class'})):setLevel(RtsLayer, ((get({RtsLayer, '$class'})):getLevel(RtsLayer) - 1)),
        PartInterfaceArray = (get({RtsLayer, '$class'})):getPartInterfaceArray(RtsLayer),
        Size = array:size(PartInterfaceArray),
        put({local, partInterface}, undefined),
        put({local, index}, Size),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, partInterface}, array:get(get({local, index}), PartInterfaceArray)),
            (get({get({local, partInterface}), '$class'})):setWeaponProperties(get({local, partInterface}), (get({This, '$class'})):createWeaponProperties(This, (get({get({local, partInterface}), '$class'})):getWeaponProperties(get({local, partInterface})), (get({RtsLayer, '$class'})):getLevel(RtsLayer), ((get({RtsLayer, '$class'})):getLevel(RtsLayer) + 1))),
            Loop();
        false -> ok end end)(),
        (get({RtsLayer, '$class'})):select(RtsLayer).

upgrade(This, RtsLayer) ->
        (get({RtsLayer, '$class'})):setLevel(RtsLayer, ((get({RtsLayer, '$class'})):getLevel(RtsLayer) + 1)),
        PartInterfaceArray = (get({RtsLayer, '$class'})):getPartInterfaceArray(RtsLayer),
        Size = array:size(PartInterfaceArray),
        put({local, partInterface}, undefined),
        put({local, index}, Size),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, partInterface}, array:get(get({local, index}), PartInterfaceArray)),
            (get({get({local, partInterface}), '$class'})):setWeaponProperties(get({local, partInterface}), (get({This, '$class'})):createWeaponProperties(This, (get({get({local, partInterface}), '$class'})):getWeaponProperties(get({local, partInterface})), (get({RtsLayer, '$class'})):getLevel(RtsLayer), ((get({RtsLayer, '$class'})):getLevel(RtsLayer) - 1))),
            Loop();
        false -> ok end end)(),
        (get({RtsLayer, '$class'})):select(RtsLayer).

getCostExponential(This, Cost) when is_integer(Cost) ->
        (((((Cost * Cost) * Cost)) div ((Cost * 1000)))).

getWeaponPropertiesCost(This, WeaponProperties) ->
        put({local, cost}, ((((get({WeaponProperties, '$class'})):getDamage(WeaponProperties) + (get({WeaponProperties, '$class'})):getRange(WeaponProperties)) + ((((get({This, 'MAX_RELOAD_TIME'}) / (get({WeaponProperties, '$class'})):getReloadTime(WeaponProperties))) bsr 1))))),
        put({local, cost}, (get({This, '$class'})):getCostExponential(This, get({local, cost}))),
        get({local, cost}).

getCost(This, RtsLayer) ->
        put({local, total}, 0),
        PartInterfaceArray = (get({RtsLayer, '$class'})):getPartInterfaceArray(RtsLayer),
        Size = array:size(PartInterfaceArray),
        put({local, partInterface}, undefined),
        put({local, weaponProperties}, undefined),
        lists:foreach(fun(Index) ->
            put({local, partInterface}, array:get(Index, PartInterfaceArray)),
            put({local, weaponProperties}, (get({get({local, partInterface}), '$class'})):getWeaponProperties(get({local, partInterface}))),
            put({local, total}, (get({local, total}) + (get({This, '$class'})):getWeaponPropertiesCost(This, get({local, weaponProperties}))))
        end, lists:seq((Size - 1), 0, -1)),
        get({local, total}).

getDowngradeCost(This, RtsLayer) ->
        PartInterfaceArray = (get({RtsLayer, '$class'})):getPartInterfaceArray(RtsLayer),
        Size = array:size(PartInterfaceArray),
        put({local, downgradeCost}, 0),
        put({local, partInterface}, undefined),
        put({local, weaponProperties}, undefined),
        put({local, downgradeWeaponCost}, 0),
        put({local, currentWeaponCost}, 0),
        lists:foreach(fun(Index) ->
            put({local, partInterface}, array:get(Index, PartInterfaceArray)),
            put({local, weaponProperties}, (get({get({local, partInterface}), '$class'})):getWeaponProperties(get({local, partInterface}))),
            put({local, downgradeWeaponCost}, (get({This, '$class'})):getWeaponPropertiesCost(This, (get({This, '$class'})):createWeaponProperties(This, get({local, weaponProperties}), ((get({RtsLayer, '$class'})):getLevel(RtsLayer) - 1), (get({RtsLayer, '$class'})):getLevel(RtsLayer)))),
            put({local, currentWeaponCost}, (get({This, '$class'})):getWeaponPropertiesCost(This, get({local, weaponProperties}))),
            put({local, downgradeCost}, (get({local, downgradeCost}) + ((get({local, currentWeaponCost}) - get({local, downgradeWeaponCost})))))
        end, lists:seq((Size - 1), 0, -1)),
        put({local, downgradeCost}, ((get({local, downgradeCost}) * 9) div 10)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69089) -> (get({Target_N69089, '$class'})):toString(Target_N69089) end)((fun(Target_N69096) -> (get({Target_N69096, '$class'})):appendint(Target_N69096, get({local, downgradeCost})) end)((fun(Target_N69103) -> (get({Target_N69103, '$class'})):append(Target_N69103, "Total Cost: ") end)('StringMaker':new()))), This, "getDowngradeCost"),
        get({local, downgradeCost}).

getUpgradeCost(This, RtsLayer) ->
        put({local, upgradeCost}, 0),
        PartInterfaceArray = (get({RtsLayer, '$class'})):getPartInterfaceArray(RtsLayer),
        Size = array:size(PartInterfaceArray),
        put({local, partInterface}, undefined),
        put({local, weaponProperties}, undefined),
        put({local, upgradedWeaponCost}, 0),
        put({local, currentWeaponCost}, 0),
        lists:foreach(fun(Index) ->
            put({local, partInterface}, array:get(Index, PartInterfaceArray)),
            put({local, weaponProperties}, (get({get({local, partInterface}), '$class'})):getWeaponProperties(get({local, partInterface}))),
            put({local, upgradedWeaponCost}, (get({This, '$class'})):getWeaponPropertiesCost(This, (get({This, '$class'})):createWeaponProperties(This, get({local, weaponProperties}), ((get({RtsLayer, '$class'})):getLevel(RtsLayer) + 1), (get({RtsLayer, '$class'})):getLevel(RtsLayer)))),
            put({local, currentWeaponCost}, (get({This, '$class'})):getWeaponPropertiesCost(This, get({local, weaponProperties}))),
            put({local, upgradeCost}, (get({local, upgradeCost}) + ((get({local, upgradedWeaponCost}) - get({local, currentWeaponCost})))))
        end, lists:seq((Size - 1), 0, -1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69809) -> (get({Target_N69809, '$class'})):toString(Target_N69809) end)((fun(Target_N69816) -> (get({Target_N69816, '$class'})):appendint(Target_N69816, get({local, upgradeCost})) end)((fun(Target_N69823) -> (get({Target_N69823, '$class'})):append(Target_N69823, "Total Cost: ") end)('StringMaker':new()))), This, "getUpgradeCost"),
        get({local, upgradeCost}).

% throws Exception
destroyAndClear(This, List) ->
        put({local, rtsLayer}, undefined),
        lists:foreach(fun(Index) ->
            put({local, rtsLayer}, (get({List, '$class'})):get(List, Index)),
            (get({get({local, rtsLayer}), '$class'})):setDestroyed(get({local, rtsLayer}), true)
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
        (get({List, '$class'})):clear(List).

createFakeRTSLayerHashtable(This, BaseRaceTrackGeographicMap) ->
        Hashtable = (fun(Target_N70237) -> (get({Target_N70237, '$class'})):createHashtable(Target_N70237) end)('StdUtil':getInstance()),
        LayerManager = 'FakeLayerManager':new(get({'GameInfo', 'NONE'})),
        (get({LayerManager, '$class'})):setGeographicMapInterface(LayerManager, array:from_list([BaseRaceTrackGeographicMap])),
        (get({Hashtable, '$class'})):put(Hashtable, get({'AllBinaryGameLayerManager', 'ID'}), LayerManager),
        (get({Hashtable, '$class'})):put(Hashtable, get({'DirectionFactory':getInstance(), 'NAME'}), get({'DirectionFactory':getInstance(), 'LEFT'})),
        (get({Hashtable, '$class'})):put(Hashtable, get({get({This, groupCommonFactory}), 'ID'}), get({'BasicGroupFactory':getInstance(), 'NONE_ARRAY'})),
        Hashtable.

