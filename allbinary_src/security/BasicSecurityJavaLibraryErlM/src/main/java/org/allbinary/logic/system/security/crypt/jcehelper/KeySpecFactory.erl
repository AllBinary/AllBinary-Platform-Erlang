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
% import java.security.spec.KeySpec
% import javax.crypto.spec.DESKeySpec
% import javax.crypto.spec.DESedeKeySpec
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings

-module('KeySpecFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'KeySpecFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'DES'}, "DES"),
    put({This, 'DESEDE'}, "DESede"),
    put({This, 'BLOWFISH'}, "Blowfish"),
    ok.


getInstance() ->
        get({'KeySpecFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance(This, Algorithm, KeyData) when (is_list(Algorithm) orelse Algorithm =:= undefined), (is_tuple(KeyData) orelse KeyData =:= undefined) ->
        try
        try
            TsUtil = 'TsUtil':getInstance(),
            case ((get({TsUtil, '$class'})):compareTo(TsUtil, Algorithm, get({This, 'DES'})) =:= 0) of
                true ->
                throw({'$return', 'DESKeySpec':new(KeyData)});
                false ->
                case ((get({TsUtil, '$class'})):compareTo(TsUtil, Algorithm, get({This, 'DESEDE'})) =:= 0) of
                true ->
                throw({'$return', 'DESedeKeySpec':new(KeyData)});
                false ->
                erlang:error({'RuntimeException'})
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E),
            erlang:error({'RuntimeException'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

