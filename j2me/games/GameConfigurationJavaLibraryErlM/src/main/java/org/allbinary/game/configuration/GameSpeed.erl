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
% package org.allbinary.game.configuration

-module('GameSpeed').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameSpeed':new()),
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


getSpeed(This) ->
        SpeedGameConfiguration = get({'GameConfigurationCentral':getInstance(), 'SPEED'}),
        ((((fun(Target_N65703) -> (get({Target_N65703, '$class'})):intValue(Target_N65703) end)((get({SpeedGameConfiguration, '$class'})):getMaxValue(SpeedGameConfiguration)) - (fun(Target_N65727) -> (get({Target_N65727, '$class'})):intValue(Target_N65727) end)((get({SpeedGameConfiguration, '$class'})):getValue(SpeedGameConfiguration))) + 1)).

getDelay(This) ->
        SpeedGameConfiguration = get({'GameConfigurationCentral':getInstance(), 'SPEED'}),
        (19 * (((fun(Target_N65858) -> (get({Target_N65858, '$class'})):intValue(Target_N65858) end)((get({SpeedGameConfiguration, '$class'})):getMaxValue(SpeedGameConfiguration)) - (fun(Target_N65882) -> (get({Target_N65882, '$class'})):intValue(Target_N65882) end)((get({SpeedGameConfiguration, '$class'})):getValue(SpeedGameConfiguration))))).

getInstance() ->
        get({'GameSpeed', instance}).

