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
% package org.allbinary.business.context.modules.storefronts
% import java.util.HashMap
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.init.InitSql
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('BasicStoreFrontsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitSql', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "storefronts"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'InitSql':'$init'(This, 'UserDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTable(This, get({This, tableName})).

% throws Exception
getStoreFrontInterface(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        KeysAndValues = (fun(Target_N65967) -> (get({Target_N65967, '$class'})):createHashMap(Target_N65967) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), Name),
        StoreHashMap = 'InitSql':getRow(This, KeysAndValues),
        case (StoreHashMap =:= undefined) of
            true ->
            erlang:error({'Exception', lists:concat(["No Such Store: ", Name])});
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'FACTORYERROR'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["StoreFront: ", (get({StoreHashMap, '$class'})):toString(StoreHashMap)]), This, "getStore()");
            false -> ok
        end,
        'BasicStoreFront':new(StoreHashMap).

