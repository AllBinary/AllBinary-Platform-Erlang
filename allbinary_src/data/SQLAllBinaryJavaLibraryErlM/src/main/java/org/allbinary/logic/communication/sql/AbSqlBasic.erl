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
% package org.allbinary.logic.communication.sql
% import java.sql.Connection
% import java.sql.ResultSet
% import java.sql.SQLException
% import java.sql.Statement
% import org.allbinary.business.init.db.DatabaseConnectionInfoInterface
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.connection.pool.SqlConnectionPool
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('AbSqlBasic').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, sqlConnectionPool}, 'SqlConnectionPool':getInstance()),
    put({This, databaseConnectionInfoInterface}, undefined),
    put({This, connectAttemptCounter}, 0),
    put({This, conn}, undefined),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, stdUtil}, 'StdUtil':getInstance()),
    put({This, sqlTypeStrings}, 'SqlTypeStrings':getInstance()),
    put({This, sqlStrings}, 'SqlStrings':getInstance()),
    put({This, 'INSERT'}, "insert"),
    put({This, 'UPDATE'}, "update"),
    put({This, 'FAILED_SQL_STATEMENT'}, "Failed\nSQL Statement: "),
    put({This, 'SUCCESS_SQL_STATEMENT'}, "Success\nSQL Statement: "),
    put({This, 'METHOD_EXECUTED_SQL_STATEMENT'}, "executedSQLStatement"),
    put({This, 'METHOD_CREATE'}, "create"),
    put({This, 'DATABASE_CREATED_LABEL'}, "Database Created: "),
    put({This, 'DATABASE_CREATION_FAILED_LABEL'}, "Database Creation Failed: "),
    put({This, 'SQL_CONNECTION_FAILED'}, "SQL Connection Failed"),
    put({This, 'SQL_CONNECTION_RETRYING'}, "SQL Connection Retrying"),
    put({This, 'SQL_CONNECTION_RETRY'}, "SQL Connection Retry"),
    put({This, 'METHOD_CREATE_CONNECTION'}, "createConnection()"),
    put({This, 'METHOD_INITIALIZE'}, "initialize"),
    put({This, 'LOAD_JDBC_DRIVER_FAILED_LABEL'}, "Load JDBC Driver Failed: "),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DatabaseConnectionInfoInterface),
    This.

'$init'(This, DatabaseConnectionInfoInterface) ->
    init_fields(This),
        put({This, databaseConnectionInfoInterface}, DatabaseConnectionInfoInterface),
        put({This, connectAttemptCounter}, 0),
        put({This, conn}, undefined).

% throws SQLException
executeSQLStatement(This, Statement) when (is_list(Statement) orelse Statement =:= undefined) ->
        try
            (get({This, '$class'})):initialize(This),
            Stmt = (get({get({This, conn}), '$class'})):createStatement(get({This, conn})),
            (get({Stmt, '$class'})):execute(Stmt, Statement),
            Rset = (get({Stmt, '$class'})):getResultSet(Stmt),
            (get({Stmt, '$class'})):close(Stmt),
            TempConnection = get({This, conn}),
            put({This, conn}, undefined),
            (get({get({This, sqlConnectionPool}), '$class'})):add(get({This, sqlConnectionPool}), (fun(Target_N67340) -> (get({Target_N67340, '$class'})):getUrl(Target_N67340) end)((get({This, '$class'})):getDatabaseConnectionInfoInterface(This)), TempConnection),
            Rset
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), Statement]), This, get({This, 'METHOD_EXECUTED_SQL_STATEMENT'}), E);
                false -> ok
            end,
            (get({get({This, conn}), '$class'})):close(get({This, conn})),
            put({This, conn}, undefined),
            erlang:error(E)
        end.

create(This, DatabaseName) when (is_list(DatabaseName) orelse DatabaseName =:= undefined) ->
        try
            (get({This, '$class'})):executeSQLStatement(This, lists:concat([get({get({This, sqlStrings}), 'CREATE_DATABASE'}), DatabaseName])),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'DATABASE_CREATED_LABEL'}), DatabaseName]), This, get({This, 'METHOD_CREATE'}));
                false -> ok
            end,
            lists:concat([DatabaseName, get({get({This, sqlStrings}), 'CREATE_RETURN'})])
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'DATABASE_CREATION_FAILED_LABEL'}), DatabaseName]), This, get({This, 'METHOD_CREATE'}), E);
                false -> ok
            end,
            lists:concat([get({This, 'DATABASE_CREATION_FAILED_LABEL'}), DatabaseName])
        end.

createConnection(This) ->
        try
            put({This, conn}, (get({get({This, sqlConnectionPool}), '$class'})):get(get({This, sqlConnectionPool}), (fun(Target_N68532) -> (get({Target_N68532, '$class'})):getUrl(Target_N68532) end)((get({This, '$class'})):getDatabaseConnectionInfoInterface(This))))
        catch _:Se when Se =/= '$break', Se =/= '$continue', (not is_tuple(Se) orelse element(1, Se) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({This, 'SQL_CONNECTION_RETRYING'}), This, get({This, 'METHOD_CREATE_CONNECTION'}), Se);
                false -> ok
            end,
            try
                (fun(Target_N68812) -> (get({Target_N68812, '$class'})):sleep(Target_N68812, 2000) end)('Thread':currentThread()),
                case (get({This, connectAttemptCounter}) < 10) of
                    true ->
                    put({This, connectAttemptCounter}, get({This, connectAttemptCounter}) + 1),
                    (get({This, '$class'})):initialize(This);
                    false -> ok
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'SQL_CONNECTION_RETRY'}), allbinary_java:to_string(Se)]), This, get({This, 'METHOD_CREATE_CONNECTION'}), E);
                    false -> ok
                end
            end
        end.

initialize(This) ->
        try
            begin
                try
                    Loader = (fun(Target_N69289) -> (get({Target_N69289, '$class'})):getContextClassLoader(Target_N69289) end)('Thread':currentThread()),
                    JdbcDriverClass = (get({Loader, '$class'})):loadClass(Loader, (fun(Target_N69357) -> (get({Target_N69357, '$class'})):getJdbcDriver(Target_N69357) end)((get({This, '$class'})):getDatabaseConnectionInfoInterface(This))),
                    (get({JdbcDriverClass, '$class'})):newInstance(JdbcDriverClass)
                catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'LOAD_JDBC_DRIVER_FAILED_LABEL'}), (fun(Target_N69639) -> (get({Target_N69639, '$class'})):getJdbcDriver(Target_N69639) end)((get({This, '$class'})):getDatabaseConnectionInfoInterface(This))]), This, get({This, 'METHOD_INITIALIZE'}), E);
                        false -> ok
                    end
                end
            end,
            (get({This, '$class'})):createConnection(This)
        catch _:Se when Se =/= '$break', Se =/= '$continue', (not is_tuple(Se) orelse element(1, Se) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({This, 'SQL_CONNECTION_FAILED'}), This, get({This, 'METHOD_INITIALIZE'}), Se);
                false -> ok
            end
        end.

getDatabaseConnectionInfoInterface(This) ->
        get({This, databaseConnectionInfoInterface}).

setDatabaseConnectionInfoInterface(This, DatabaseConnectionInfoInterface) ->
        put({This, databaseConnectionInfoInterface}, DatabaseConnectionInfoInterface).

