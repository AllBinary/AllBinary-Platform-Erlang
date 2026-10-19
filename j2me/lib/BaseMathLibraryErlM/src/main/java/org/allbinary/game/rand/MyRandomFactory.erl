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
% package org.allbinary.game.rand
% import java.util.Random
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('MyRandomFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MyRandomFactory':new()),
    ok.

init_fields(This) ->
    put({This, mathUtil}, 'MathUtil':getInstance()),
    put({This, rand}, undefined),
    ok.


getInstance() ->
        get({'MyRandomFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, rand}, 'Random':new(erlang:system_time(millisecond))).

setSeed(This, Seed) when is_integer(Seed) ->
        put({This, rand}, 'Random':new(Seed)).

getNextInt(This, Range) when is_integer(Range) ->
        Div = (((get({'Integer', 'MAX_VALUE'}) / Range)) + 1),
        trunc((((get({get({This, rand}), '$class'})):nextInt(get({This, rand})) / Div))).

getAbsoluteNextInt(This, Range) when is_integer(Range) ->
        (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (get({This, '$class'})):getNextInt(This, Range)).

getAbsoluteNextIntAllowZero(This, Range) when is_integer(Range) ->
        try
        case (Range =:= 0) of
            true ->
            throw({'$return', 0});
            false ->
            throw({'$return', (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (get({This, '$class'})):getNextInt(This, Range))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

shuffle(This, IntArray) when (is_tuple(IntArray) orelse IntArray =:= undefined) ->
        (get({This, '$class'})):shuffleTotal(This, IntArray, (array:size(IntArray) * 7)).

shuffleTotal(This, IntArray, ShuffleTotal) when (is_tuple(IntArray) orelse IntArray =:= undefined), is_integer(ShuffleTotal) ->
        Size = array:size(IntArray),
        put({local, randomIndex}, 0),
        put({local, randomIndex2}, 0),
        put({local, value}, 0),
        lists:foreach(fun(Index) ->
            put({local, randomIndex}, (get({This, '$class'})):getAbsoluteNextIntAllowZero(This, Size)),
            put({local, randomIndex2}, (get({This, '$class'})):getAbsoluteNextIntAllowZero(This, Size)),
            put({local, value}, array:get(get({local, randomIndex}), IntArray)),
            array:set(get({local, randomIndex}), array:get(get({local, randomIndex2}), IntArray), IntArray),
            array:set(get({local, randomIndex2}), get({local, value}), IntArray)
        end, lists:seq(0, ShuffleTotal - 1)).

shuffle2(This, IntArray, IntArray2) when (is_tuple(IntArray) orelse IntArray =:= undefined), (is_tuple(IntArray2) orelse IntArray2 =:= undefined) ->
        (get({This, '$class'})):shuffle2Total(This, IntArray, IntArray2, (array:size(IntArray) * 7)).

shuffle2Total(This, IntArray, IntArray2, ShuffleTotal) when (is_tuple(IntArray) orelse IntArray =:= undefined), (is_tuple(IntArray2) orelse IntArray2 =:= undefined), is_integer(ShuffleTotal) ->
        Size = array:size(IntArray),
        put({local, randomIndex}, 0),
        put({local, randomIndex2}, 0),
        put({local, value}, 0),
        put({local, value2}, 0),
        lists:foreach(fun(Index) ->
            put({local, randomIndex}, (get({This, '$class'})):getAbsoluteNextIntAllowZero(This, Size)),
            put({local, randomIndex2}, (get({This, '$class'})):getAbsoluteNextIntAllowZero(This, Size)),
            put({local, value}, array:get(get({local, randomIndex}), IntArray)),
            put({local, value2}, array:get(get({local, randomIndex}), IntArray2)),
            array:set(get({local, randomIndex}), array:get(get({local, randomIndex2}), IntArray), IntArray),
            array:set(get({local, randomIndex2}), get({local, value}), IntArray),
            array:set(get({local, randomIndex}), array:get(get({local, randomIndex2}), IntArray2), IntArray2),
            array:set(get({local, randomIndex2}), get({local, value2}), IntArray2)
        end, lists:seq(0, ShuffleTotal - 1)).

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        RandomFactory = 'MyRandomFactory':getInstance(),
        StringBuilder = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        Size2 = 100,
        lists:foreach(fun(Index) ->
            (fun(Target_N68122) -> (get({Target_N68122, '$class'})):append(Target_N68122, get({CommonSeps, 'COMMA'})) end)((get({StringBuilder, '$class'})):appendint(StringBuilder, trunc((get({RandomFactory, '$class'})):getAbsoluteNextInt(RandomFactory, 3))))
        end, lists:seq(0, Size2 - 1)),
        io:format("~ts~n", [allbinary_java:to_string((get({StringBuilder, '$class'})):toString(StringBuilder))]),
        (get({StringBuilder, '$class'})):delete(StringBuilder, 0, (get({StringBuilder, '$class'})):length(StringBuilder)),
        IntArray = array:new(52, {default, 0}),
        IntArray2 = array:new(52, {default, 0}),
        Size = array:size(IntArray),
        lists:foreach(fun(Index) ->
            array:set(Index, Index, IntArray),
            array:set(Index, Index, IntArray2)
        end, lists:seq(0, Size - 1)),
        (get({RandomFactory, '$class'})):shuffle2(RandomFactory, IntArray, IntArray2),
        lists:foreach(fun(Index) ->
            (fun(Target_N68700) -> (get({Target_N68700, '$class'})):append(Target_N68700, get({CommonSeps, 'COMMA'})) end)((get({StringBuilder, '$class'})):appendint(StringBuilder, array:get(Index, IntArray)))
        end, lists:seq(0, Size - 1)),
        io:format("~ts~n", [allbinary_java:to_string((get({StringBuilder, '$class'})):toString(StringBuilder))]),
        (get({StringBuilder, '$class'})):delete(StringBuilder, 0, (get({StringBuilder, '$class'})):length(StringBuilder)),
        lists:foreach(fun(Index) ->
            (fun(Target_N68934) -> (get({Target_N68934, '$class'})):append(Target_N68934, get({CommonSeps, 'COMMA'})) end)((get({StringBuilder, '$class'})):appendint(StringBuilder, array:get(Index, IntArray2)))
        end, lists:seq(0, Size - 1)),
        io:format("~ts~n", [allbinary_java:to_string((get({StringBuilder, '$class'})):toString(StringBuilder))]),
        put({local, found}, false),
        lists:foreach(fun(Index) ->
            put({local, found}, false),
            lists:foreach(fun(Index2) ->
                case (array:get(Index2, IntArray) =:= Index) of
                    true ->
                    put({local, found}, true);
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            case (not get({local, found})) of
                true ->
                erlang:error({'RuntimeException'});
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

