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
% package org.allbinary.business.installer
% import java.util.HashMap
% import java.util.Map
% import java.util.Set
% import org.allbinary.business.init.db.DatabaseConnectionInfoInterface
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('InitializerDatabase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MAXDB'}, 30),
    put({?MODULE, 'MAX'}, 16),
    put({?MODULE, 'MIN'}, 4),
    put({?MODULE, 'MINPASSWORD'}, 0),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, adminDbUserName}, undefined),
    put({This, adminDbPassword}, undefined),
    put({This, adminJdbcDriver}, undefined),
    put({This, adminSchema}, undefined),
    put({This, adminServer}, undefined),
    put({This, adminPort}, undefined),
    put({This, initDb}, undefined),
    ok.


new(AbeClientInformation, Map) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, Map),
    This;
new(AbeClientInformation, InitHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, InitHashMap),
    This.

'$init'(This, AbeClientInformation, Map) ->
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        HashMap = (fun(Target_N66416) -> (get({Target_N66416, '$class'})):createHashMap(Target_N66416) end)('StdUtil':getInstance()),
        Keys = (get({Map, '$class'})):keySet(Map),
        KeyArray = (get({Keys, '$class'})):toArray(Keys),
        Size = array:size(KeyArray),
        lists:foreach(fun(Index) ->
            Key = array:get(Index, KeyArray),
            Values = (get({Map, '$class'})):get(Map, Key),
            (get({HashMap, '$class'})):put(HashMap, allbinary_java:to_string(Key), allbinary_java:to_string(array:get(0, Values))),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "key: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, Key),
            (get({StringBuffer, '$class'})):append(StringBuffer, " Value: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, array:get(0, Values)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "getFormData()")
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):getFormData(This, AbeClientInformation, HashMap);
'$init'(This, AbeClientInformation, InitHashMap) ->
    init_fields(This),
        (get({This, '$class'})):getFormData(This, AbeClientInformation, InitHashMap).


getFormData(This, AbeClientInformation, HashMap) ->
        try
            InitializerData = 'InitializerData':getInstance(),
            (get({This, '$class'})):setAdminDbUserName(This, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'DBUSER'}))),
            (get({This, '$class'})):setAdminDbPassword(This, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'DBPASSWORD'}))),
            (get({This, '$class'})):setAdminJdbcDriver(This, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'ADMINJDBCDRIVER'}))),
            (get({This, '$class'})):setAdminSchema(This, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'ADMINSCHEMA'}))),
            (get({This, '$class'})):setAdminServer(This, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'ADMINSERVER'}))),
            (get({This, '$class'})):setAdminPort(This, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'ADMINPORT'}))),
            DbConnectionInfo = 'DbConnectionInfo':new(),
            AdminDbName = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
            (get({DbConnectionInfo, '$class'})):setJdbcDriver(DbConnectionInfo, (get({This, '$class'})):getAdminJdbcDriver(This)),
            (get({DbConnectionInfo, '$class'})):setName(DbConnectionInfo, AdminDbName),
            (get({DbConnectionInfo, '$class'})):setUserName(DbConnectionInfo, (get({This, '$class'})):getAdminDbUserName(This)),
            (get({DbConnectionInfo, '$class'})):setPassword(DbConnectionInfo, (get({This, '$class'})):getAdminDbPassword(This)),
            (get({DbConnectionInfo, '$class'})):setSchema(DbConnectionInfo, (get({This, '$class'})):getAdminSchema(This)),
            (get({DbConnectionInfo, '$class'})):setServer(DbConnectionInfo, (get({This, '$class'})):getAdminServer(This)),
            (get({DbConnectionInfo, '$class'})):setPort(DbConnectionInfo, (get({This, '$class'})):getAdminPort(This)),
            put({This, initDb}, 'DynamicInitDb':new(AbeClientInformation, DbConnectionInfo))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to get form data", This, "getFormData()", E)
        end.

isJdbcDriverValid(This, JdbcDriverClassPathString) when (is_list(JdbcDriverClassPathString) orelse JdbcDriverClassPathString =:= undefined) ->
        try
            (fun(Target_N68318) -> (get({Target_N68318, '$class'})):newInstance(Target_N68318) end)('Class':forName(JdbcDriverClassPathString)),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRELOADERERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

isValid(This) ->
        put({local, isValid}, true),
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, adminJdbcDriver}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, adminDbUserName}), get({'InitializerDatabase', 'MIN'}), get({'InitializerDatabase', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, adminDbPassword}), get({'InitializerDatabase', 'MINPASSWORD'}), get({'InitializerDatabase', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        get({local, isValid}).

getJdbcDriverValidationInfo(This, JdbcDriver) when (is_list(JdbcDriver) orelse JdbcDriver =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "The JDBC driver ("),
        (get({StringBuffer, '$class'})):append(StringBuffer, JdbcDriver),
        (get({StringBuffer, '$class'})):append(StringBuffer, ") you have provided is not valid.<br/>"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getInvalidInfo(This) ->
        IsValid = true,
        put({local, isJdbcDriversValid}, true),
        StringBuffer = 'StringMaker':new(),
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, adminJdbcDriver}))) of
            true ->
            put({local, isJdbcDriversValid}, false),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getJdbcDriverValidationInfo(This, (get({This, '$class'})):getAdminJdbcDriver(This)));
            false -> ok
        end,
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, adminDbUserName}), get({'InitializerDatabase', 'MIN'}), get({'InitializerDatabase', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Admin username should be < ", get({'InitializerDatabase', 'MAX'})]), " and > "]), get({'InitializerDatabase', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, adminDbPassword}), get({'InitializerDatabase', 'MINPASSWORD'}), get({'InitializerDatabase', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Admin password should be < ", get({'InitializerDatabase', 'MAX'})]), " and > "]), get({'InitializerDatabase', 'MINPASSWORD'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not get({local, isJdbcDriversValid})) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N69922) -> (get({Target_N69922, '$class'})):getJdbcDriverSolutionInfo(Target_N69922) end)('InitializerData':getInstance()));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createUsers(This) ->
        try
            (get({get({This, initDb}), '$class'})):addUsers(get({This, initDb})),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to Create Users", This, "createUsers()", E),
            false
        end.

createDatabases(This) ->
        try
            (get({get({This, initDb}), '$class'})):addDatabases(get({This, initDb})),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to Create Databases", This, "createDatabases()", E),
            false
        end.

createTables(This) ->
        try
            (get({get({This, initDb}), '$class'})):addTables(get({This, initDb})),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to Create Tables", This, "createTables()", E),
            false
        end.

getAdminDbUserName(This) ->
        get({This, adminDbUserName}).

setAdminDbUserName(This, AdminDbUserName) when (is_list(AdminDbUserName) orelse AdminDbUserName =:= undefined) ->
        put({This, adminDbUserName}, AdminDbUserName).

getAdminDbPassword(This) ->
        get({This, adminDbPassword}).

setAdminDbPassword(This, AdminDbPassword) when (is_list(AdminDbPassword) orelse AdminDbPassword =:= undefined) ->
        put({This, adminDbPassword}, AdminDbPassword).

getAdminJdbcDriver(This) ->
        get({This, adminJdbcDriver}).

setAdminJdbcDriver(This, AdminJdbcDriver) when (is_list(AdminJdbcDriver) orelse AdminJdbcDriver =:= undefined) ->
        put({This, adminJdbcDriver}, AdminJdbcDriver).

getAdminSchema(This) ->
        get({This, adminSchema}).

setAdminSchema(This, AdminSchema) when (is_list(AdminSchema) orelse AdminSchema =:= undefined) ->
        put({This, adminSchema}, AdminSchema).

getAdminServer(This) ->
        get({This, adminServer}).

setAdminServer(This, AdminServer) when (is_list(AdminServer) orelse AdminServer =:= undefined) ->
        put({This, adminServer}, AdminServer).

getAdminPort(This) ->
        get({This, adminPort}).

setAdminPort(This, AdminPort) when (is_list(AdminPort) orelse AdminPort =:= undefined) ->
        put({This, adminPort}, AdminPort).

