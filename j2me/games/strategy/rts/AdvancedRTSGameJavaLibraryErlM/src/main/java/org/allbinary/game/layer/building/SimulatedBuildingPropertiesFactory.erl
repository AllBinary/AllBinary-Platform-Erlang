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
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.game.tracking.TrackingEventHandler
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('SimulatedBuildingPropertiesFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BuildingPropertiesFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'SimulatedBuildingPropertiesFactory':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BuildingPropertiesFactory':init(This),
    init_fields(This).


getInstance() ->
        get({'SimulatedBuildingPropertiesFactory', instanceC}).

getEfficiencyPerLevel(This, BuildingLayer) ->
        0.

getDamageFloaters(This, BuildingLayer) ->
        DamageFloaters = 'DamageFloaters':getInstance(),
        put({This, damageFloatersPaintableInterface}, DamageFloaters),
        DamageFloaters.

% throws Exception
getHealthBar(This, BuildingLayer) ->
        'NullPaintable':getInstance().

getHashtable(This) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

getTrackingEvent(This, BuildingLayer) ->
        'TrackingEvent':new('TrackingEventHandler':getInstance()).

