% Generated Code Do Not Modify
% package org.allbinary.game.collision
% import org.allbinary.layer.AllBinaryLayer

-module('CollisionThreedProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollisionProcessor', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'CollisionProcessor':init(This),
    init_fields(This).


isCollision(This, MyLayer, MyLayer2) ->
        try
        case (((((((get({MyLayer2, '$class'})):getXP(MyLayer2) >= (get({MyLayer, '$class'})):getX2(MyLayer)) orelse ((get({MyLayer2, '$class'})):getYP(MyLayer2) >= (get({MyLayer, '$class'})):getY2(MyLayer))) orelse ((get({MyLayer2, '$class'})):getX2(MyLayer2) =< (get({MyLayer, '$class'})):getXP(MyLayer))) orelse ((get({MyLayer2, '$class'})):getY2(MyLayer2) =< (get({MyLayer, '$class'})):getYP(MyLayer))) orelse ((get({MyLayer2, '$class'})):getZP(MyLayer2) < (get({MyLayer, '$class'})):getZ2(MyLayer))) orelse ((get({MyLayer2, '$class'})):getZ2(MyLayer2) > (get({MyLayer, '$class'})):getZP(MyLayer))) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

