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
% package org.allbinary.game.layer.waypoint.event
% import org.allbinary.game.identification.Group

-module('WaypointEventHandlerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, eventHandlerArray}, array:from_list(['WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new(), 'WaypointEventHandler':new()])),
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


getInstance(GroupInterface) ->
        array:get(trunc((get({GroupInterface, '$class'})):getGroupId(GroupInterface)), get({'WaypointEventHandlerFactory', eventHandlerArray})).

removeAll() ->
        lists:foreach(fun(Index) ->
            (fun(Target_N65929) -> (get({Target_N65929, '$class'})):removeAllListeners(Target_N65929) end)(array:get(Index, get({'WaypointEventHandlerFactory', eventHandlerArray})))
        end, lists:seq((array:size(get({'WaypointEventHandlerFactory', eventHandlerArray})) - 1), 0, -1)).

