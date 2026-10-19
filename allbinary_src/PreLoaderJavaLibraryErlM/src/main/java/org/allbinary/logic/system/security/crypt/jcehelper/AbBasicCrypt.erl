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
% import java.security.Provider
% import java.security.Security
% import java.security.spec.KeySpec
% import javax.crypto.Cipher
% import javax.crypto.SecretKey
% import javax.crypto.SecretKeyFactory
% import org.allbinary.init.crypt.jcehelper.CryptInterface
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings

-module('AbBasicCrypt').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CryptInterface

init_fields(This) ->
    put({This, cipher}, undefined),
    put({This, secretKey}, undefined),
    put({This, algorithm}, undefined),
    put({This, key}, undefined),
    ok.


new(Algorithm, Key) when (is_list(Algorithm) orelse Algorithm =:= undefined), (is_list(Key) orelse Key =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Algorithm, Key),
    This.

init(This, Algorithm, Key) when (is_list(Algorithm) orelse Algorithm =:= undefined), (is_list(Key) orelse Key =:= undefined) ->
    init_fields(This),
        try
            put({This, algorithm}, Algorithm),
            put({This, key}, (get({Key, '$class'})):getBytes(Key)),
            (get({This, '$class'})):init(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, "AbCrypt(alg,key)", E)
        end.

init(This) ->
        try
            SunJce = 'SunJCE':new(),
            'Security':addProvider(SunJce),
            KeySpec = (fun(Target_N66371) -> (get({Target_N66371, '$class'})):getInstance(Target_N66371, get({This, algorithm}), get({This, key})) end)('KeySpecFactory':getInstance()),
            KeyFactory = 'SecretKeyFactory':getInstance(get({This, algorithm})),
            put({This, secretKey}, (get({KeyFactory, '$class'})):generateSecret(KeyFactory, KeySpec)),
            put({This, cipher}, 'Cipher':getInstance(get({This, algorithm})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE("init Failed", This, get({CommonStrings, 'INIT'}), E)
        end.

encrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        try
            (get({get({This, cipher}), '$class'})):init(get({This, cipher}), get({'Cipher', 'ENCRYPT_MODE'}), get({This, secretKey})),
            IvArray = (get({get({This, secretKey}), '$class'})):getEncoded(get({This, secretKey})),
            Encrypted = (get({get({This, cipher}), '$class'})):doFinal(get({This, cipher}), Array),
            Result = array:new((array:size(IvArray) + array:size(Encrypted)), {default, 0}),
            'PreLogUtil':put(lists:concat(["ivArray Length: ", array:size(IvArray)]), This, "encrypt"),
            lists:foreach(fun(Index) ->
                array:set(Index, array:get(Index, IvArray), Result)
            end, lists:seq(0, array:size(IvArray) - 1)),
            lists:foreach(fun(Index) ->
                array:set((Index + array:size(IvArray)), array:get(Index, Encrypted), Result)
            end, lists:seq(0, array:size(Encrypted) - 1)),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("Encrypt Failed", This, "encrypt", E),
            undefined
        end.

decrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        try
            (get({get({This, cipher}), '$class'})):init(get({This, cipher}), get({'Cipher', 'DECRYPT_MODE'}), get({This, secretKey})),
            IvArray = array:new(8, {default, 0}),
            lists:foreach(fun(Index) ->
                array:set(Index, array:get(Index, Array), IvArray)
            end, lists:seq(0, 8 - 1)),
            'PreLogUtil':put(lists:concat(["ivArray Length: ", array:size(IvArray)]), This, "encrypt"),
            Result = array:new((array:size(Array) - array:size(IvArray)), {default, 0}),
            lists:foreach(fun(Index) ->
                array:set((Index - array:size(IvArray)), array:get(Index, Array), Result)
            end, lists:seq(array:size(IvArray), array:size(Array) - 1)),
            Decrypted = (get({get({This, cipher}), '$class'})):doFinal(get({This, cipher}), Result),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("decrypt Failed", This, "decrypt", E),
            undefined
        end.

