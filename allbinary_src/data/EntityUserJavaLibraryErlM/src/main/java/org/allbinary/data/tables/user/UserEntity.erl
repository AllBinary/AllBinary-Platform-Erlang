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
% package org.allbinary.data.tables.user
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.user.CreateUserFactory
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.modules.User
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.business.user.role.UserRoleFactory
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.control.crypt.SuperCrypt
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('UserEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UserEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "user"),
    put({This, 'COMMAND_SUCCESS_FOR_USER'}, "Command Success for user: "),
    put({This, 'PASSWORD_LABEL'}, " Password: "),
    put({This, 'EQUALS'}, "=="),
    put({This, 'COMMAND_SUCCESS_BUT_LOGIN_FAILED'}, "Command Success but login failed for user: "),
    put({This, 'INVALID_PASSWORD_LABEL'}, " Password: \n\""),
    put({This, 'NOT_EQUAL'}, "\"!=\""),
    put({This, 'END_QUOTES'}, get({'CommonSeps':getInstance(), 'QUOTE'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'UserDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'UserEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'UserEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

% throws Exception
getAdministrators(This) ->
        (get({This, '$class'})):getUsersWithRole(This, get({'UserRoleFactory':getInstance(), 'ADMINISTRATOR'})).

% throws Exception
getStoreManagers(This, StoreFrontInterface) ->
        KeysAndValues = (fun(Target_N67393) -> (get({Target_N67393, '$class'})):createHashMap(Target_N67393) end)('StdUtil':getInstance()),
        UsersVector = 'BasicArrayListD':new(),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'})), (fun(Target_N67516) -> (get({Target_N67516, '$class'})):toString(Target_N67516) end)(get({'UserRoleFactory':getInstance(), 'STOREMANAGER'}))),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'UserData', 'PERMISSIONS'}), (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)),
        UsersHashMapVector = 'AbSqlBean':getRows(This, KeysAndValues),
        Size = (get({UsersHashMapVector, '$class'})):size(UsersHashMapVector),
        lists:foreach(fun(I) ->
            UserHashMap = (get({UsersHashMapVector, '$class'})):get(UsersHashMapVector, I),
            case (UserHashMap =/= undefined) of
                true ->
                (get({UsersVector, '$class'})):add(UsersVector, 'User':new(UserHashMap));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        UsersVector.

% throws Exception
getCustomers(This) ->
        (get({This, '$class'})):getUsersWithRole(This, get({'UserRoleFactory':getInstance(), 'CUSTOMER'})).

% throws Exception
getUsersWithRole(This, UserRole) ->
        KeysAndValues = (fun(Target_N68067) -> (get({Target_N68067, '$class'})):createHashMap(Target_N68067) end)('StdUtil':getInstance()),
        UsersVector = 'BasicArrayListD':new(),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'})), (get({UserRole, '$class'})):toString(UserRole)),
        UsersHashMapVector = 'AbSqlBean':getRows(This, KeysAndValues),
        Size = (get({UsersHashMapVector, '$class'})):size(UsersHashMapVector),
        lists:foreach(fun(Index) ->
            UserHashMap = (get({UsersHashMapVector, '$class'})):get(UsersHashMapVector, Index),
            case (UserHashMap =/= undefined) of
                true ->
                (get({UsersVector, '$class'})):add(UsersVector, 'User':new(UserHashMap));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        UsersVector.

% throws Exception
getUsers(This, StoreFrontInterface) ->
        KeysAndValues = (fun(Target_N68594) -> (get({Target_N68594, '$class'})):createHashMap(Target_N68594) end)('StdUtil':getInstance()),
        UsersVector = 'BasicArrayListD':new(),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)),
        UsersHashMapVector = 'AbSqlBean':getRows(This, KeysAndValues),
        Size = (get({UsersHashMapVector, '$class'})):size(UsersHashMapVector),
        lists:foreach(fun(Index) ->
            UserHashMap = (get({UsersHashMapVector, '$class'})):get(UsersHashMapVector, Index),
            case (UserHashMap =/= undefined) of
                true ->
                (get({UsersVector, '$class'})):add(UsersVector, 'User':new(UserHashMap));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        UsersVector.

% throws Exception
getUser(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        try
        Row = (fun(Target_N69121) -> (get({Target_N69121, '$class'})):createHashMap(Target_N69121) end)('StdUtil':getInstance()),
        (get({Row, '$class'})):put(Row, get({'UserData', 'USERNAME'}), UserName),
        UserHashMap = 'AbSqlBean':getRow(This, Row),
        case (UserHashMap =/= undefined) of
            true ->
            throw({'$return', 'CreateUserFactory':getInstance(UserHashMap)});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

deleteWhere(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        try
            'AbSqlBean':deleteWhere(This, Key, Value),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "deleteWhere");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "deleteWhere", E);
                false -> ok
            end
        end.

login(This, UserName, Password) when (is_list(UserName) orelse UserName =:= undefined), (is_list(Password) orelse Password =:= undefined) ->
        try
        try
            put({local, isUserNameAndPasswordCorrect}, 0),
            Result = 'AbSqlBean':getField(This, get({'UserData', 'USERNAME'}), UserName, get({'UserData', 'PASSWORD'})),
            Encryption = 'AbSqlBean':getField(This, get({'UserData', 'USERNAME'}), UserName, get({'EntryData':getInstance(), 'ENCRYPTION'})),
            case ((Encryption =/= undefined) andalso ((get({Encryption, '$class'})):compareTo(Encryption, get({get({This, stringUtil}), 'EMPTY_STRING'})) =/= 0)) of
                true ->
                put({local, isUserNameAndPasswordCorrect}, (get({Result, '$class'})):compareTo(Result, (fun(Target_N70556) -> (get({Target_N70556, '$class'})):encrypt(Target_N70556, Password) end)('SuperCrypt':new((get({Encryption, '$class'})):intValue(Encryption)))));
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Command Success but login failed for user: ", UserName]), " because user did not exist"]), This, "login");
                    false -> ok
                end,
                throw({'$return', get({get({'UserEntity', 'GLOBALS2'}), 'LOGINFAILED'})})
            end,
            case (get({local, isUserNameAndPasswordCorrect}) =:= 0) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'COMMAND_SUCCESS_FOR_USER'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), UserName),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'PASSWORD_LABEL'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Password),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'EQUALS'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Result),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "login");
                    false -> ok
                end,
                throw({'$return', get({get({'UserEntity', 'GLOBALS2'}), 'LOGINSUCCESS'})});
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'COMMAND_SUCCESS_BUT_LOGIN_FAILED'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), UserName),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'INVALID_PASSWORD_LABEL'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (fun(Target_N70980) -> (get({Target_N70980, '$class'})):encrypt(Target_N70980, Password) end)('SuperCrypt':new((get({Encryption, '$class'})):intValue(Encryption)))),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'NOT_EQUAL'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Result),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'END_QUOTES'})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "login");
                    false -> ok
                end,
                throw({'$return', get({get({'UserEntity', 'GLOBALS2'}), 'LOGINFAILED'})})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "login", E);
                false -> ok
            end,
            "Error"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

update(This, UserName, UpdatedValues) when (is_list(UserName) orelse UserName =:= undefined) ->
        'AbSqlBean':updateWhere(This, get({'UserData', 'USERNAME'}), UserName, UpdatedValues).

dropTables(This) ->
        'AbSqlBean':dropTable(This).

createTableStatement(This) ->
        EntryData = 'EntryData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N72313) -> (get({Target_N72313, '$class'})):append(Target_N72313, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N72320) -> (get({Target_N72320, '$class'})):append(Target_N72320, get({'UserData', 'USERNAME'})) end)((fun(Target_N72327) -> (get({Target_N72327, '$class'})):append(Target_N72327, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N72334) -> (get({Target_N72334, '$class'})):append(Target_N72334, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N72341) -> (get({Target_N72341, '$class'})):append(Target_N72341, get({EntryData, 'LASTMODIFIED'})) end)((fun(Target_N72348) -> (get({Target_N72348, '$class'})):append(Target_N72348, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N72355) -> (get({Target_N72355, '$class'})):append(Target_N72355, get({EntryData, 'TIMECREATED'})) end)((fun(Target_N72362) -> (get({Target_N72362, '$class'})):append(Target_N72362, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72369) -> (get({Target_N72369, '$class'})):append(Target_N72369, get({EntryData, 'ENABLE'})) end)((fun(Target_N72376) -> (get({Target_N72376, '$class'})):append(Target_N72376, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N72383) -> (get({Target_N72383, '$class'})):append(Target_N72383, get({'UserData', 'PASSWORD'})) end)((fun(Target_N72390) -> (get({Target_N72390, '$class'})):append(Target_N72390, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72397) -> (get({Target_N72397, '$class'})):append(Target_N72397, get({'UserData', 'SECRET'})) end)((fun(Target_N72404) -> (get({Target_N72404, '$class'})):append(Target_N72404, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N72411) -> (get({Target_N72411, '$class'})):append(Target_N72411, get({EntryData, 'ENCRYPTION'})) end)((fun(Target_N72418) -> (get({Target_N72418, '$class'})):append(Target_N72418, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72425) -> (get({Target_N72425, '$class'})):append(Target_N72425, get({'UserData', 'PERMISSIONS'})) end)((fun(Target_N72432) -> (get({Target_N72432, '$class'})):append(Target_N72432, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})) end)((fun(Target_N72439) -> (get({Target_N72439, '$class'})):append(Target_N72439, get({'UserData', 'CONFIGURATION'})) end)((fun(Target_N72446) -> (get({Target_N72446, '$class'})):append(Target_N72446, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N72453) -> (get({Target_N72453, '$class'})):append(Target_N72453, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'}))) end)((fun(Target_N72460) -> (get({Target_N72460, '$class'})):append(Target_N72460, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72467) -> (get({Target_N72467, '$class'})):append(Target_N72467, get({'UserData', 'FAX'})) end)((fun(Target_N72474) -> (get({Target_N72474, '$class'})):append(Target_N72474, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72481) -> (get({Target_N72481, '$class'})):append(Target_N72481, get({'UserData', 'ELECTRONICDEVICE'})) end)((fun(Target_N72488) -> (get({Target_N72488, '$class'})):append(Target_N72488, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72495) -> (get({Target_N72495, '$class'})):append(Target_N72495, get({'UserData', 'OTHERCONTACT'})) end)((fun(Target_N72502) -> (get({Target_N72502, '$class'})):append(Target_N72502, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72509) -> (get({Target_N72509, '$class'})):append(Target_N72509, get({'UserData', 'WORKPHONE'})) end)((fun(Target_N72516) -> (get({Target_N72516, '$class'})):append(Target_N72516, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72523) -> (get({Target_N72523, '$class'})):append(Target_N72523, get({'UserData', 'CELLPHONE'})) end)((fun(Target_N72530) -> (get({Target_N72530, '$class'})):append(Target_N72530, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72537) -> (get({Target_N72537, '$class'})):append(Target_N72537, get({'UserData', 'HOMEPHONE'})) end)((fun(Target_N72544) -> (get({Target_N72544, '$class'})):append(Target_N72544, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72551) -> (get({Target_N72551, '$class'})):append(Target_N72551, get({'UserData', 'SECONDARYEMAIL'})) end)((fun(Target_N72558) -> (get({Target_N72558, '$class'})):append(Target_N72558, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N72565) -> (get({Target_N72565, '$class'})):append(Target_N72565, get({'UserData', 'MAINEMAIL'})) end)((fun(Target_N72572) -> (get({Target_N72572, '$class'})):append(Target_N72572, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72579) -> (get({Target_N72579, '$class'})):append(Target_N72579, get({'UserData', 'POSITIONATCOMPANY'})) end)((fun(Target_N72586) -> (get({Target_N72586, '$class'})):append(Target_N72586, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72593) -> (get({Target_N72593, '$class'})):append(Target_N72593, get({'UserData', 'COMPANY'})) end)((fun(Target_N72600) -> (get({Target_N72600, '$class'})):append(Target_N72600, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72607) -> (get({Target_N72607, '$class'})):append(Target_N72607, get({'UserData', 'SUFFIXNAME'})) end)((fun(Target_N72614) -> (get({Target_N72614, '$class'})):append(Target_N72614, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72621) -> (get({Target_N72621, '$class'})):append(Target_N72621, get({'UserData', 'MIDDLENAME'})) end)((fun(Target_N72628) -> (get({Target_N72628, '$class'})):append(Target_N72628, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72635) -> (get({Target_N72635, '$class'})):append(Target_N72635, get({'UserData', 'LASTNAME'})) end)((fun(Target_N72642) -> (get({Target_N72642, '$class'})):append(Target_N72642, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72649) -> (get({Target_N72649, '$class'})):append(Target_N72649, get({'UserData', 'FIRSTNAME'})) end)((fun(Target_N72656) -> (get({Target_N72656, '$class'})):append(Target_N72656, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N72663) -> (get({Target_N72663, '$class'})):append(Target_N72663, get({'UserData', 'PREFIXNAME'})) end)((fun(Target_N72670) -> (get({Target_N72670, '$class'})):append(Target_N72670, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N72677) -> (get({Target_N72677, '$class'})):append(Target_N72677, get({'UserData', 'USERNAME'})) end)((fun(Target_N72684) -> (get({Target_N72684, '$class'})):append(Target_N72684, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N72691) -> (get({Target_N72691, '$class'})):append(Target_N72691, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

