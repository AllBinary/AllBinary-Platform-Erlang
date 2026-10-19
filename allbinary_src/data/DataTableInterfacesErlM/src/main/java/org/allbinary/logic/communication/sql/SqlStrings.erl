% Generated Code Do Not Modify
% package org.allbinary.logic.communication.sql
% import org.allbinary.string.CommonSeps

-module('SqlStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SqlStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'CREATE_DATABASE'}, "CREATE DATABASE "),
    put({This, 'DROP_TABLE'}, "DROP TABLE "),
    put({This, 'CREATE_TABLE'}, "CREATE TABLE "),
    put({This, 'START'}, " ("),
    put({This, 'SELECT'}, "SELECT "),
    put({This, 'FROM'}, " FROM "),
    put({This, 'SELECT_ALL'}, "SELECT *"),
    put({This, 'WHERE'}, " WHERE "),
    put({This, 'AND'}, " AND "),
    put({This, 'UPDATE'}, "UPDATE "),
    put({This, 'SET'}, " SET "),
    put({This, 'SELECT_ALL_FROM'}, lists:concat([get({This, 'SELECT_ALL'}), get({This, 'FROM'})])),
    put({This, 'DELETE'}, "DELETE"),
    put({This, 'LIKE_QUOTE'}, " LIKE \""),
    put({This, 'INSERT_INTO'}, "INSERT INTO "),
    put({This, 'VALUES'}, " VALUES ('"),
    put({This, 'ORDER_BY'}, "ORDER BY"),
    put({This, 'COUNT'}, "COUNT("),
    put({This, 'ASC'}, "ASC"),
    put({This, 'DESC'}, "DESC"),
    put({This, 'PRIMARY_KEY'}, "PRIMARY KEY("),
    put({This, 'END'}, ") )"),
    put({This, 'EQUAL_QUOTE'}, " = \""),
    put({This, 'CLOSE_QUOTE'}, get({'CommonSeps':getInstance(), 'QUOTE'})),
    put({This, 'EQUAL_QUOTE_NO_SPACE'}, "=\""),
    put({This, 'ESCAPE'}, "\\"),
    put({This, 'DOUBLE_ESCAPE'}, "\\\\"),
    put({This, 'MORE_THAN_QUOTE'}, " > \""),
    put({This, 'LESS_THAN_QUOTE'}, " < \""),
    put({This, 'SINGLE_QUOTE_COMMA_SEP'}, "','"),
    put({This, 'ID'}, "ID"),
    put({This, 'SQL_STATEMENT_LABEL'}, "SQL Statement: "),
    put({This, 'COLUMN_VALUE'}, "\nColumn Value: "),
    put({This, 'CREATE_RETURN'}, " Created Successfully"),
    put({This, 'FIELD_VALUE'}, "\nField Value: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'SqlStrings', instance}).

