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
% import org.allbinary.business.init.db.HistoryDbInitInfo
% import org.allbinary.business.init.db.InventoryDbInitInfo
% import org.allbinary.business.init.db.LogDbInitInfo
% import org.allbinary.business.init.db.StaticPagesDbInitInfo
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings

-module('Initializer').
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
    put({This, userJdbcDriver}, undefined),
    put({This, userName}, undefined),
    put({This, userUserName}, undefined),
    put({This, userPassword}, undefined),
    put({This, userSchema}, undefined),
    put({This, userServer}, undefined),
    put({This, userPort}, undefined),
    put({This, historyJdbcDriver}, undefined),
    put({This, historyName}, undefined),
    put({This, historyUserName}, undefined),
    put({This, historyPassword}, undefined),
    put({This, historySchema}, undefined),
    put({This, historyServer}, undefined),
    put({This, historyPort}, undefined),
    put({This, logJdbcDriver}, undefined),
    put({This, logName}, undefined),
    put({This, logUserName}, undefined),
    put({This, logPassword}, undefined),
    put({This, logSchema}, undefined),
    put({This, logServer}, undefined),
    put({This, logPort}, undefined),
    put({This, inventoryJdbcDriver}, undefined),
    put({This, inventoryName}, undefined),
    put({This, inventoryUserName}, undefined),
    put({This, inventoryPassword}, undefined),
    put({This, inventorySchema}, undefined),
    put({This, inventoryServer}, undefined),
    put({This, inventoryPort}, undefined),
    put({This, staticPagesJdbcDriver}, undefined),
    put({This, staticPagesName}, undefined),
    put({This, staticPagesUserName}, undefined),
    put({This, staticPagesPassword}, undefined),
    put({This, staticPagesSchema}, undefined),
    put({This, staticPagesServer}, undefined),
    put({This, staticPagesPort}, undefined),
    ok.


new(Map) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Map),
    This;
new(InitHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InitHashMap),
    This.

init(This, Map) ->
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        HashMap = (fun(Target_N67284) -> (get({Target_N67284, '$class'})):createHashMap(Target_N67284) end)('StdUtil':getInstance()),
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
        (get({This, '$class'})):getFormData(This, HashMap);
init(This, InitHashMap) ->
    init_fields(This),
        (get({This, '$class'})):getFormData(This, InitHashMap).


getFormData(This, HashMap) ->
        try
            InitializerData = 'InitializerData':getInstance(),
            put({This, userJdbcDriver}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'CUSTOMERJDBCDRIVER'}))),
            put({This, userName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'CUSTOMERNAME'}))),
            put({This, userUserName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'CUSTOMERUSERNAME'}))),
            put({This, userPassword}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'CUSTOMERPASSWORD'}))),
            put({This, userSchema}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'CUSTOMERSCHEMA'}))),
            put({This, userServer}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'CUSTOMERSERVER'}))),
            put({This, userPort}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'CUSTOMERPORT'}))),
            put({This, historyJdbcDriver}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'HISTORYJDBCDRIVER'}))),
            put({This, historyName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'HISTORYNAME'}))),
            put({This, historyUserName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'HISTORYUSERNAME'}))),
            put({This, historyPassword}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'HISTORYPASSWORD'}))),
            put({This, historySchema}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'HISTORYSCHEMA'}))),
            put({This, historyServer}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'HISTORYSERVER'}))),
            put({This, historyPort}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'HISTORYPORT'}))),
            put({This, logJdbcDriver}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'LOGJDBCDRIVER'}))),
            put({This, logName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'LOGNAME'}))),
            put({This, logUserName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'LOGUSERNAME'}))),
            put({This, logPassword}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'LOGPASSWORD'}))),
            put({This, logSchema}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'LOGSCHEMA'}))),
            put({This, logServer}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'LOGSERVER'}))),
            put({This, logPort}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'LOGPORT'}))),
            put({This, inventoryJdbcDriver}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'INVENTORYJDBCDRIVER'}))),
            put({This, inventoryName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'INVENTORYNAME'}))),
            put({This, inventoryUserName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'INVENTORYUSERNAME'}))),
            put({This, inventoryPassword}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'INVENTORYPASSWORD'}))),
            put({This, inventorySchema}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'INVENTORYSCHEMA'}))),
            put({This, inventoryServer}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'INVENTORYSERVER'}))),
            put({This, inventoryPort}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'INVENTORYPORT'}))),
            put({This, staticPagesJdbcDriver}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'STATICPAGESJDBCDRIVER'}))),
            put({This, staticPagesName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'STATICPAGESNAME'}))),
            put({This, staticPagesUserName}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'STATICPAGESUSERNAME'}))),
            put({This, staticPagesPassword}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'STATICPAGESPASSWORD'}))),
            put({This, staticPagesSchema}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'STATICPAGESSCHEMA'}))),
            put({This, staticPagesServer}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'STATICPAGESSERVER'}))),
            put({This, staticPagesPort}, (get({HashMap, '$class'})):get(HashMap, get({InitializerData, 'STATICPAGESPORT'})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to get form data", This, "getFormData()", E)
        end.

isJdbcDriverValid(This, JdbcDriverClassPathString) when (is_list(JdbcDriverClassPathString) orelse JdbcDriverClassPathString =:= undefined) ->
        try
            (fun(Target_N70641) -> (get({Target_N70641, '$class'})):newInstance(Target_N70641) end)('Class':forName(JdbcDriverClassPathString)),
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
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, userJdbcDriver}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, userName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, userUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, userPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, historyJdbcDriver}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, historyName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, historyUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, historyPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, logJdbcDriver}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, logName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, logUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, logPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, inventoryJdbcDriver}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, inventoryName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, inventoryUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, inventoryPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, staticPagesJdbcDriver}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, staticPagesName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, staticPagesUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            put({local, isValid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, staticPagesPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
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

getJdbcDriverSolutionInfo(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "The following describes the possible problems and solutions regarding the Jdbc Driver error(s):<p/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "1. A JDBC driver you specified is not in your classpath.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution 1: Move the JDBC driver into any directory specified in the existing classpath. <br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution 2: Add the directory that contains the JDBC driver to the classpath.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution 3: Add the JDBC driver to the WEB-INF/lib directory where you installed this webapp.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "2. The JDBC driver you specified does not exit.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution: Get a JDBC driver. <br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "3. The JDBC driver you specified is not valid.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution: Use a valid JDBC driver.<p/>"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getInvalidInfo(This) ->
        put({local, isJdbcDriversValid}, true),
        StringBuffer = 'StringMaker':new(),
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, userJdbcDriver}))) of
            true ->
            put({local, isJdbcDriversValid}, false),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getJdbcDriverValidationInfo(This, get({This, userJdbcDriver})));
            false -> ok
        end,
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, userName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["User db name should be < ", get({'Initializer', 'MAXDB'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, userUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["User db username should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, userPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["User DB password should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MINPASSWORD'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, historyJdbcDriver}))) of
            true ->
            put({local, isJdbcDriversValid}, false),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getJdbcDriverValidationInfo(This, get({This, historyJdbcDriver})));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, historyName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["History db should be < ", get({'Initializer', 'MAXDB'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, historyUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["History db username should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, historyPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["History db password should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MINPASSWORD'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, logJdbcDriver}))) of
            true ->
            put({local, isJdbcDriversValid}, false),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getJdbcDriverValidationInfo(This, get({This, logJdbcDriver})));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, logName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Log db should be < ", get({'Initializer', 'MAXDB'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, logUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Log db username should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, logPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Log db password should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MINPASSWORD'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, inventoryJdbcDriver}))) of
            true ->
            put({local, isJdbcDriversValid}, false),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getJdbcDriverValidationInfo(This, get({This, inventoryJdbcDriver})));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, inventoryName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Inventory db should be < ", get({'Initializer', 'MAXDB'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, inventoryUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Inventory db username should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, inventoryPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Inventory DB password should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MINPASSWORD'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({This, '$class'})):isJdbcDriverValid(This, get({This, staticPagesJdbcDriver}))) of
            true ->
            put({local, isJdbcDriversValid}, false),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getJdbcDriverValidationInfo(This, get({This, staticPagesJdbcDriver})));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, staticPagesName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAXDB'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Static Pages db should be < ", get({'Initializer', 'MAXDB'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, staticPagesUserName}), get({'Initializer', 'MIN'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Static Pages db username should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MIN'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, staticPagesPassword}), get({'Initializer', 'MINPASSWORD'}), get({'Initializer', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat([lists:concat([lists:concat(["Static Pages DB password should be < ", get({'Initializer', 'MAX'})]), " and > "]), get({'Initializer', 'MINPASSWORD'})]), " characters in length.<br />"]));
            false -> ok
        end,
        case (not get({local, isJdbcDriversValid})) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getJdbcDriverSolutionInfo(This));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

% throws Exception
set(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Creating DB connection files", This, "set()"),
        UserDbInitInfo = 'UserDbInitInfo':new(false),
        (get({UserDbInitInfo, '$class'})):setJdbcDriver(UserDbInitInfo, get({This, userJdbcDriver})),
        (get({UserDbInitInfo, '$class'})):setName(UserDbInitInfo, get({This, userName})),
        (get({UserDbInitInfo, '$class'})):setUserName(UserDbInitInfo, get({This, userUserName})),
        (get({UserDbInitInfo, '$class'})):setPassword(UserDbInitInfo, get({This, userPassword})),
        (get({UserDbInitInfo, '$class'})):setSchema(UserDbInitInfo, get({This, userSchema})),
        (get({UserDbInitInfo, '$class'})):setServer(UserDbInitInfo, get({This, userServer})),
        (get({UserDbInitInfo, '$class'})):setPort(UserDbInitInfo, get({This, userPort})),
        (get({UserDbInitInfo, '$class'})):setHasRead(UserDbInitInfo, true),
        (get({UserDbInitInfo, '$class'})):write(UserDbInitInfo),
        HistoryDbInitInfo = 'HistoryDbInitInfo':new(false),
        (get({HistoryDbInitInfo, '$class'})):setJdbcDriver(HistoryDbInitInfo, get({This, historyJdbcDriver})),
        (get({HistoryDbInitInfo, '$class'})):setName(HistoryDbInitInfo, get({This, historyName})),
        (get({HistoryDbInitInfo, '$class'})):setUserName(HistoryDbInitInfo, get({This, historyUserName})),
        (get({HistoryDbInitInfo, '$class'})):setPassword(HistoryDbInitInfo, get({This, historyPassword})),
        (get({HistoryDbInitInfo, '$class'})):setSchema(HistoryDbInitInfo, get({This, historySchema})),
        (get({HistoryDbInitInfo, '$class'})):setServer(HistoryDbInitInfo, get({This, historyServer})),
        (get({HistoryDbInitInfo, '$class'})):setPort(HistoryDbInitInfo, get({This, historyPort})),
        (get({HistoryDbInitInfo, '$class'})):setHasRead(HistoryDbInitInfo, true),
        (get({HistoryDbInitInfo, '$class'})):write(HistoryDbInitInfo),
        LogDbInitInfo = 'LogDbInitInfo':new(false),
        (get({LogDbInitInfo, '$class'})):setJdbcDriver(LogDbInitInfo, get({This, logJdbcDriver})),
        (get({LogDbInitInfo, '$class'})):setName(LogDbInitInfo, get({This, logName})),
        (get({LogDbInitInfo, '$class'})):setUserName(LogDbInitInfo, get({This, logUserName})),
        (get({LogDbInitInfo, '$class'})):setPassword(LogDbInitInfo, get({This, logPassword})),
        (get({LogDbInitInfo, '$class'})):setSchema(LogDbInitInfo, get({This, logSchema})),
        (get({LogDbInitInfo, '$class'})):setServer(LogDbInitInfo, get({This, logServer})),
        (get({LogDbInitInfo, '$class'})):setPort(LogDbInitInfo, get({This, logPort})),
        (get({LogDbInitInfo, '$class'})):setHasRead(LogDbInitInfo, true),
        (get({LogDbInitInfo, '$class'})):write(LogDbInitInfo),
        StaticPagesDbInitInfo = 'StaticPagesDbInitInfo':new(false),
        (get({StaticPagesDbInitInfo, '$class'})):setJdbcDriver(StaticPagesDbInitInfo, get({This, staticPagesJdbcDriver})),
        (get({StaticPagesDbInitInfo, '$class'})):setName(StaticPagesDbInitInfo, get({This, staticPagesName})),
        (get({StaticPagesDbInitInfo, '$class'})):setUserName(StaticPagesDbInitInfo, get({This, staticPagesUserName})),
        (get({StaticPagesDbInitInfo, '$class'})):setPassword(StaticPagesDbInitInfo, get({This, staticPagesPassword})),
        (get({StaticPagesDbInitInfo, '$class'})):setSchema(StaticPagesDbInitInfo, get({This, staticPagesSchema})),
        (get({StaticPagesDbInitInfo, '$class'})):setServer(StaticPagesDbInitInfo, get({This, staticPagesServer})),
        (get({StaticPagesDbInitInfo, '$class'})):setPort(StaticPagesDbInitInfo, get({This, staticPagesPort})),
        (get({StaticPagesDbInitInfo, '$class'})):setHasRead(StaticPagesDbInitInfo, true),
        (get({StaticPagesDbInitInfo, '$class'})):write(StaticPagesDbInitInfo),
        InventoryDbInitInfo = 'InventoryDbInitInfo':new(false),
        (get({InventoryDbInitInfo, '$class'})):setJdbcDriver(InventoryDbInitInfo, get({This, inventoryJdbcDriver})),
        (get({InventoryDbInitInfo, '$class'})):setName(InventoryDbInitInfo, get({This, inventoryName})),
        (get({InventoryDbInitInfo, '$class'})):setUserName(InventoryDbInitInfo, get({This, inventoryUserName})),
        (get({InventoryDbInitInfo, '$class'})):setPassword(InventoryDbInitInfo, get({This, inventoryPassword})),
        (get({InventoryDbInitInfo, '$class'})):setSchema(InventoryDbInitInfo, get({This, inventorySchema})),
        (get({InventoryDbInitInfo, '$class'})):setServer(InventoryDbInitInfo, get({This, inventoryServer})),
        (get({InventoryDbInitInfo, '$class'})):setPort(InventoryDbInitInfo, get({This, inventoryPort})),
        (get({InventoryDbInitInfo, '$class'})):setHasRead(InventoryDbInitInfo, true),
        (get({InventoryDbInitInfo, '$class'})):write(InventoryDbInitInfo),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Created DB connection files", This, "set()").

