% Generated Code Do Not Modify
% package org.allbinary.util
% import jsinterop.annotations.JsType
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('BasicArrayList').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SIZE'}, ", Size: "),
    ok.

init_fields(This) ->
    put({This, arrayUtil}, 'ArrayUtil':getInstance()),
    put({This, objectArray}, undefined),
    put({This, currentIndex}, 0),
    ok.


new(ObjectArray) when (is_tuple(ObjectArray) orelse ObjectArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ObjectArray),
    This.

init(This, ObjectArray) when (is_tuple(ObjectArray) orelse ObjectArray =:= undefined) ->
    init_fields(This),
        put({This, objectArray}, ObjectArray).

addAt(This, Index, Element) when is_integer(Index) ->
        case ((Index > get({This, currentIndex})) orelse (Index < 0)) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'INDEX_LABEL'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'BasicArrayList', 'SIZE'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, currentIndex})),
            erlang:error({'IndexOutOfBoundsException', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false -> ok
        end,
        (get({This, '$class'})):ensureCapacity(This, (get({This, currentIndex}) + 1)),
        allbinary_java:array_copy(get({This, objectArray}), Index, get({This, objectArray}), (Index + 1), (get({This, currentIndex}) - Index)),
        put({This, objectArray}, array:set(Index, Element, get({This, objectArray}))),
        put({This, currentIndex}, get({This, currentIndex}) + 1).

add(This, AnyType) ->
        (get({This, '$class'})):ensureCapacity(This, (get({This, currentIndex}) + 1)),
        put({This, objectArray}, array:set(allbinary_java:first(get({This, currentIndex}), put({This, currentIndex}, get({This, currentIndex}) + 1)), AnyType, get({This, objectArray}))),
        true.

removeAt(This, Index) when is_integer(Index) ->
        case (Index >= get({This, currentIndex})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'INDEX_LABEL'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'BasicArrayList', 'SIZE'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, currentIndex})),
            erlang:error({'IndexOutOfBoundsException', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false -> ok
        end,
        OldValue = array:get(Index, get({This, objectArray})),
        NumMoved = ((get({This, currentIndex}) - Index) - 1),
        case (NumMoved > 0) of
            true ->
            allbinary_java:array_copy(get({This, objectArray}), (Index + 1), get({This, objectArray}), Index, NumMoved);
            false -> ok
        end,
        put({This, currentIndex}) end, get({This, objectArray}, array:set(begin put({This, currentIndex}, get({This, currentIndex}) - 1), undefined, get({This, currentIndex}) end, get({This, objectArray}))),
        OldValue.

remove(This, AnyType) ->
        try
        case (AnyType =:= undefined) of
            true ->
            lists:foreach(fun(Index) ->
                case (array:get(Index, get({This, objectArray})) =:= undefined) of
                    true ->
                    put({local, numMoved}, ((get({This, currentIndex}) - Index) - 1)),
                    case (get({local, numMoved}) > 0) of
                        true ->
                        allbinary_java:array_copy(get({This, objectArray}), (Index + 1), get({This, objectArray}), Index, get({local, numMoved}));
                        false -> ok
                    end,
                    put({This, currentIndex}) end, get({This, objectArray}, array:set(begin put({This, currentIndex}, get({This, currentIndex}) - 1), undefined, get({This, currentIndex}) end, get({This, objectArray}))),
                    throw({'$return', true});
                    false -> ok
                end
            end, lists:seq(0, get({This, currentIndex}) - 1));
            false ->
            lists:foreach(fun(Index) ->
                case ((AnyType =:= array:get(Index, get({This, objectArray}))) orelse (get({AnyType, '$class'})):equals(AnyType, array:get(Index, get({This, objectArray})))) of
                    true ->
                    put({local, numMoved}, ((get({This, currentIndex}) - Index) - 1)),
                    case (get({local, numMoved}) > 0) of
                        true ->
                        allbinary_java:array_copy(get({This, objectArray}), (Index + 1), get({This, objectArray}), Index, get({local, numMoved}));
                        false -> ok
                    end,
                    put({This, currentIndex}) end, get({This, objectArray}, array:set(begin put({This, currentIndex}, get({This, currentIndex}) - 1), undefined, get({This, currentIndex}) end, get({This, objectArray}))),
                    throw({'$return', true});
                    false -> ok
                end
            end, lists:seq(0, get({This, currentIndex}) - 1))
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

removeAll2(This, List) ->
        put({local, result}, true),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            case (get({This, '$class'})):remove(This, (get({List, '$class'})):get(List, Index)) of
                true ->
                ok;
                false ->
                put({local, result}, false)
            end
        end, lists:seq(0, Size - 1)),
        get({local, result}).

addAll2(This, List) ->
        (get({This, '$class'})):ensureCapacity(This, (get({This, currentIndex}) + get({List, currentIndex}))),
        ListSize = get({List, currentIndex}),
        lists:foreach(fun(Index) ->
            put({This, objectArray}, array:set(allbinary_java:first(get({This, currentIndex}), put({This, currentIndex}, get({This, currentIndex}) + 1)), array:get(Index, get({List, objectArray})), get({This, objectArray})))
        end, lists:seq(0, ListSize - 1)),
        true.

addAllList(This, List) ->
        NewObjectArray = (get({List, '$class'})):toArray(List),
        (get({This, '$class'})):addAll(This, NewObjectArray).

addAll(This, NewObjectArray) when (is_tuple(NewObjectArray) orelse NewObjectArray =:= undefined) ->
        NumSize = array:size(NewObjectArray),
        (get({This, '$class'})):ensureCapacity(This, (get({This, currentIndex}) + NumSize)),
        allbinary_java:array_copy(NewObjectArray, 0, get({This, objectArray}), get({This, currentIndex}), NumSize),
        put({This, currentIndex}, (get({This, currentIndex}) + NumSize)),
        (NumSize =/= 0).

ensureCapacity(This, MinSize) when is_integer(MinSize) ->
        OldCapacity = array:size(get({This, objectArray})),
        case (MinSize > OldCapacity) of
            true ->
            put({local, newCapacity}, (((((OldCapacity * 3)) bsr 1)) + 1)),
            case (get({local, newCapacity}) < MinSize) of
                true ->
                put({local, newCapacity}, MinSize);
                false -> ok
            end,
            put({This, objectArray}, (get({get({This, arrayUtil}), '$class'})):copyOf(get({This, arrayUtil}), get({This, objectArray}), get({local, newCapacity})));
            false -> ok
        end.

trimToSize(This) ->
        OldCapacity = array:size(get({This, objectArray})),
        case (get({This, currentIndex}) < OldCapacity) of
            true ->
            put({This, objectArray}, (get({get({This, arrayUtil}), '$class'})):copyOf(get({This, arrayUtil}), get({This, objectArray}), get({This, currentIndex})));
            false -> ok
        end.

indexOf(This, AnyType) ->
        try
        case (AnyType =:= undefined) of
            true ->
            lists:foreach(fun(I) ->
                case (array:get(I, get({This, objectArray})) =:= undefined) of
                    true ->
                    throw({'$return', I});
                    false -> ok
                end
            end, lists:seq(0, get({This, currentIndex}) - 1));
            false ->
            lists:foreach(fun(I) ->
                case (get({AnyType, '$class'})):equals(AnyType, array:get(I, get({This, objectArray}))) of
                    true ->
                    throw({'$return', I});
                    false -> ok
                end
            end, lists:seq(0, get({This, currentIndex}) - 1))
        end,
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

lastIndexOf(This, AnyType) ->
        try
        case (AnyType =:= undefined) of
            true ->
            lists:foreach(fun(I) ->
                case (array:get(I, get({This, objectArray})) =:= undefined) of
                    true ->
                    throw({'$return', I});
                    false -> ok
                end
            end, lists:seq((get({This, currentIndex}) - 1), 0, -1));
            false ->
            lists:foreach(fun(I) ->
                case (get({AnyType, '$class'})):equals(AnyType, array:get(I, get({This, objectArray}))) of
                    true ->
                    throw({'$return', I});
                    false -> ok
                end
            end, lists:seq((get({This, currentIndex}) - 1), 0, -1))
        end,
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

get(This, Index) when is_integer(Index) ->
        case (Index >= get({This, currentIndex})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'INDEX_LABEL'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'BasicArrayList', 'SIZE'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, currentIndex})),
            erlang:error({'IndexOutOfBoundsException', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false -> ok
        end,
        array:get(Index, get({This, objectArray})).

set(This, Index, Element) when is_integer(Index) ->
        case (Index >= get({This, currentIndex})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'INDEX_LABEL'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'BasicArrayList', 'SIZE'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, currentIndex})),
            erlang:error({'IndexOutOfBoundsException', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false -> ok
        end,
        OldValue = array:get(Index, get({This, objectArray})),
        put({This, objectArray}, array:set(Index, Element, get({This, objectArray}))),
        OldValue.

clear(This) ->
        lists:foreach(fun(I) ->
            put({This, objectArray}, array:set(I, undefined, get({This, objectArray})))
        end, lists:seq(0, get({This, currentIndex}) - 1)),
        put({This, currentIndex}, 0).

size(This) ->
        get({This, currentIndex}).

isEmpty(This) ->
        (get({This, currentIndex}) =:= 0).

contains(This, AnyType) ->
        ((get({This, '$class'})):indexOf(This, AnyType) >= 0).

toArray(This) ->
        (get({get({This, arrayUtil}), '$class'})):copyOf(get({This, arrayUtil}), get({This, objectArray}), get({This, currentIndex})).

toArrayType(This, ObjectArray) when (is_tuple(ObjectArray) orelse ObjectArray =:= undefined) ->
        try
        case (array:size(ObjectArray) < get({This, currentIndex})) of
            true ->
            throw({'$return', (get({get({This, arrayUtil}), '$class'})):copyOfType(get({This, arrayUtil}), get({This, objectArray}), get({This, currentIndex}), get({ObjectArray, '$class'}))});
            false -> ok
        end,
        allbinary_java:array_copy(get({This, objectArray}), 0, ObjectArray, 0, get({This, currentIndex})),
        case (array:size(ObjectArray) > get({This, currentIndex})) of
            true ->
            array:set(get({This, currentIndex}), undefined, ObjectArray);
            false -> ok
        end,
        ObjectArray
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

clone(This) ->
        Size = (get({This, '$class'})):size(This),
        List = 'BasicArrayListS':new(Size),
        put({local, anyType}, undefined),
        lists:foreach(fun(Index) ->
            put({local, anyType}, array:get(Index, get({This, objectArray}))),
            (get({List, '$class'})):add(List, get({local, anyType}))
        end, lists:seq(0, Size - 1)),
        List.

toString(This) ->
        COMMA_SEP = get({'CommonSeps':getInstance(), 'COMMA_SEP'}),
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N72585) -> (get({Target_N72585, '$class'})):toString(Target_N72585) end)(array:get(Index, get({This, objectArray})))),
            (get({StringBuffer, '$class'})):append(StringBuffer, COMMA_SEP)
        end, lists:seq(0, get({This, currentIndex}) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

