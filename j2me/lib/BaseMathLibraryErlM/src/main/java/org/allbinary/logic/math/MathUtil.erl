% Generated Code Do Not Modify
% package org.allbinary.logic.math
% import jsinterop.annotations.JsType

-module('MathUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MathUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'ACCURACY'}, 100),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'MathUtil', instance}).

getTotalDigits(This, Digits) when is_integer(Digits) ->
        put({local, digits}, Digits),
        put({local, total}, 0),
        (fun Loop() -> case (get({local, digits}) > 0) of true ->
            put({local, digits}, (get({local, digits}) div 10)),
            put({local, total}, get({local, total}) + 1),
            Loop();
        false -> ok end end)(),
        get({local, total}).

sqrt(This, Value) when is_integer(Value) ->
        try
        case (Value =< 1) of
            true ->
            throw({'$return', Value});
            false -> ok
        end,
        put({local, accumulated}, (Value bsr 1)),
        put({local, result}, (((get({local, accumulated}) + ((Value div get({local, accumulated}))))) bsr 1)),
        (fun Loop() ->
            put({local, accumulated}, get({local, result})),
            put({local, result}, (((get({local, accumulated}) + ((Value div get({local, accumulated}))))) bsr 1)),
            case (get({local, accumulated}) > get({local, result})) of true -> Loop(); false -> ok end
        end)(),
        get({local, accumulated})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

sqrtd(This, X) when is_integer(X) ->
        try
        case (X =:= 0) of
            true ->
            throw({'$return', 0.0});
            false -> ok
        end,
        case (X < 0) of
            true ->
            throw({'$return', (-1.0)});
            false -> ok
        end,
        put({local, result}, float(X)),
        lists:foreach(fun(Index) ->
            put({local, result}, (((get({local, result}) + ((float(X) / get({local, result}))))) / 2.0))
        end, lists:seq(0, get({This, 'ACCURACY'}) - 1)),
        get({local, result})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

abs(This, Value) when is_integer(Value) ->
        case ((Value < 0)) of true -> (-Value); false -> Value end.

abslong(This, Value) when is_integer(Value) ->
        case ((Value < 0)) of true -> (-Value); false -> Value end.

min(This, Value, Value2) when is_integer(Value), is_integer(Value2) ->
        case ((Value =< Value2)) of true -> Value; false -> Value2 end.

max(This, Value, Value2) when is_integer(Value), is_integer(Value2) ->
        case ((Value >= Value2)) of true -> Value; false -> Value2 end.

