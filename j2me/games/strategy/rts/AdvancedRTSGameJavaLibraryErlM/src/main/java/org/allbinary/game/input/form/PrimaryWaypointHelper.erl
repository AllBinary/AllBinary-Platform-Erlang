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
% package org.allbinary.game.input.form
% import org.allbinary.game.layer.NullPathFindingLayer
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.waypoint.WaypointLayer

-module('PrimaryWaypointHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PrimaryWaypointHelper':new()),
    ok.

init_fields(This) ->
    put({This, waypointLayer}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    ok.


getInstance() ->
        get({'PrimaryWaypointHelper', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getWaypointLayer(This) ->
        get({This, waypointLayer}).

setWaypointLayer(This, WaypointLayer) ->
        put({This, waypointLayer}, WaypointLayer).

