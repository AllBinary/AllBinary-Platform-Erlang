% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import javax.crypto.Cipher
% import javax.crypto.SecretKey
% import org.allbinary.logic.java.byteutil.ByteUtil

-module('SecretComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseSecretComposite', Function, Arguments).

init_fields(This) ->
    put({This, byteUtil}, 'ByteUtil':getInstance()),
    put({This, cipher}, undefined),
    put({This, secretKey}, undefined),
    put({This, key}, undefined),
    ok.


new(SecretKey, Cipher, Key) when (is_tuple(Key) orelse Key =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SecretKey, Cipher, Key),
    This.

init(This, SecretKey, Cipher, Key) when (is_tuple(Key) orelse Key =:= undefined) ->
    'BaseSecretComposite':init(This),
    init_fields(This),
        put({This, secretKey}, SecretKey),
        put({This, cipher}, Cipher),
        put({This, key}, Key).

% throws Exception
encrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        put({local, array}, Array),
        put({local, array}, (get({This, '$class'})):mutilate(This, get({local, array}))),
        (get({get({This, cipher}), '$class'})):init(get({This, cipher}), get({'Cipher', 'ENCRYPT_MODE'}), get({This, secretKey})),
        (get({get({This, cipher}), '$class'})):doFinal(get({This, cipher}), get({local, array})).

% throws Exception
decrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        (get({get({This, cipher}), '$class'})):init(get({This, cipher}), get({'Cipher', 'DECRYPT_MODE'}), get({This, secretKey})),
        (get({This, '$class'})):mutilate(This, (get({get({This, cipher}), '$class'})):doFinal(get({This, cipher}), Array)).

mutilate(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        put({local, array}, Array),
        lists:foreach(fun(Index) ->
            Value = array:get(Index, get({This, key})),
            case ((Value < 8) andalso (Value > 0)) of
                true ->
                put({local, array}, (get({get({This, byteUtil}), '$class'})):xorByte(get({This, byteUtil}), get({local, array}), Value));
                false -> ok
            end
        end, lists:seq(0, array:size(get({This, key})) - 1)),
        get({local, array}).

