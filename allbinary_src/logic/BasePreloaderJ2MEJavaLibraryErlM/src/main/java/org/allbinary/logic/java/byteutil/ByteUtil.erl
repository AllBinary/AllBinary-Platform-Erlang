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
% package org.allbinary.logic.java.byteutil

-module('ByteUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ByteUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ByteUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

'xor'(This, Array, Mask) when (is_tuple(Array) orelse Array =:= undefined), is_integer(Mask) ->
        Bytes = array:new(array:size(Array), {default, 0}),
        Size = array:size(Array),
        put({local, index}, 0),
        put({local, currentByte}, 0),
        (fun Loop() -> case (get({local, index}) < Size) of true ->
            put({local, currentByte}, array:get(get({local, index}), Array)),
            array:set(get({local, index}), ((get({local, currentByte}) bxor Mask)), Bytes),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        Bytes.

'not'(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        Bytes = array:new(array:size(Array), {default, 0}),
        Size = array:size(Array),
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) < Size) of true ->
            array:set(get({local, index}), (bnot array:get(get({local, index}), Array)), Bytes),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        Bytes.

xorByte(This, Array, Index) when (is_tuple(Array) orelse Array =:= undefined), is_integer(Index) ->
        put({local, mask}, 0),
        case (Index =:= 0) of
            true ->
            put({local, mask}, 1);
            false -> ok
        end,
        case (Index =:= 1) of
            true ->
            put({local, mask}, 2);
            false -> ok
        end,
        case (Index =:= 2) of
            true ->
            put({local, mask}, 4);
            false -> ok
        end,
        case (Index =:= 3) of
            true ->
            put({local, mask}, 8);
            false -> ok
        end,
        case (Index =:= 4) of
            true ->
            put({local, mask}, 16);
            false -> ok
        end,
        case (Index =:= 5) of
            true ->
            put({local, mask}, 32);
            false -> ok
        end,
        case (Index =:= 6) of
            true ->
            put({local, mask}, 64);
            false -> ok
        end,
        case (Index =:= 7) of
            true ->
            put({local, mask}, (-127));
            false -> ok
        end,
        (get({This, '$class'})):'xor'(This, Array, get({local, mask})).

compare(This, NewByteArray, OldByteArray) when (is_tuple(NewByteArray) orelse NewByteArray =:= undefined), (is_tuple(OldByteArray) orelse OldByteArray =:= undefined) ->
        try
        case (array:size(NewByteArray) =/= array:size(OldByteArray)) of
            true ->
            throw({'$return', false});
            false ->
            ok
        end,
        Size = array:size(NewByteArray),
        lists:foreach(fun(Index) ->
            case (array:get(Index, NewByteArray) =/= array:get(Index, OldByteArray)) of
                true ->
                throw({'$return', false});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

compareWithStats(This, NewByteArray, NewSize, OldByteArray, Stats) when (is_tuple(NewByteArray) orelse NewByteArray =:= undefined), is_integer(NewSize), (is_tuple(OldByteArray) orelse OldByteArray =:= undefined), (is_tuple(Stats) orelse Stats =:= undefined) ->
        try
        case (NewSize =/= array:size(OldByteArray)) of
            true ->
            array:set(0, (-1), Stats),
            array:set(2, NewSize, Stats),
            array:set(3, array:size(OldByteArray), Stats),
            throw({'$return', false});
            false ->
            array:set(0, NewSize, Stats)
        end,
        array:set(1, 0, Stats),
        Size = NewSize,
        lists:foreach(fun(Index) ->
            case (array:get(Index, NewByteArray) =/= array:get(Index, OldByteArray)) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            array:set(1, array:get(1, Stats) + 1, Stats)
        end, lists:seq(0, Size - 1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

