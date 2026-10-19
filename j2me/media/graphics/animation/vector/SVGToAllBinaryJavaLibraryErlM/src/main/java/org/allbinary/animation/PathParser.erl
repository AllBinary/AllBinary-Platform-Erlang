% Generated Code Do Not Modify
% package org.allbinary.animation
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil

-module('PathParser').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


tokenize(D) when (is_list(D) orelse D =:= undefined) ->
        Tokens = 'BasicArrayListD':new(),
        Sb = 'StringBuffer':new(),
        lists:foreach(fun(I) ->
            C = lists:nth((I) + 1, D),
            case (((((C =:= $\s) orelse (C =:= $,)) orelse (C =:= $\t)) orelse (C =:= $\n)) orelse (C =:= $\r)) of
                true ->
                case ((get({Sb, '$class'})):length(Sb) > 0) of
                    true ->
                    (get({Tokens, '$class'})):add(Tokens, (get({Sb, '$class'})):toString(Sb)),
                    (get({Sb, '$class'})):setLength(Sb, 0);
                    false -> ok
                end;
                false ->
                case ((((((((((C =:= $M) orelse (C =:= $m)) orelse (C =:= $L)) orelse (C =:= $l)) orelse (C =:= $V)) orelse (C =:= $v)) orelse (C =:= $C)) orelse (C =:= $c)) orelse (C =:= $Z)) orelse (C =:= $z)) of
                true ->
                case ((get({Sb, '$class'})):length(Sb) > 0) of
                    true ->
                    (get({Tokens, '$class'})):add(Tokens, (get({Sb, '$class'})):toString(Sb)),
                    (get({Sb, '$class'})):setLength(Sb, 0);
                    false -> ok
                end,
                (get({Tokens, '$class'})):add(Tokens, allbinary_java:to_string(C));
                false ->
                (get({Sb, '$class'})):append(Sb, C)
            end
            end
        end, lists:seq(0, string:length(D) - 1)),
        case ((get({Sb, '$class'})):length(Sb) > 0) of
            true ->
            (get({Tokens, '$class'})):add(Tokens, (get({Sb, '$class'})):toString(Sb));
            false -> ok
        end,
        Res = array:new((get({Tokens, '$class'})):size(Tokens), {default, undefined}),
        (get({Tokens, '$class'})):toArrayType(Tokens, Res),
        Res.

parsePath(D, OutX, OutY, MaxPoints) when (is_list(D) orelse D =:= undefined), (is_tuple(OutX) orelse OutX =:= undefined), (is_tuple(OutY) orelse OutY =:= undefined), is_integer(MaxPoints) ->
        Tokens = tokenize(D),
        Count = array:from_list([0]),
        FixedPoint = 'FixedPoint':getInstance(),
        put({local, curX}, 0),
        put({local, curY}, 0),
        put({local, startX}, 0),
        put({local, startY}, 0),
        put({local, idx}, 0),
        (fun Loop() -> case (get({local, idx}) < array:size(Tokens)) of true ->
            Tok = array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens),
            Cmd = lists:nth((0) + 1, Tok),
            case ((Cmd =:= $M) orelse (Cmd =:= $m)) of
                true ->
                put({local, x}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                put({local, y}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                case (Cmd =:= $m) of
                    true ->
                    put({local, x}, (get({local, x}) + get({local, curX}))),
                    put({local, y}, (get({local, y}) + get({local, curY})));
                    false -> ok
                end,
                put({local, curX}, get({local, x})),
                put({local, curY}, get({local, y})),
                put({local, startX}, get({local, x})),
                put({local, startY}, get({local, y})),
                array:set(array:get(0, Count), get({local, curX}), OutX),
                array:set(array:get(0, Count), get({local, curY}), OutY),
                array:set(0, array:get(0, Count) + 1, Count);
                false ->
                case ((Cmd =:= $L) orelse (Cmd =:= $l)) of
                true ->
                put({local, x}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                put({local, y}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                case (Cmd =:= $l) of
                    true ->
                    put({local, x}, (get({local, x}) + get({local, curX}))),
                    put({local, y}, (get({local, y}) + get({local, curY})));
                    false -> ok
                end,
                put({local, curX}, get({local, x})),
                put({local, curY}, get({local, y})),
                array:set(array:get(0, Count), get({local, curX}), OutX),
                array:set(array:get(0, Count), get({local, curY}), OutY),
                array:set(0, array:get(0, Count) + 1, Count);
                false ->
                case ((Cmd =:= $V) orelse (Cmd =:= $v)) of
                true ->
                put({local, y}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                case (Cmd =:= $v) of
                    true ->
                    put({local, y}, (get({local, y}) + get({local, curY})));
                    false -> ok
                end,
                put({local, curY}, get({local, y})),
                array:set(array:get(0, Count), get({local, curX}), OutX),
                array:set(array:get(0, Count), get({local, curY}), OutY),
                array:set(0, array:get(0, Count) + 1, Count);
                false ->
                case ((Cmd =:= $C) orelse (Cmd =:= $c)) of
                true ->
                put({local, x1}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                put({local, y1}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                put({local, x2}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                put({local, y2}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                put({local, x3}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                put({local, y3}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                case (Cmd =:= $c) of
                    true ->
                    put({local, x1}, (get({local, x1}) + get({local, curX}))),
                    put({local, y1}, (get({local, y1}) + get({local, curY}))),
                    put({local, x2}, (get({local, x2}) + get({local, curX}))),
                    put({local, y2}, (get({local, y2}) + get({local, curY}))),
                    put({local, x3}, (get({local, x3}) + get({local, curX}))),
                    put({local, y3}, (get({local, y3}) + get({local, curY})));
                    false -> ok
                end,
                (fun(Target_N68221) -> (get({Target_N68221, '$class'})):flattenCubicBezier(Target_N68221, get({local, curX}), get({local, curY}), get({local, x1}), get({local, y1}), get({local, x2}), get({local, y2}), get({local, x3}), get({local, y3}), OutX, OutY, Count, MaxPoints) end)('PGUtil':getInstance()),
                put({local, curX}, get({local, x3})),
                put({local, curY}, get({local, y3}));
                false ->
                case ((Cmd =:= $Z) orelse (Cmd =:= $z)) of
                true ->
                put({local, curX}, get({local, startX})),
                put({local, curY}, get({local, startY})),
                array:set(array:get(0, Count), get({local, curX}), OutX),
                array:set(array:get(0, Count), get({local, curY}), OutY),
                array:set(0, array:get(0, Count) + 1, Count);
                false -> ok
            end
            end
            end
            end
            end,
            (fun Loop() -> case ((get({local, idx}) < array:size(Tokens)) andalso (not isCommand(array:get(get({local, idx}), Tokens)))) of true ->
                case ((((Cmd =:= $M) orelse (Cmd =:= $m)) orelse (Cmd =:= $L)) orelse (Cmd =:= $l)) of
                    true ->
                    put({local, x}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                    put({local, y}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                    case ((Cmd =:= $m) orelse (Cmd =:= $l)) of
                        true ->
                        put({local, x}, (get({local, x}) + get({local, curX}))),
                        put({local, y}, (get({local, y}) + get({local, curY})));
                        false -> ok
                    end,
                    put({local, curX}, get({local, x})),
                    put({local, curY}, get({local, y})),
                    array:set(array:get(0, Count), get({local, curX}), OutX),
                    array:set(array:get(0, Count), get({local, curY}), OutY),
                    array:set(0, array:get(0, Count) + 1, Count);
                    false ->
                    case ((Cmd =:= $V) orelse (Cmd =:= $v)) of
                    true ->
                    put({local, y}, (get({FixedPoint, '$class'})):toFixed(FixedPoint, list_to_float(array:get(allbinary_java:first(get({local, idx}), put({local, idx}, get({local, idx}) + 1)), Tokens)))),
                    case (Cmd =:= $v) of
                        true ->
                        put({local, y}, (get({local, y}) + get({local, curY})));
                        false -> ok
                    end,
                    put({local, curY}, get({local, y})),
                    array:set(array:get(0, Count), get({local, curX}), OutX),
                    array:set(array:get(0, Count), get({local, curY}), OutY),
                    array:set(0, array:get(0, Count) + 1, Count);
                    false -> ok
                end
                end,
                Loop();
            false -> ok end end)(),
            Loop();
        false -> ok end end)(),
        array:get(0, Count).

isCommand(Tok) when (is_list(Tok) orelse Tok =:= undefined) ->
        C = lists:nth((0) + 1, Tok),
        (allbinary_java:index_of("MmLlVvCcZz", C) >= 0).

