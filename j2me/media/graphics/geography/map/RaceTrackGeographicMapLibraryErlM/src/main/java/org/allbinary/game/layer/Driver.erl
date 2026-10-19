%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
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
% import org.allbinary.logic.math.SmallIntegerSingletonFactory

-module('Driver').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_DRIVER'}, 'Driver':new((fun(Target_N65653) -> (get({Target_N65653, '$class'})):getAt(Target_N65653, 0) end)('SmallIntegerSingletonFactory':getInstance()), (fun(Target_N65684) -> (get({Target_N65684, '$class'})):getAt(Target_N65684, 0) end)('SmallIntegerSingletonFactory':getInstance()), 'Aggression':new((fun(Target_N65728) -> (get({Target_N65728, '$class'})):getAt(Target_N65728, 0) end)('SmallIntegerSingletonFactory':getInstance()), (fun(Target_N65759) -> (get({Target_N65759, '$class'})):getAt(Target_N65759, 0) end)('SmallIntegerSingletonFactory':getInstance()), (fun(Target_N65790) -> (get({Target_N65790, '$class'})):getAt(Target_N65790, 0) end)('SmallIntegerSingletonFactory':getInstance())))),
    ok.

init_fields(This) ->
    put({This, turnSpeed}, (fun(Target_N65859) -> (get({Target_N65859, '$class'})):getAt(Target_N65859, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, trackPathSelectionSkill}, (fun(Target_N65920) -> (get({Target_N65920, '$class'})):getAt(Target_N65920, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, aggression}, undefined),
    ok.


new(TurnSpeed, TrackPathSelectionSkill, Aggression) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TurnSpeed, TrackPathSelectionSkill, Aggression),
    This.

init(This, TurnSpeed, TrackPathSelectionSkill, Aggression) ->
    init_fields(This),
        (get({This, '$class'})):setTurnSpeed(This, TurnSpeed),
        (get({This, '$class'})):setTrackPathSelectionSkill(This, TrackPathSelectionSkill),
        put({This, aggression}, Aggression).

getTurnSpeed(This) ->
        get({This, turnSpeed}).

setTurnSpeed(This, TurnSpeed) ->
        put({This, turnSpeed}, TurnSpeed).

getTrackPathSelectionSkill(This) ->
        get({This, trackPathSelectionSkill}).

setTrackPathSelectionSkill(This, TrackPathSelectionSkill) ->
        put({This, trackPathSelectionSkill}, TrackPathSelectionSkill).

getAggression(This) ->
        get({This, aggression}).

setAggression(This, Aggression) ->
        put({This, aggression}, Aggression).

