% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
%  
% By agreeing to this license you and any business entity you represent are 
% legally bound to the AllBinary Open License Version 1 legal agreement. 
%  
% You may obtain the AllBinary Open License Version 1 legal agreement from 
% AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
%  
% Created By: Travis Berthelot  
% Generated Code Do Not Modify
% package org.allbinary.game.layer
% import org.allbinary.game.layer.waypoint.WorkWaypoint
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap
% import org.allbinary.util.ABHashtable

-module('AdvancedRTSLayerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AdvancedRTSLayerUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AdvancedRTSLayerUtil', instance}).

createFakeRTSLayerHashtable(This, BaseRaceTrackGeographicMap) ->
        Hashtable = (fun(Target_N65848) -> (get({Target_N65848, '$class'})):createFakeRTSLayerHashtable(Target_N65848, BaseRaceTrackGeographicMap) end)('RTSLayerUtil':getInstance()),
        (get({Hashtable, '$class'})):put(Hashtable, get({'WorkWaypoint', 'ID'}), (fun(Target_N65954) -> (get({Target_N65954, '$class'})):getAt(Target_N65954, 50) end)('SmallIntegerSingletonFactory':getInstance())),
        Hashtable.

