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
% package org.allbinary.logic.system.security.crypt.jcehelper
% import org.allbinary.TsUtil
% import org.allbinary.init.crypt.jcehelper.CryptInterface
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.java.byteutil.ByteUtil
% import org.allbinary.string.CommonStrings

-module('BasicCrypt').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CryptInterface

init_fields(This) ->
    put({This, byteUtil}, 'ByteUtil':getInstance()),
    put({This, key}, undefined),
    ok.


new(KeyAsString) when (is_list(KeyAsString) orelse KeyAsString =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, KeyAsString),
    This.

init(This, KeyAsString) when (is_list(KeyAsString) orelse KeyAsString =:= undefined) ->
    init_fields(This),
        put({local, key}, get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})),
        try
            put({local, key}, (fun(Target_N65956) -> (get({Target_N65956, '$class'})):getByteArray(Target_N65956, KeyAsString) end)('TsUtil':getInstance()))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, "AbCrypt(alg,key)", E)
        end,
        put({This, key}, get({local, key})).

encrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        try
            (get({This, '$class'})):mutilate(This, Array)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("Encrypt Failed", This, "encrypt", E),
            get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})
        end.

decrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        try
            (get({This, '$class'})):mutilate(This, Array)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("decrypt Failed", This, "decrypt", E),
            get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})
        end.

mutilate(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        put({local, array}, Array),
        put({local, value}, 0),
        lists:foreach(fun(Index) ->
            put({local, value}, array:get(Index, get({This, key}))),
            put({local, array}, (get({get({This, byteUtil}), '$class'})):'xor'(get({This, byteUtil}), get({local, array}), get({local, value})))
        end, lists:seq(0, array:size(get({This, key})) - 1)),
        get({local, array}).

