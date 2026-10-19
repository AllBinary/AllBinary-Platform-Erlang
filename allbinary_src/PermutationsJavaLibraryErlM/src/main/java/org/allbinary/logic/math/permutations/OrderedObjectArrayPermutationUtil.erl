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
% package org.allbinary.logic.math.permutations
% import java.util.Arrays
% import org.allbinary.TsUtil
% import org.allbinary.logic.util.visitor.Visitor

-module('OrderedObjectArrayPermutationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OrderedObjectArrayPermutationUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'TOTAL_ITERATIONS_TABLE'}, "Total Iterations: "),
    put({This, 'FINISHED'}, "\nFINISHED"),
    ok.


getInstance() ->
        get({'OrderedObjectArrayPermutationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getNext(This, Data) when (is_tuple(Data) orelse Data =:= undefined) ->
        Length = array:size(Data),
        put({local, i}, (Length - 1)),
        TsUtil = 'TsUtil':getInstance(),
        (fun Loop() -> case ((get({TsUtil, '$class'})):hashCode(TsUtil, array:get((get({local, i}) - 1), Data)) >= (get({TsUtil, '$class'})):hashCode(TsUtil, array:get(get({local, i}), Data))) of true ->
            put({local, i}, (get({local, i}) - 1)),
            Loop();
        false -> ok end end)(),
        put({local, j}, Length),
        (fun Loop() -> case ((get({TsUtil, '$class'})):hashCode(TsUtil, array:get((get({local, j}) - 1), Data)) =< (get({TsUtil, '$class'})):hashCode(TsUtil, array:get((get({local, i}) - 1), Data))) of true ->
            put({local, j}, (get({local, j}) - 1)),
            Loop();
        false -> ok end end)(),
        (get({This, '$class'})):swap(This, Data, (get({local, i}) - 1), (get({local, j}) - 1)),
        put({local, i}, get({local, i}) + 1),
        put({local, j}, Length),
        (fun Loop() -> case (get({local, i}) < get({local, j})) of true ->
            (get({This, '$class'})):swap(This, Data, (get({local, i}) - 1), (get({local, j}) - 1)),
            put({local, i}, get({local, i}) + 1),
            put({local, j}, get({local, j}) - 1),
            Loop();
        false -> ok end end)().

swap(This, Data, A, B) when (is_tuple(Data) orelse Data =:= undefined), is_integer(A), is_integer(B) ->
        Temp = array:get(A, Data),
        array:set(A, array:get(B, Data), Data),
        array:set(B, Temp, Data).

factorial(This, DataLength) when is_integer(DataLength) ->
        put({local, temp}, 1),
        case (DataLength > 1) of
            true ->
            lists:foreach(fun(I) ->
                put({local, temp}, (get({local, temp}) * I))
            end, lists:seq(1, DataLength));
            false -> ok
        end,
        get({local, temp}).

generate(This, Data, Visitor) when (is_tuple(Data) orelse Data =:= undefined) ->
        Iterations = (get({This, '$class'})):factorial(This, array:size(Data)),
        io:format("~ts", [allbinary_java:to_string(get({This, 'TOTAL_ITERATIONS_TABLE'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Iterations)]),
        lists:foreach(fun(Count) ->
            (get({This, '$class'})):getNext(This, Data),
            (get({Visitor, '$class'})):visit(Visitor, This)
        end, lists:seq(0, (Iterations - 1) - 1)),
        io:format("~ts~n", [allbinary_java:to_string(get({This, 'FINISHED'}))]).

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        TOTAL = 7,
        Data = array:new(TOTAL, {default, undefined}),
        lists:foreach(fun(I) ->
            array:set(I, 'ComparableObject':new(), Data)
        end, lists:seq(0, TOTAL - 1)),
        'Arrays':sort(Data),
        PermutationVisitor = 'ObjectPermutationVisitor':new(Data),
        ORIGINAL_DATA_LABEL = "Original Data: ",
        io:format("~ts", [allbinary_java:to_string(ORIGINAL_DATA_LABEL)]),
        (get({PermutationVisitor, '$class'})):visit(PermutationVisitor, Data),
        (fun(Target_N67811) -> (get({Target_N67811, '$class'})):generate(Target_N67811, Data, PermutationVisitor) end)('OrderedObjectArrayPermutationUtil':getInstance()).

