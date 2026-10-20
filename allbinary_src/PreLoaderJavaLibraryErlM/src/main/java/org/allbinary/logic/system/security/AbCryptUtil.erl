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
% package org.allbinary.logic.system.security
% import java.io.ByteArrayOutputStream
% import java.io.InputStream
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.system.security.crypt.jcehelper.AbCrypt
% import org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory

-module('AbCryptUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbCryptUtil':new()),
    ok.

init_fields(This) ->
    put({This, streamUtil}, 'StreamUtil':getInstance()),
    ok.


getInstance() ->
        get({'AbCryptUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
decrypt(This, InputStream, Key) when (is_list(Key) orelse Key =:= undefined) ->
        put({local, outputStream}, undefined),
        try
            put({local, outputStream}, (get({get({This, streamUtil}), '$class'})):get(get({This, streamUtil}), InputStream, 'ByteArrayOutputStream':new(), array:new(16384, {default, 0}))),
            AbCrypt = 'AbCrypt':new(get({'KeySpecFactory':getInstance(), 'DESEDE'})),
            (get({AbCrypt, '$class'})):init(AbCrypt, Key),
            (get({AbCrypt, '$class'})):decrypt(AbCrypt, (get({get({local, outputStream}), '$class'})):toByteArray(get({local, outputStream})))
        after
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), get({local, outputStream})),
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), InputStream)
        end.

