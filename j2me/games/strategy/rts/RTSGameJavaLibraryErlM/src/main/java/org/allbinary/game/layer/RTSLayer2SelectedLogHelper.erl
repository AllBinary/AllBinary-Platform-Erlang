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
% package org.allbinary.game.layer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker

-module('RTSLayer2SelectedLogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSLayer2LogHelper', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'RTSLayer2SelectedLogHelper':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'TRACK_TO_FIRE_OR_MOVE'}, "trackTo:fireOrMove"),
    put({This, 'BUILDING_CHASE'}, "buildingChase"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'RTSLayer2LogHelper':init(This),
    init_fields(This).


getInstance() ->
        get({'RTSLayer2SelectedLogHelper', instanceC}).

steeringUp(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N65928) -> (get({Target_N65928, '$class'})):toString(Target_N65928) end)((fun(Target_N65935) -> (get({Target_N65935, '$class'})):append(Target_N65935, " steering - Up") end)((fun(Target_N65942) -> (get({Target_N65942, '$class'})):append(Target_N65942, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({This, 'TRACK_TO_FIRE_OR_MOVE'})).

steeringFireOrStop(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66093) -> (get({Target_N66093, '$class'})):toString(Target_N66093) end)((fun(Target_N66100) -> (get({Target_N66100, '$class'})):append(Target_N66100, " steering - Fire/All Stop") end)((fun(Target_N66107) -> (get({Target_N66107, '$class'})):append(Target_N66107, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({This, 'TRACK_TO_FIRE_OR_MOVE'})).

buildingAbove(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66258) -> (get({Target_N66258, '$class'})):toString(Target_N66258) end)((fun(Target_N66265) -> (get({Target_N66265, '$class'})):append(Target_N66265, " Building Above") end)((fun(Target_N66272) -> (get({Target_N66272, '$class'})):append(Target_N66272, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({This, 'BUILDING_CHASE'})).

buildingChaseLeft(This, PathFindingLayerInterface, Angle) when is_integer(Angle) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66423) -> (get({Target_N66423, '$class'})):toString(Target_N66423) end)((fun(Target_N66430) -> (get({Target_N66430, '$class'})):appendint(Target_N66430, Angle) end)((fun(Target_N66437) -> (get({Target_N66437, '$class'})):append(Target_N66437, " steering - Going Left: ") end)((fun(Target_N66444) -> (get({Target_N66444, '$class'})):append(Target_N66444, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new())))), This, get({This, 'BUILDING_CHASE'})).

buildingChaseRight(This, PathFindingLayerInterface, Angle) when is_integer(Angle) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66627) -> (get({Target_N66627, '$class'})):toString(Target_N66627) end)((fun(Target_N66634) -> (get({Target_N66634, '$class'})):appendint(Target_N66634, Angle) end)((fun(Target_N66641) -> (get({Target_N66641, '$class'})):append(Target_N66641, " steering - Going Right: ") end)((fun(Target_N66648) -> (get({Target_N66648, '$class'})):append(Target_N66648, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new())))), This, get({This, 'BUILDING_CHASE'})).

buildingDown(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66831) -> (get({Target_N66831, '$class'})):toString(Target_N66831) end)((fun(Target_N66838) -> (get({Target_N66838, '$class'})):append(Target_N66838, " Building Below") end)((fun(Target_N66845) -> (get({Target_N66845, '$class'})):append(Target_N66845, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({This, 'BUILDING_CHASE'})).

buildingChaseDown(This, PathFindingLayerInterface, Angle) when is_integer(Angle) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66996) -> (get({Target_N66996, '$class'})):toString(Target_N66996) end)((fun(Target_N67003) -> (get({Target_N67003, '$class'})):appendint(Target_N67003, Angle) end)((fun(Target_N67010) -> (get({Target_N67010, '$class'})):append(Target_N67010, " steering - Going Down: ") end)((fun(Target_N67017) -> (get({Target_N67017, '$class'})):append(Target_N67017, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new())))), This, get({This, 'BUILDING_CHASE'})).

buildingChaseUp(This, PathFindingLayerInterface, Angle) when is_integer(Angle) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67200) -> (get({Target_N67200, '$class'})):toString(Target_N67200) end)((fun(Target_N67207) -> (get({Target_N67207, '$class'})):appendint(Target_N67207, Angle) end)((fun(Target_N67214) -> (get({Target_N67214, '$class'})):append(Target_N67214, " steering - Going Up: ") end)((fun(Target_N67221) -> (get({Target_N67221, '$class'})):append(Target_N67221, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new())))), This, get({This, 'BUILDING_CHASE'})).

buildingLeft(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67404) -> (get({Target_N67404, '$class'})):toString(Target_N67404) end)((fun(Target_N67411) -> (get({Target_N67411, '$class'})):append(Target_N67411, " Building Left") end)((fun(Target_N67418) -> (get({Target_N67418, '$class'})):append(Target_N67418, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({This, 'BUILDING_CHASE'})).

buildingRight(This, PathFindingLayerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67558) -> (get({Target_N67558, '$class'})):toString(Target_N67558) end)((fun(Target_N67565) -> (get({Target_N67565, '$class'})):append(Target_N67565, " Building Right") end)((fun(Target_N67572) -> (get({Target_N67572, '$class'})):append(Target_N67572, (get({PathFindingLayerInterface, '$class'})):getName(PathFindingLayerInterface)) end)('StringMaker':new()))), This, get({This, 'BUILDING_CHASE'})).

