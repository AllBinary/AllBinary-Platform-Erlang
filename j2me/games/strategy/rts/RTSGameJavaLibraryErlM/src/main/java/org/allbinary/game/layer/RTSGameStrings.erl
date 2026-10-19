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

-module('RTSGameStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'RTSGameStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'DRAG_TO_SPOT'}, "Please Drag"),
    put({This, 'NOT_YOURS'}, "Not Yours"),
    put({This, 'NEW_UNIT'}, "New Unit"),
    put({This, 'NEW_WAYPOINT'}, "New Waypoint"),
    put({This, 'BUILDING'}, "Building"),
    put({This, 'UPGRADE'}, "Upgrading"),
    put({This, 'DOWNGRADE'}, "Downgrading"),
    put({This, 'NO_MONEY'}, "Not Enough Money"),
    put({This, 'SPOT_TAKEN'}, "Spot Taken"),
    put({This, 'BUILDING_COLLISION'}, "Building Collision"),
    put({This, 'STRUCTURE_TO_CLOSE'}, "Building To Close"),
    put({This, 'MAP_EDGE'}, "Map Edge"),
    put({This, 'ROAD_COLLISION'}, "Road Collision"),
    put({This, 'SELECT_BUILD_SPOT'}, "Select Build Spot"),
    put({This, 'BUILD_ON_PATH'}, "Not On Path"),
    put({This, 'DRAGGABLE'}, "Draggable"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'RTSGameStrings', instance}).

