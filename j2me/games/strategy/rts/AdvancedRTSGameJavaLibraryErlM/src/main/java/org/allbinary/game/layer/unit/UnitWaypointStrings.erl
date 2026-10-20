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
% package org.allbinary.game.layer.unit
% import org.allbinary.string.CommonLabels

-module('UnitWaypointStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'UnitWaypointStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'WANDERING'}, "Order?"),
    put({This, 'THINKING'}, "Thinking"),
    put({This, 'THINKING_ABOUT_TARGET'}, "Hmmm"),
    put({This, 'TARGET'}, "Target"),
    put({This, 'KILL'}, "Kill!"),
    put({This, 'STOP'}, "Stop"),
    put({This, 'WAYPOINT_DESTROYED_SHORT'}, "Uh Oh"),
    put({This, 'WAYPOINT_DESTROYED'}, "Waypoint Destroyed"),
    put({This, 'ALL_VISITED_SHORT'}, "Arrived"),
    put({This, 'ALL_VISITED'}, "All Visited"),
    put({This, 'ALREADY_THERE_SHORT'}, "Again?"),
    put({This, 'ALREADY_THERE'}, "Already There"),
    put({This, 'NEXT_PATH_NODE'}, lists:concat([get({'CommonLabels':getInstance(), 'NEXT'}), " Path Node"])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'UnitWaypointStrings', instance}).

