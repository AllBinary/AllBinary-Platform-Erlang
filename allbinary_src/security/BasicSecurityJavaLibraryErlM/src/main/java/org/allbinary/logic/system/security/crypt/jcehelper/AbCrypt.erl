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
% import java.security.Security
% import java.security.spec.KeySpec
% import javax.crypto.Cipher
% import javax.crypto.SecretKey
% import javax.crypto.SecretKeyFactory
% import org.allbinary.TsUtil
% import org.allbinary.init.crypt.jcehelper.CryptInterface
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings
% import org.bouncycastle.jce.provider.BouncyCastleProvider

-module('AbCrypt').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CryptInterface

init_fields(This) ->
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, secretComposite}, get({'BaseSecretComposite', 'NULL_SECRET_COMPOSITE'})),
    put({This, algorithm}, undefined),
    ok.


new(Algorithm) when (is_list(Algorithm) orelse Algorithm =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Algorithm),
    This.

'$init'(This, Algorithm) when (is_list(Algorithm) orelse Algorithm =:= undefined) ->
    init_fields(This),
        put({This, algorithm}, Algorithm).

init(This, KeyAsString) when (is_list(KeyAsString) orelse KeyAsString =:= undefined) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            try
                'Security':addProvider('BouncyCastleProvider':new())
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'INIT'}), E)
            end,
            Key = (get({get({This, tsUtil}), '$class'})):getByteArray(get({This, tsUtil}), KeyAsString),
            KeySpec = (fun(Target_N66387) -> (get({Target_N66387, '$class'})):getInstance(Target_N66387, get({This, algorithm}), Key) end)('KeySpecFactory':getInstance()),
            KeyFactory = 'SecretKeyFactory':getInstance(get({This, algorithm})),
            SecretKey = (get({KeyFactory, '$class'})):generateSecret(KeyFactory, KeySpec),
            Cipher = 'Cipher':getInstance(get({This, algorithm})),
            put({This, secretComposite}, 'SecretComposite':new(SecretKey, Cipher, Key))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("init Failed", This, get({CommonStrings, 'INIT'}), E)
        end.

encrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        try
            (get({get({This, secretComposite}), '$class'})):encrypt(get({This, secretComposite}), Array)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("Encrypt Failed", This, "encrypt", E),
            get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})
        end.

decrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        try
            (get({get({This, secretComposite}), '$class'})):decrypt(get({This, secretComposite}), Array)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("decrypt Failed", This, "decrypt", E),
            get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})
        end.

