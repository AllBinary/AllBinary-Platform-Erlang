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

-module('UnitTechnologySingletonFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'UnitTechnologySingletonFactory':new()),
    ok.

init_fields(This) ->
    put({This, damage}, 0),
    put({This, health}, 0),
    put({This, reload}, 0),
    put({This, repair}, 0),
    put({This, speed}, 0),
    ok.


getInstance() ->
        get({'UnitTechnologySingletonFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This) ->
        (get({This, '$class'})):setDamage(This, 0),
        (get({This, '$class'})):setHealth(This, 0),
        (get({This, '$class'})):setReload(This, 0),
        (get({This, '$class'})):setRepair(This, 0),
        (get({This, '$class'})):setSpeed(This, 0).

getDamage(This) ->
        get({This, damage}).

setDamage(This, Damage) when is_integer(Damage) ->
        put({This, damage}, Damage).

getHealth(This) ->
        get({This, health}).

setHealth(This, Health) when is_integer(Health) ->
        put({This, health}, Health).

getReload(This) ->
        get({This, reload}).

setReload(This, Reload) when is_integer(Reload) ->
        put({This, reload}, Reload).

getRepair(This) ->
        get({This, repair}).

setRepair(This, Repair) when is_integer(Repair) ->
        put({This, repair}, Repair).

getSpeed(This) ->
        get({This, speed}).

setSpeed(This, Speed) when is_integer(Speed) ->
        put({This, speed}, Speed).

