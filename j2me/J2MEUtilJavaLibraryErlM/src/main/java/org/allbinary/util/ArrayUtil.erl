% Generated Code Do Not Modify
% package org.allbinary.util
% import jsinterop.annotations.JsType
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import jsinterop.annotations.JsMethod

-module('ArrayUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ArrayUtil':new()),
    ok.

init_fields(This) ->
    put({This, mathUtil}, 'MathUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ArrayUtil', instance}).

copyOf(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        (get({This, '$class'})):copyOfType(This, Original, NewLength, get({Original, '$class'})).

copyOfType(This, Original, NewLength, NewType) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, undefined}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOfbyte(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, 0}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOfshort(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, 0}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOfint(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, 0}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOflong(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, 0}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOfchar(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, 0}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOffloat(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, 0.0}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOfdouble(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, 0.0}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

copyOfboolean(This, Original, NewLength) when (is_tuple(Original) orelse Original =:= undefined), is_integer(NewLength) ->
        Copy = array:new(NewLength, {default, false}),
        allbinary_java:array_copy(Original, 0, Copy, 0, (get({get({This, mathUtil}), '$class'})):min(get({This, mathUtil}), array:size(Original), NewLength)),
        Copy.

reverse(This, IntArray) when (is_tuple(IntArray) orelse IntArray =:= undefined) ->
        Length = (array:size(IntArray) - 1),
        put({local, temp}, 0),
        Size = (Length div 2),
        lists:foreach(fun(Index) ->
            put({local, temp}, array:get(Index, IntArray)),
            array:set(Index, array:get((Length - Index), IntArray), IntArray),
            array:set((Length - Index), get({local, temp}), IntArray)
        end, lists:seq(0, Size)).

flip(This, IntArray, Width, Height) when (is_tuple(IntArray) orelse IntArray =:= undefined), is_integer(Width), is_integer(Height) ->
        Length = (Height - 1),
        put({local, temp}, 0),
        put({local, index}, 0),
        put({local, rowIndex}, 0),
        lists:foreach(fun(Y) ->
            lists:foreach(fun(X) ->
                put({local, rowIndex}, ((((Length - Y)) * Width))),
                put({local, index}, (X + ((Y * Width)))),
                put({local, temp}, array:get(get({local, index}), IntArray)),
                array:set(get({local, index}), array:get((get({local, rowIndex}) + X), IntArray), IntArray),
                array:set((get({local, rowIndex}) + X), get({local, temp}), IntArray)
            end, lists:seq(0, Width - 1))
        end, lists:seq(0, (Length div 2))).

toStringFromTwoDimensionaArray(This, TwoDimensionalIntArray) when (is_tuple(TwoDimensionalIntArray) orelse TwoDimensionalIntArray =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        EndIndex = array:size(TwoDimensionalIntArray),
        EndIndex2 = array:size(array:get(0, TwoDimensionalIntArray)),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'BRACE_OPEN'})),
            lists:foreach(fun(Index2) ->
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(array:get(Index2, array:get(Index, TwoDimensionalIntArray)))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'}))
            end, lists:seq(0, EndIndex2 - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'BRACE_CLOSE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'}))
        end, lists:seq(0, EndIndex - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

toStringFromObjectArray(This, ObjectArray) when (is_tuple(ObjectArray) orelse ObjectArray =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70178) -> (get({Target_N70178, '$class'})):toString(Target_N70178, array:get(Index, ObjectArray)) end)('StringUtil':getInstance())),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'}))
        end, lists:seq(0, array:size(ObjectArray) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

toStringFromByteArray(This, ByteArray) when (is_tuple(ByteArray) orelse ByteArray =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):appendbyte(StringBuffer, array:get(Index, ByteArray)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'}))
        end, lists:seq(0, array:size(ByteArray) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

