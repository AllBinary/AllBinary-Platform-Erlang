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
% package org.allbinary.data.tables.user.address
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.address.StreetAddressData
% import org.allbinary.data.tables.TableDataFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('StreetAddressesEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StreetAddressesEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, userName}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'UserDbInitInfo':new()),
        init_fields(This).

new(UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UserName),
    This.

init(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        'AbSqlBean':init(This, 'UserDbInitInfo':new()),
        init_fields(This),
        put({This, userName}, UserName).

remove(This, Index) ->
        try
            WhereHashMap = (fun(Target_N66294) -> (get({Target_N66294, '$class'})):createHashMap(Target_N66294) end)('StdUtil':getInstance()),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'UserData', 'USERNAME'}), get({This, userName})),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'StreetAddressData', 'ID'}), (get({Index, '$class'})):toString(Index)),
            'AbSqlBean':deleteWhere(This, WhereHashMap),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "remove");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "remove", E);
                false -> ok
            end
        end.

add(This, Address) ->
        (get({This, '$class'})):add(This, Address, get({'TableDataFactory':getInstance(), 'INTEGER_MAX_VALUE_STRING'})).

add(This, Address, Index) when (is_list(Index) orelse Index =:= undefined) ->
        try
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, Index),
            (get({Values, '$class'})):add(Values, get({This, userName})),
            (get({Values, '$class'})):add(Values, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            (get({Values, '$class'})):add(Values, (get({Address, '$class'})):getName(Address)),
            (get({Values, '$class'})):add(Values, (get({Address, '$class'})):getStreet(Address)),
            (get({Values, '$class'})):add(Values, (get({Address, '$class'})):getCity(Address)),
            (get({Values, '$class'})):add(Values, (get({Address, '$class'})):getState(Address)),
            (get({Values, '$class'})):add(Values, (get({Address, '$class'})):getCode(Address)),
            (get({Values, '$class'})):add(Values, (get({Address, '$class'})):getCountry(Address)),
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N67571) -> (get({Target_N67571, '$class'})):toString(Target_N67571) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            (get({Values, '$class'})):add(Values, Time),
            'AbSqlBean':insert(This, Values),
            (get({This, '$class'})):setDefault(This, (get({This, '$class'})):getLastId(This)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "add");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "add", E);
                false -> ok
            end
        end.

update(This, Address) ->
        try
            AddressHashMap = (get({Address, '$class'})):toHashMap(Address),
            WhereKeyValuePairs = (fun(Target_N68329) -> (get({Target_N68329, '$class'})):createHashMap(Target_N68329) end)('StdUtil':getInstance()),
            (get({WhereKeyValuePairs, '$class'})):put(WhereKeyValuePairs, get({'StreetAddressData', 'ID'}), (get({Address, '$class'})):getId(Address)),
            (get({WhereKeyValuePairs, '$class'})):put(WhereKeyValuePairs, get({'UserData', 'USERNAME'}), get({This, userName})),
            'AbSqlBean':updateWhere(This, WhereKeyValuePairs, AddressHashMap),
            (get({This, '$class'})):setDefault(This, (get({Address, '$class'})):getId(Address)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "update");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "add", E);
                false -> ok
            end
        end.

getLastId(This) ->
        'AbSqlBean':getLargestIntegerInColumnWhere(This, get({'StreetAddressData', 'ID'}), get({'UserData', 'USERNAME'}), get({This, userName})).

get(This) ->
        try
            StreetAddressVector = 'BasicArrayListD':new(),
            KeyAndValue = (fun(Target_N69231) -> (get({Target_N69231, '$class'})):createHashMap(Target_N69231) end)('StdUtil':getInstance()),
            (get({KeyAndValue, '$class'})):put(KeyAndValue, get({'UserData', 'USERNAME'}), get({This, userName})),
            AddressList = 'AbSqlBean':getRows(This, KeyAndValue),
            Size = (get({AddressList, '$class'})):size(AddressList),
            lists:foreach(fun(Index) ->
                AddressHashMap = (get({AddressList, '$class'})):get(AddressList, Index),
                StreetAddress = 'StreetAddress':new(AddressHashMap),
                case (StreetAddress =/= undefined) of
                    true ->
                    (get({StreetAddressVector, '$class'})):add(StreetAddressVector, StreetAddress);
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            StreetAddressVector
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end.

get(This, Index) ->
        try
        try
            KeyAndValue = (fun(Target_N70019) -> (get({Target_N70019, '$class'})):createHashMap(Target_N70019) end)('StdUtil':getInstance()),
            (get({KeyAndValue, '$class'})):put(KeyAndValue, get({'UserData', 'USERNAME'}), get({This, userName})),
            (get({KeyAndValue, '$class'})):put(KeyAndValue, get({'StreetAddressData', 'ID'}), (get({Index, '$class'})):toString(Index)),
            AddressHashMap = 'AbSqlBean':getRow(This, KeyAndValue),
            case (AddressHashMap =/= undefined) of
                true ->
                throw({'$return', 'StreetAddress':new(AddressHashMap)});
                false ->
                throw({'$return', undefined})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getDefault(This) ->
        try
        try
            put({local, addressHashMap}, (fun(Target_N70644) -> (get({Target_N70644, '$class'})):createHashMap(Target_N70644) end)('StdUtil':getInstance())),
            UpdateKeyAndValue = (fun(Target_N70695) -> (get({Target_N70695, '$class'})):createHashMap(Target_N70695) end)('StdUtil':getInstance()),
            (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'StreetAddressData', 'DEFAULT'}), get({'StreetAddressData', 'DEFAULT'})),
            (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'UserData', 'USERNAME'}), get({This, userName})),
            put({local, addressHashMap}, 'AbSqlBean':getRow(This, UpdateKeyAndValue)),
            case (get({local, addressHashMap}) =/= undefined) of
                true ->
                StreetAddress = 'StreetAddress':new(get({local, addressHashMap})),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "getDefault");
                    false -> ok
                end,
                throw({'$return', StreetAddress});
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "No Default Address Found", This, "getDefault");
                    false -> ok
                end,
                throw({'$return', undefined})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "getDefault", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setDefault(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
            UpdateKeyAndValue = (fun(Target_N71743) -> (get({Target_N71743, '$class'})):createHashMap(Target_N71743) end)('StdUtil':getInstance()),
            WhereKeyAndValue = (fun(Target_N71794) -> (get({Target_N71794, '$class'})):createHashMap(Target_N71794) end)('StdUtil':getInstance()),
            (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, get({'UserData', 'USERNAME'}), get({This, userName})),
            StreetAddress = (get({This, '$class'})):getDefault(This),
            case (StreetAddress =/= undefined) of
                true ->
                (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'StreetAddressData', 'DEFAULT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, get({'StreetAddressData', 'ID'}), (get({StreetAddress, '$class'})):getId(StreetAddress)),
                'AbSqlBean':updateWhere(This, WhereKeyAndValue, UpdateKeyAndValue);
                false -> ok
            end,
            (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, get({'StreetAddressData', 'ID'}), Value),
            (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'StreetAddressData', 'DEFAULT'}), get({'StreetAddressData', 'DEFAULT'})),
            'AbSqlBean':updateWhere(This, WhereKeyAndValue, UpdateKeyAndValue),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "setDefault");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "setShippingAddress", E);
                false -> ok
            end
        end.

getUserName(This) ->
        get({This, userName}).

createTableStatement(This) ->
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N72871) -> (get({Target_N72871, '$class'})):append(Target_N72871, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N72878) -> (get({Target_N72878, '$class'})):append(Target_N72878, get({'StreetAddressData', 'ID'})) end)((fun(Target_N72885) -> (get({Target_N72885, '$class'})):append(Target_N72885, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N72892) -> (get({Target_N72892, '$class'})):append(Target_N72892, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N72899) -> (get({Target_N72899, '$class'})):append(Target_N72899, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N72906) -> (get({Target_N72906, '$class'})):append(Target_N72906, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72913) -> (get({Target_N72913, '$class'})):append(Target_N72913, get({'StreetAddressData', 'COUNTRY'})) end)((fun(Target_N72920) -> (get({Target_N72920, '$class'})):append(Target_N72920, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72927) -> (get({Target_N72927, '$class'})):append(Target_N72927, get({'StreetAddressData', 'CODE'})) end)((fun(Target_N72934) -> (get({Target_N72934, '$class'})):append(Target_N72934, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72941) -> (get({Target_N72941, '$class'})):append(Target_N72941, get({'StreetAddressData', 'STATE'})) end)((fun(Target_N72948) -> (get({Target_N72948, '$class'})):append(Target_N72948, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72955) -> (get({Target_N72955, '$class'})):append(Target_N72955, get({'StreetAddressData', 'CITY'})) end)((fun(Target_N72962) -> (get({Target_N72962, '$class'})):append(Target_N72962, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72969) -> (get({Target_N72969, '$class'})):append(Target_N72969, get({'StreetAddressData', 'STREET'})) end)((fun(Target_N72976) -> (get({Target_N72976, '$class'})):append(Target_N72976, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N72983) -> (get({Target_N72983, '$class'})):append(Target_N72983, get({'StreetAddressData', 'NAME'})) end)((fun(Target_N72990) -> (get({Target_N72990, '$class'})):append(Target_N72990, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N72997) -> (get({Target_N72997, '$class'})):append(Target_N72997, get({'StreetAddressData', 'DEFAULT'})) end)((fun(Target_N73004) -> (get({Target_N73004, '$class'})):append(Target_N73004, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N73011) -> (get({Target_N73011, '$class'})):append(Target_N73011, get({'UserData', 'USERNAME'})) end)((fun(Target_N73018) -> (get({Target_N73018, '$class'})):append(Target_N73018, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL'})) end)((fun(Target_N73025) -> (get({Target_N73025, '$class'})):append(Target_N73025, get({'StreetAddressData', 'ID'})) end)((fun(Target_N73032) -> (get({Target_N73032, '$class'})):append(Target_N73032, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N73039) -> (get({Target_N73039, '$class'})):append(Target_N73039, (get({This, '$class'})):getTableName(This)) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

drop(This) ->
        'AbSqlBean':dropTable(This).

