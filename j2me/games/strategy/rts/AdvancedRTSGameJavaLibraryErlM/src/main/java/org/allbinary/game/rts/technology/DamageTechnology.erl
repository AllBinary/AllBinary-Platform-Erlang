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
% package org.allbinary.game.rts.technology
% import org.allbinary.game.layer.RTSInterface

-module('DamageTechnology').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RTSInterface

init_fields(This) ->
    put({This, level}, 0),
    put({This, maxLevel}, 0),
    ok.


new(MaxLevel) when is_integer(MaxLevel) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MaxLevel),
    This.

'$init'(This, MaxLevel) when is_integer(MaxLevel) ->
    init_fields(This),
        put({This, maxLevel}, MaxLevel).

isCompleted(This) ->
        false.

getPercentComplete(This) ->
        0.

getLevel(This) ->
        get({This, level}).

getMaxLevel(This) ->
        get({This, maxLevel}).

getCost(This) ->
        0.

downgrade(This) ->
        ok.

getDowngradeCost(This) ->
        0.

isDowngradeable(This) ->
        false.

getUpgradeCost(This) ->
        ((((get({This, '$class'})):getLevel(This) * (get({This, '$class'})):getLevel(This))) * 1000).

isUpgradeable(This) ->
        try
        case ((get({This, '$class'})):getLevel(This) < (get({This, '$class'})):getMaxLevel(This)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

upgrade(This) ->
        put({This, level}, get({This, level}) + 1),
        UnitTechnologySingletonFactory = 'UnitTechnologySingletonFactory':getInstance(),
        (get({UnitTechnologySingletonFactory, '$class'})):setDamage(UnitTechnologySingletonFactory, ((get({UnitTechnologySingletonFactory, '$class'})):getDamage(UnitTechnologySingletonFactory) + (((get({This, '$class'})):getLevel(This) * 100)))).

isSelfUpgradeable(This) ->
        false.

