% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
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
% package org.allbinary.data.tables.generator
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('IdGeneratorEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements IdGeneratorEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "idgenerator"),
    put({This, tableData}, undefined),
    put({This, 'NAME'}, "NAME"),
    put({This, 'VALUE'}, "VALUE"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AbSqlBean':'$init'(This, 'UserDbInitInfo':new()),
        init_fields(This),
        put({This, tableData}, (fun(Target_N66076) -> (get({Target_N66076, '$class'})):toString(Target_N66076) end)((fun(Target_N66083) -> (get({Target_N66083, '$class'})):append(Target_N66083, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N66090) -> (get({Target_N66090, '$class'})):append(Target_N66090, get({This, 'NAME'})) end)((fun(Target_N66097) -> (get({Target_N66097, '$class'})):append(Target_N66097, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N66109) -> (get({Target_N66109, '$class'})):append(Target_N66109, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66116) -> (get({Target_N66116, '$class'})):append(Target_N66116, get({This, 'VALUE'})) end)((fun(Target_N66123) -> (get({Target_N66123, '$class'})):append(Target_N66123, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66130) -> (get({Target_N66130, '$class'})):append(Target_N66130, get({This, 'NAME'})) end)((fun(Target_N66137) -> (get({Target_N66137, '$class'})):append(Target_N66137, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N66144) -> (get({Target_N66144, '$class'})):append(Target_N66144, get({This, tableName})) end)((fun(Target_N66151) -> (get({Target_N66151, '$class'})):append(Target_N66151, get({get({This, sqlStrings}), 'CREATE_TABLE'})) end)('StringMaker':new())))))))))))),
        'AbSqlBean':setTableName(This, get({This, tableName})).

% throws Exception
get(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        KeysAndValues = (fun(Target_N66421) -> (get({Target_N66421, '$class'})):createHashMap(Target_N66421) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({This, 'NAME'}), Name),
        HashMap = 'AbSqlBean':getRow(This, KeysAndValues),
        case ((fun(Target_N66559) -> (get({Target_N66559, '$class'})):compareTo(Target_N66559, Name) end)(((get({HashMap, '$class'})):get(HashMap, get({This, 'NAME'})))) =/= 0) of
            true ->
            erlang:error({'Exception', "results do not match"});
            false -> ok
        end,
        Value = (get({HashMap, '$class'})):get(HashMap, get({This, 'VALUE'})),
        list_to_integer(Value).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'IdGeneratorEntity', 'INSERT'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'IdGeneratorEntity', 'INSERT'}), E)
        end.

delete(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
            'AbSqlBean':deleteWhere(This, get({This, 'NAME'}), Value),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({get({This, commonStrings}), delete}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), delete}), E)
        end.

update(This, Name, Value) when (is_list(Name) orelse Name =:= undefined) ->
        Map = (fun(Target_N67342) -> (get({Target_N67342, '$class'})):createHashMap(Target_N67342) end)('StdUtil':getInstance()),
        (get({Map, '$class'})):put(Map, get({This, 'NAME'}), Name),
        (get({Map, '$class'})):put(Map, get({This, 'VALUE'}), Value),
        (get({This, '$class'})):update(This, Map).

update(This, HashMap) ->
        'AbSqlBean':updateWhere(This, get({This, 'NAME'}), (get({HashMap, '$class'})):get(HashMap, get({This, 'NAME'})), HashMap).

createTable(This) ->
        ReturnStr = 'AbSqlBean':createTable(This, get({This, tableData})),
        ReturnStr.

dropTable(This) ->
        'AbSqlBean':dropTable(This).

