% Generated Code Do Not Modify
% package org.allbinary.logic.math.permutations
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.string.CommonSeps

-module('IntPermutationVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Visitor', Function, Arguments).

init_fields(This) ->
    put({This, data}, undefined),
    put({This, stringBuilder}, 'StringMaker':new()),
    ok.


new(Data) when (is_tuple(Data) orelse Data =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Data),
    This.

'$init'(This, Data) when (is_tuple(Data) orelse Data =:= undefined) ->
    'Visitor':'$init'(This),
    init_fields(This),
        put({This, data}, Data).

visit(This, AnyType) ->
        (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
        (get({This, '$class'})):print(This, get({This, data}), get({This, stringBuilder})),
        get({'NullUtil':getInstance(), 'NULL_OBJECT'}).

print(This, Data) when (is_tuple(Data) orelse Data =:= undefined) ->
        StringBuilder = 'StringMaker':new(),
        (get({This, '$class'})):print(This, Data, StringBuilder).

print(This, Data, StringBuilder) when (is_tuple(Data) orelse Data =:= undefined) ->
        CommonSeps = 'CommonSeps':getInstance(),
        Size = array:size(Data),
        lists:foreach(fun(I) ->
            (get({StringBuilder, '$class'})):appendint(StringBuilder, array:get(I, Data)),
            (get({StringBuilder, '$class'})):append(StringBuilder, get({CommonSeps, 'SPACE'}))
        end, lists:seq(0, Size - 1)),
        io:format("~ts~n", [allbinary_java:to_string((get({StringBuilder, '$class'})):toString(StringBuilder))]).

