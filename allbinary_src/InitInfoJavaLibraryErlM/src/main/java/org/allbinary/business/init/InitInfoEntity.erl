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
% package org.allbinary.business.init
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker

-module('InitInfoEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitSql', Function, Arguments).

init_fields(This) ->
    put({This, 'NAME'}, "InitInfoEntity"),
    put({This, 'NOTHING'}, "NOTHING"),
    put({This, tableName}, "initdata"),
    put({This, tableData}, undefined),
    put({This, 'NOT_IN_DB'}, "Not In DB"),
    put({This, 'METHOD_GET'}, "get()"),
    put({This, 'METHOD_IS'}, "is()"),
    put({This, 'METHOD_ADD'}, "add()"),
    put({This, 'CREATED_SUCCESS'}, " Created Successfully"),
    put({This, 'FAILED_TO_CREATE'}, "Failed to create "),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'InitSql':'$init'(This, 'UserDbInitInfo':new()),
        init_fields(This),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'START'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'NOTHING'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'InitInfo':getInstance(), 'TESTING'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'InitInfo':getInstance(), 'TESTHTMLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'InitInfo':getInstance(), 'MAINPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'PRIMARY_KEY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'NOTHING'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'END'})),
        put({This, tableData}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({This, '$class'})):setTable(This, get({This, tableName})).

get(This) ->
        try
        try
            KeyAndValue = (fun(Target_N67057) -> (get({Target_N67057, '$class'})):createHashMap(Target_N67057) end)('StdUtil':getInstance()),
            (get({KeyAndValue, '$class'})):put(KeyAndValue, get({This, 'NOTHING'}), get({This, 'NOTHING'})),
            HashMap = (get({This, '$class'})):getRow(This, KeyAndValue),
            case (HashMap =/= undefined) of
                true ->
                (fun(Target_N67345) -> (get({Target_N67345, '$class'})):set(Target_N67345, HashMap) end)('InitInfo':getInstance()),
                throw({'$return', true});
                false ->
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
                    true ->
                    'PreLogUtil':put(get({This, 'NOT_IN_DB'}), get({This, 'NAME'}), get({This, 'METHOD_GET'}));
                    false -> ok
                end,
                throw({'$return', false})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'NAME'}), get({This, 'METHOD_GET'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

is(This) ->
        try
        try
            KeyAndValue = (fun(Target_N67613) -> (get({Target_N67613, '$class'})):createHashMap(Target_N67613) end)('StdUtil':getInstance()),
            (get({KeyAndValue, '$class'})):put(KeyAndValue, get({This, 'NOTHING'}), get({This, 'NOTHING'})),
            HashMap = (get({This, '$class'})):getRow(This, KeyAndValue),
            case (HashMap =/= undefined) of
                true ->
                throw({'$return', true});
                false ->
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
                    true ->
                    'PreLogUtil':put(get({This, 'NOT_IN_DB'}), get({This, 'NAME'}), get({This, 'METHOD_IS'}));
                    false -> ok
                end,
                throw({'$return', false})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'NAME'}), get({This, 'METHOD_IS'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

update(This) ->
        (get({This, '$class'})):updateWhere(This, get({This, 'NOTHING'}), get({This, 'NOTHING'}), (fun(Target_N68142) -> (get({Target_N68142, '$class'})):toHashMap(Target_N68142) end)('InitInfo':getInstance())).

add(This) ->
        try
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, get({This, 'NOTHING'})),
            (get({Values, '$class'})):add(Values, (fun(Target_N68295) -> (get({Target_N68295, '$class'})):getTesting(Target_N68295) end)('InitInfo':getInstance())),
            (get({Values, '$class'})):add(Values, (fun(Target_N68342) -> (get({Target_N68342, '$class'})):getTestHtmlPath(Target_N68342) end)('InitInfo':getInstance())),
            (get({Values, '$class'})):add(Values, (fun(Target_N68389) -> (get({Target_N68389, '$class'})):getMainPath(Target_N68389) end)('InitInfo':getInstance())),
            (get({This, '$class'})):insert(This, Values)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'NAME'}), get({This, 'METHOD_ADD'}), E);
                false -> ok
            end
        end.

createTable(This) ->
        try
        case 'InitSql':createTable(This, get({This, tableData})) of
            true ->
            throw({'$return', lists:concat([get({This, tableName}), get({This, 'CREATED_SUCCESS'})])});
            false ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'FAILED_TO_CREATE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableData})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

