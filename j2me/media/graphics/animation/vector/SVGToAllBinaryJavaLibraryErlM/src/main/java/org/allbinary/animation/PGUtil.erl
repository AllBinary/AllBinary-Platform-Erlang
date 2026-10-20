% Generated Code Do Not Modify
% package org.allbinary.animation

-module('PGUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PGUtil':new()),
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


getInstance() ->
        get({'PGUtil', instance}).

flattenCubicBezier(This, X0, Y0, X1, Y1, X2, Y2, X3, Y3, OutX, OutY, Count, MaxPoints) when is_integer(X0), is_integer(Y0), is_integer(X1), is_integer(Y1), is_integer(X2), is_integer(Y2), is_integer(X3), is_integer(Y3), (is_tuple(OutX) orelse OutX =:= undefined), (is_tuple(OutY) orelse OutY =:= undefined), (is_tuple(Count) orelse Count =:= undefined), is_integer(MaxPoints) ->
        FixedPoint = 'FixedPoint':getInstance(),
        Steps = 10,
        lists:foreach(fun(I) ->
            T = (get({FixedPoint, '$class'})):'div'(FixedPoint, (get({FixedPoint, '$class'})):toFixed(FixedPoint, float(I)), (get({FixedPoint, '$class'})):toFixed(FixedPoint, Steps)),
            Mt = (get({FixedPoint, 'ONE'}) - T),
            Mt3 = (get({FixedPoint, '$class'})):mul(FixedPoint, (get({FixedPoint, '$class'})):mul(FixedPoint, Mt, Mt), Mt),
            Mt2t3 = (3 * (get({FixedPoint, '$class'})):mul(FixedPoint, (get({FixedPoint, '$class'})):mul(FixedPoint, Mt, Mt), T)),
            Mtt23 = (3 * (get({FixedPoint, '$class'})):mul(FixedPoint, (get({FixedPoint, '$class'})):mul(FixedPoint, Mt, T), T)),
            T3 = (get({FixedPoint, '$class'})):mul(FixedPoint, (get({FixedPoint, '$class'})):mul(FixedPoint, T, T), T),
            X = ((((get({FixedPoint, '$class'})):mul(FixedPoint, Mt3, X0) + (get({FixedPoint, '$class'})):mul(FixedPoint, Mt2t3, X1)) + (get({FixedPoint, '$class'})):mul(FixedPoint, Mtt23, X2)) + (get({FixedPoint, '$class'})):mul(FixedPoint, T3, X3)),
            Y = ((((get({FixedPoint, '$class'})):mul(FixedPoint, Mt3, Y0) + (get({FixedPoint, '$class'})):mul(FixedPoint, Mt2t3, Y1)) + (get({FixedPoint, '$class'})):mul(FixedPoint, Mtt23, Y2)) + (get({FixedPoint, '$class'})):mul(FixedPoint, T3, Y3)),
            case (array:get(0, Count) < MaxPoints) of
                true ->
                array:set(array:get(0, Count), X, OutX),
                array:set(array:get(0, Count), Y, OutY),
                array:set(0, array:get(0, Count) + 1, Count);
                false -> ok
            end
        end, lists:seq(1, Steps)).

