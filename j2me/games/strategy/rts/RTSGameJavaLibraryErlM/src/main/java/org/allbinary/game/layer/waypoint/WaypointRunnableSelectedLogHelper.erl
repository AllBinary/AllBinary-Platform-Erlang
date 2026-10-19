% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker

-module('WaypointRunnableSelectedLogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointRunnableLogHelper', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'WaypointRunnableSelectedLogHelper':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'WaypointRunnableLogHelper':init(This),
    init_fields(This).


getInstance() ->
        get({'WaypointRunnableSelectedLogHelper', instanceC}).

start(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N65962) -> (get({Target_N65962, '$class'})):toString(Target_N65962) end)((fun(Target_N65969) -> (get({Target_N65969, '$class'})):append(Target_N65969, get({get({This, commonStrings}), 'START_RUNNABLE'})) end)((fun(Target_N65976) -> (get({Target_N65976, '$class'})):append(Target_N65976, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'})).

'end'(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66150) -> (get({Target_N66150, '$class'})):toString(Target_N66150) end)((fun(Target_N66157) -> (get({Target_N66157, '$class'})):append(Target_N66157, get({get({This, commonStrings}), 'END_RUNNABLE'})) end)((fun(Target_N66164) -> (get({Target_N66164, '$class'})):append(Target_N66164, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'})).

