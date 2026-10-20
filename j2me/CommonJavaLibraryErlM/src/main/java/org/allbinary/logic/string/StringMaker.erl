% Generated Code Do Not Modify
% package org.allbinary.logic.string
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

-module('StringMaker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, charArray}, undefined),
    put({This, currentLength}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, charArray}, array:new(20, {default, 0})).

append(This, String) when (is_list(String) orelse String =:= undefined) ->
        StringLength = string:length(String),
        (get({This, '$class'})):ensureCapacity(This, (get({This, currentLength}) + StringLength)),
        (get({String, '$class'})):getChars(String, 0, StringLength, get({This, charArray}), get({This, currentLength})),
        put({This, currentLength}, (get({This, currentLength}) + StringLength)),
        This.

appendchar(This, C) when is_integer(C) ->
        (get({This, '$class'})):ensureCapacity(This, (get({This, currentLength}) + 1)),
        put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), C, get({This, charArray}))),
        This.

appendCharArray(This, CharArray, Start, End) when (is_tuple(CharArray) orelse CharArray =:= undefined), is_integer(Start), is_integer(End) ->
        (get({This, '$class'})):ensureCapacity(This, (get({This, currentLength}) + ((End - Start)))),
        lists:foreach(fun(Index) ->
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), array:get(Index, CharArray), get({This, charArray})))
        end, lists:seq(Start, End - 1)),
        This.

appendbyte(This, B) when is_integer(B) ->
        (get({This, '$class'})):append(This, allbinary_java:to_string(B)),
        This.

appendshort(This, B) when is_integer(B) ->
        (get({This, '$class'})):append(This, allbinary_java:to_string(B)),
        This.

appendint(This, I) when is_integer(I) ->
        (get({This, '$class'})):append(This, allbinary_java:to_string(I)),
        This.

appendlong(This, L) when is_integer(L) ->
        (get({This, '$class'})):append(This, allbinary_java:to_string(L)),
        This.

appendfloat(This, F) when is_number(F) ->
        (get({This, '$class'})):append(This, allbinary_java:to_string(F)),
        This.

appendboolean(This, Bool) when is_boolean(Bool) ->
        case Bool of
            true ->
            (get({This, '$class'})):ensureCapacity(This, (get({This, currentLength}) + 4)),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $t, get({This, charArray}))),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $r, get({This, charArray}))),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $u, get({This, charArray}))),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $e, get({This, charArray})));
            false ->
            (get({This, '$class'})):ensureCapacity(This, (get({This, currentLength}) + 5)),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $f, get({This, charArray}))),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $a, get({This, charArray}))),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $l, get({This, charArray}))),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $s, get({This, charArray}))),
            put({This, charArray}, array:set(allbinary_java:first(get({This, currentLength}), put({This, currentLength}, get({This, currentLength}) + 1)), $e, get({This, charArray})))
        end,
        This.

ensureCapacity(This, MinSize) when is_integer(MinSize) ->
        OldCapacity = array:size(get({This, charArray})),
        case (MinSize > OldCapacity) of
            true ->
            put({local, newCapacity}, (OldCapacity * 3)),
            case (get({local, newCapacity}) < MinSize) of
                true ->
                put({local, newCapacity}, MinSize);
                false -> ok
            end,
            Copy = array:new(get({local, newCapacity}), {default, 0}),
            Min = (get({This, '$class'})):min(This, array:size(get({This, charArray})), get({local, newCapacity})),
            allbinary_java:array_copy(get({This, charArray}), 0, Copy, 0, Min),
            put({This, charArray}, Copy);
            false -> ok
        end.

min(This, Value, Value2) when is_integer(Value), is_integer(Value2) ->
        case ((Value =< Value2)) of true -> Value; false -> Value2 end.

delete(This, Start, End) when is_integer(Start), is_integer(End) ->
        put({This, currentLength}, (get({This, currentLength}) - ((End - Start)))),
        This.

length(This) ->
        get({This, currentLength}).

toString(This) ->
        allbinary_java:to_string(get({This, charArray}), 0, get({This, currentLength})).

