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
% package org.allbinary.logic.communication.sql.connection.pool
% import java.sql.Connection
% import java.sql.DriverManager
% import java.sql.SQLException
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker

-module('SqlConnectionPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SqlConnectionPool':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, stdUtil}, 'StdUtil':getInstance()),
    put({This, connectionHashMap}, undefined),
    put({This, 'FIRST_NEW_CONNECTION_CREATED'}, "First New Connection Created: "),
    put({This, 'FIRST'}, "First "),
    put({This, 'NEW_CONNECTION_FOR'}, "New Connection For "),
    put({This, 'CREATED'}, " Created"),
    put({This, 'NUMBER_OF_SQL_CONNECTIONS_FOR'}, "Number Of Sql Connections for: "),
    put({This, 'NUMBER_OF_SQL_CONNECTION_VECTORS'}, "Number Of Sql Connection Vectors: "),
    put({This, 'IS'}, " is "),
    put({This, 'CONNECTION_ALLREADY_CLOSED'}, "Connection AllReady Closed"),
    put({This, 'METHOD_GET'}, "get()"),
    put({This, 'METHOD_ADD'}, "add()"),
    ok.


getInstance() ->
        get({'SqlConnectionPool', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws SQLException
get(This, Url) when (is_list(Url) orelse Url =:= undefined) ->
        try
        case (get({This, connectionHashMap}) =:= undefined) of
            true ->
            put({This, connectionHashMap}, (get({get({This, stdUtil}), '$class'})):createHashMap(get({This, stdUtil}))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGPOOL'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'FIRST_NEW_CONNECTION_CREATED'}), Url]), This, get({This, 'METHOD_GET'}));
                false -> ok
            end,
            throw({'$return', 'DriverManager':getConnection(Url)});
            false ->
            put({local, connectionVector}, (get({get({This, connectionHashMap}), '$class'})):get(get({This, connectionHashMap}), Url)),
            case (get({local, connectionVector}) =:= undefined) of
                true ->
                put({local, connectionVector}, 'BasicArrayListD':new()),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGPOOL'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'FIRST'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'NEW_CONNECTION_FOR'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Url),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'CREATED'})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({This, 'METHOD_GET'}));
                    false -> ok
                end,
                throw({'$return', 'DriverManager':getConnection(Url)});
                false ->
                case ((get({get({local, connectionVector}), '$class'})):size(get({local, connectionVector})) =:= 0) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGPOOL'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67637) -> (get({Target_N67637, '$class'})):toString(Target_N67637) end)((fun(Target_N67644) -> (get({Target_N67644, '$class'})):append(Target_N67644, get({This, 'CREATED'})) end)((fun(Target_N67651) -> (get({Target_N67651, '$class'})):append(Target_N67651, Url) end)((fun(Target_N67658) -> (get({Target_N67658, '$class'})):append(Target_N67658, get({This, 'NEW_CONNECTION_FOR'})) end)('StringMaker':new())))), This, get({This, 'METHOD_GET'}));
                    false -> ok
                end,
                throw({'$return', 'DriverManager':getConnection(Url)});
                false ->
                put({local, stringBuffer}, 'StringMaker':new()),
                Size = (get({get({local, connectionVector}), '$class'})):size(get({local, connectionVector})),
                lists:foreach(fun(I) ->
                    SqlConnection = (get({get({local, connectionVector}), '$class'})):get(get({local, connectionVector}), I),
                    case (not (get({SqlConnection, '$class'})):isClosed(SqlConnection)) of
                        true ->
                        (get({get({local, connectionVector}), '$class'})):remove(get({local, connectionVector}), SqlConnection),
                        (get({get({This, connectionHashMap}), '$class'})):put(get({This, connectionHashMap}), Url, get({local, connectionVector})),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGPOOL'})) of
                            true ->
                            (get({get({local, stringBuffer}), '$class'})):delete(get({local, stringBuffer}), 0, (get({get({local, stringBuffer}), '$class'})):length(get({local, stringBuffer}))),
                            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'NUMBER_OF_SQL_CONNECTIONS_FOR'})),
                            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Url),
                            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'IS'})),
                            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), (get({get({local, connectionVector}), '$class'})):size(get({local, connectionVector}))),
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'NUMBER_OF_SQL_CONNECTION_VECTORS'}), (get({get({This, connectionHashMap}), '$class'})):size(get({This, connectionHashMap}))]), This, get({This, 'METHOD_GET'})),
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({This, 'METHOD_GET'}));
                            false -> ok
                        end,
                        throw({'$return', SqlConnection});
                        false -> ok
                    end
                end, lists:seq(0, Size - 1))
            end
            end
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGPOOL'})) of
            true ->
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'NEW_CONNECTION_FOR'})),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Url),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'CREATED'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({This, 'METHOD_GET'}));
            false -> ok
        end,
        'DriverManager':getConnection(Url)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws SQLException
add(This, Url, SqlConnection) when (is_list(Url) orelse Url =:= undefined) ->
        case (not (get({SqlConnection, '$class'})):isClosed(SqlConnection)) of
            true ->
            put({local, connectionVector}, undefined),
            case (get({This, connectionHashMap}) =:= undefined) of
                true ->
                put({This, connectionHashMap}, (get({get({This, stdUtil}), '$class'})):createHashMap(get({This, stdUtil}))),
                put({local, connectionVector}, 'BasicArrayListD':new()),
                (get({get({local, connectionVector}), '$class'})):add(get({local, connectionVector}), SqlConnection);
                false ->
                put({local, connectionVector}, (get({get({This, connectionHashMap}), '$class'})):get(get({This, connectionHashMap}), Url)),
                case (get({local, connectionVector}) =:= undefined) of
                    true ->
                    put({local, connectionVector}, 'BasicArrayListD':new());
                    false -> ok
                end,
                (get({get({local, connectionVector}), '$class'})):add(get({local, connectionVector}), SqlConnection),
                (get({get({This, connectionHashMap}), '$class'})):put(get({This, connectionHashMap}), Url, get({local, connectionVector}))
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGPOOL'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'NUMBER_OF_SQL_CONNECTIONS_FOR'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, Url),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IS'})),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({local, connectionVector}), '$class'})):size(get({local, connectionVector}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'NUMBER_OF_SQL_CONNECTION_VECTORS'}), (get({get({This, connectionHashMap}), '$class'})):size(get({This, connectionHashMap}))]), This, get({This, 'METHOD_ADD'})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD_ADD'}));
                false -> ok
            end;
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGPOOL'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'CONNECTION_ALLREADY_CLOSED'}), This, get({This, 'METHOD_ADD'}));
            false -> ok
        end.

