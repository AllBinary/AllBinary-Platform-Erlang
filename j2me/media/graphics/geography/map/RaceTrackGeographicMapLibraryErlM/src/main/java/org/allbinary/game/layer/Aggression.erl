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

-module('Aggression').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, ram}, (fun(Target_N65632) -> (get({Target_N65632, '$class'})):getAt(Target_N65632, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, projectile}, (fun(Target_N65693) -> (get({Target_N65693, '$class'})):getAt(Target_N65693, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, drops}, (fun(Target_N65754) -> (get({Target_N65754, '$class'})):getAt(Target_N65754, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.


new(Ram, Projectile, Drops) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Ram, Projectile, Drops),
    This.

init(This, Ram, Projectile, Drops) ->
    init_fields(This),
        (get({This, '$class'})):setRam(This, Ram),
        (get({This, '$class'})):setProjectile(This, Projectile),
        (get({This, '$class'})):setDrops(This, Drops).

getRam(This) ->
        get({This, ram}).

setRam(This, Ram) ->
        put({This, ram}, Ram).

getProjectile(This) ->
        get({This, projectile}).

setProjectile(This, Projectile) ->
        put({This, projectile}, Projectile).

getDrops(This) ->
        get({This, drops}).

setDrops(This, Drops) ->
        put({This, drops}, Drops).

