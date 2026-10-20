% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.game.layer.building
% import org.allbinary.game.combat.damage.DamageFloaters
% import org.allbinary.game.combat.damage.PtsDamageFloaters
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.game.health.HealthBar
% import org.allbinary.game.health.HealthBarTwodAnimation
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('BuildingPropertiesFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BuildingPropertiesFactory':new()),
    ok.

init_fields(This) ->
    put({This, damageFloatersPaintableInterface}, 'NullPaintable':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BuildingPropertiesFactory', instance}).

getEfficiencyPerLevel(This, BuildingLayer) ->
        ((10000 / (get({BuildingLayer, '$class'})):getMaxLevel(BuildingLayer)) + (10000 rem (get({BuildingLayer, '$class'})):getMaxLevel(BuildingLayer))).

getDamageFloaters(This, BuildingLayer) ->
        put({local, damageFloaters}, 'DamageFloaters':getInstance()),
        case (fun(Target_N66312) -> (get({Target_N66312, '$class'})):isFeature(Target_N66312, get({'GameFeatureFactory':getInstance(), 'DAMAGE_FLOATERS'})) end)('Features':getInstance()) of
            true ->
            put({local, damageFloaters}, 'PtsDamageFloaters':new(BuildingLayer)),
            put({This, damageFloatersPaintableInterface}, get({local, damageFloaters}));
            false ->
            put({local, damageFloaters}, 'DamageFloaters':new())
        end,
        get({local, damageFloaters}).

% throws Exception
getHealthBar(This, BuildingLayer) ->
        put({local, healthBar}, 'NullPaintable':getInstance()),
        case (fun(Target_N66590) -> (get({Target_N66590, '$class'})):isFeature(Target_N66590, get({'GameFeatureFactory':getInstance(), 'HEALTH_BARS'})) end)('Features':getInstance()) of
            true ->
            put({local, healthBar}, 'HealthBar':new(BuildingLayer, (get({BuildingLayer, '$class'})):getHealthInterface(BuildingLayer), 'HealthBarTwodAnimation':new(BuildingLayer, get({'BasicHudFactory':getInstance(), 'BOTTOMLEFT'})), (-1)));
            false -> ok
        end,
        get({local, healthBar}).

getHashtable(This) ->
        (fun(Target_N66856) -> (get({Target_N66856, '$class'})):createHashtable(Target_N66856) end)('StdUtil':getInstance()).

getTrackingEvent(This, BuildingLayer) ->
        'TrackingEvent':new(BuildingLayer).

