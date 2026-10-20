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
% package org.allbinary.logic.math

-module('BasicDecimal').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'ZERO_BIGDECIMAL'}, 'BasicDecimal':new(0)),
    ok.

init_fields(This) ->
    put({This, units}, 0),
    put({This, scaled}, 0),
    put({This, factor}, get({'ScaleFactorFactory':getInstance(), 'DEFAULT_SCALE_FACTOR'})),
    put({This, factorValue}, get({'ScaleFactorFactory':getInstance(), 'DEFAULT_SCALE_VALUE'})),
    ok.


createBigDecimal(BigDecimal) ->
        'BasicDecimal':new((get({BigDecimal, '$class'})):getUnscaled(BigDecimal)).

new(Units) when is_integer(Units) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Units),
    This.

'$init'(This, Units) when is_integer(Units) ->
    init_fields(This),
        put({This, units}, Units),
        (get({This, '$class'})):updateScaled(This).

setint(This, Value) when is_integer(Value) ->
        put({This, units}, Value),
        (get({This, '$class'})):updateScaled(This).

setlong(This, Value) when is_integer(Value) ->
        put({This, units}, Value),
        (get({This, '$class'})):updateScaled(This).

set(This, BigDecimal) ->
        put({This, units}, (get({BigDecimal, '$class'})):getUnscaled(BigDecimal)),
        (get({This, '$class'})):updateScaled(This).

addint(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) + Value)),
        (get({This, '$class'})):updateScaled(This).

addlong(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) + Value)),
        (get({This, '$class'})):updateScaled(This).

add(This, BigDecimal) ->
        put({This, units}, (get({This, units}) + (get({BigDecimal, '$class'})):getUnscaled(BigDecimal))),
        (get({This, '$class'})):updateScaled(This).

subtractint(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) - Value)),
        (get({This, '$class'})):updateScaled(This).

subtractlong(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) - Value)),
        (get({This, '$class'})):updateScaled(This).

subtract(This, BigDecimal) ->
        put({This, units}, (get({This, units}) - (get({BigDecimal, '$class'})):getUnscaled(BigDecimal))),
        (get({This, '$class'})):updateScaled(This).

multiplyint(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) * Value)),
        (get({This, '$class'})):updateScaled(This).

multiplylong(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) * Value)),
        (get({This, '$class'})):updateScaled(This).

multiply(This, BigDecimal) ->
        put({This, units}, (get({This, units}) * (get({BigDecimal, '$class'})):getUnscaled(BigDecimal))),
        (get({This, '$class'})):updateScaled(This).

divideint(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) div Value)),
        (get({This, '$class'})):updateScaled(This).

dividelong(This, Value) when is_integer(Value) ->
        put({This, units}, (get({This, units}) div Value)),
        (get({This, '$class'})):updateScaled(This).

divide(This, BigDecimal) ->
        put({This, units}, (get({This, units}) / (get({BigDecimal, '$class'})):getUnscaled(BigDecimal))),
        (get({This, '$class'})):updateScaled(This).

getUnscaled(This) ->
        get({This, units}).

updateScaled(This) ->
        put({This, scaled}, ((get({This, units}) div get({This, factorValue})))).

getScaled(This) ->
        get({This, scaled}).

toString(This) ->
        allbinary_java:to_string(get({This, units})).

getScaledFactor(This) ->
        get({This, factor}).

getScaledFactorValue(This) ->
        get({This, factorValue}).

