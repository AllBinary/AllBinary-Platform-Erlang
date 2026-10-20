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
% package org.allbinary.init.crypt.jcehelper
% import java.io.ByteArrayInputStream
% import java.io.ByteArrayOutputStream
% import java.io.InputStream
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('BasicCryptUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicCryptUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, 'XML_START'}, "<?xml"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicCryptUtil', instance}).

% throws Exception
getDecryptedInputStream(This, InputStream, CryptInterface) ->
        Buffer = 'ByteArrayOutputStream':new(),
        put({local, ch}, 0),
        (fun Loop() -> case true of true ->
            put({local, ch}, (get({InputStream, '$class'})):read(InputStream)),
            case (get({local, ch}) =:= (-1)) of
                true ->
                throw('$break');
                false -> ok
            end,
            (get({Buffer, '$class'})):write(Buffer, get({local, ch})),
            Loop();
        false -> ok end end)(),
        Decrypted = (get({CryptInterface, '$class'})):decrypt(CryptInterface, (get({Buffer, '$class'})):toByteArray(Buffer)),
        put({local, decryptedString}, allbinary_java:to_string(Decrypted)),
        Index = allbinary_java:index_of(get({local, decryptedString}), get({This, 'XML_START'})),
        case (Index > 0) of
            true ->
            put({local, decryptedString}, string:slice(get({local, decryptedString}), Index));
            false -> ok
        end,
        'ByteArrayInputStream':new((get({get({This, tsUtil}), '$class'})):getByteArray(get({This, tsUtil}), get({local, decryptedString}))).

