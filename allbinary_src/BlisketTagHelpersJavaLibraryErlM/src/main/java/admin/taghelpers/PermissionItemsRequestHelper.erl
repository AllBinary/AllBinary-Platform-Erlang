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
% package admin.taghelpers
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.permission.PermissionItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.permissions.PermissionItemsEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('PermissionItemsRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, enabled}, undefined),
    put({This, number}, undefined),
    put({This, who}, undefined),
    put({This, what}, undefined),
    put({This, type}, undefined),
    put({This, remoteAddr}, undefined),
    put({This, startTime}, undefined),
    put({This, endTime}, undefined),
    put({This, price}, undefined),
    put({This, timeEntered}, undefined),
    put({This, lastModified}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap, PageContext),
    This.

init(This, HashMap, PageContext) ->
    'ModifyTable':init(This),
    init_fields(This),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'ID'}))),
        put({This, number}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'NUMBER'}))),
        put({This, enabled}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'ENABLE'}))),
        put({This, who}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PermissionItemData', 'WHO'}))),
        put({This, what}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PermissionItemData', 'WHAT'}))),
        put({This, type}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PermissionItemData', 'TYPE'}))),
        put({This, remoteAddr}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PermissionItemData', 'REMOTE_ADDR'}))),
        put({This, startTime}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PermissionItemData', 'START_TIME'}))),
        put({This, endTime}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PermissionItemData', 'END_TIME'}))),
        put({This, price}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'PRICE'}))),
        put({This, timeEntered}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

getHashMap(This) ->
        Values = (fun(Target_N67395) -> (get({Target_N67395, '$class'})):createHashMap(Target_N67395) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'ID'}), get({This, id})),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'NUMBER'}), get({This, number})),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'ENABLE'}), get({This, enabled})),
        (get({Values, '$class'})):put(Values, get({'PermissionItemData', 'WHO'}), get({This, who})),
        (get({Values, '$class'})):put(Values, get({'PermissionItemData', 'WHAT'}), get({This, what})),
        (get({Values, '$class'})):put(Values, get({'PermissionItemData', 'TYPE'}), get({This, type})),
        (get({Values, '$class'})):put(Values, get({'PermissionItemData', 'REMOTE_ADDR'}), get({This, remoteAddr})),
        (get({Values, '$class'})):put(Values, get({'PermissionItemData', 'START_TIME'}), get({This, startTime})),
        (get({Values, '$class'})):put(Values, get({'PermissionItemData', 'END_TIME'}), get({This, endTime})),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'PRICE'}), get({This, price})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N68010) -> (get({Target_N68010, '$class'})):toString(Target_N68010) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

insert(This) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N68239) -> (get({Target_N68239, '$class'})):toString(Target_N68239) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, get({This, id})),
            (get({Values, '$class'})):add(Values, get({This, number})),
            (get({Values, '$class'})):add(Values, get({This, enabled})),
            (get({Values, '$class'})):add(Values, get({This, who})),
            (get({Values, '$class'})):add(Values, get({This, what})),
            (get({Values, '$class'})):add(Values, get({This, type})),
            (get({Values, '$class'})):add(Values, get({This, remoteAddr})),
            (get({Values, '$class'})):add(Values, get({This, startTime})),
            (get({Values, '$class'})):add(Values, get({This, endTime})),
            (get({Values, '$class'})):add(Values, get({This, price})),
            (get({Values, '$class'})):add(Values, Time),
            (get({Values, '$class'})):add(Values, Time),
            (fun(Target_N68740) -> (get({Target_N68740, '$class'})):insert(Target_N68740, Values) end)((fun(Target_N68747) -> (get({Target_N68747, '$class'})):getPermissionItemsEntityInstance(Target_N68747) end)('PermissionItemsEntityFactory':getInstance())),
            Success = lists:concat([lists:concat(["Successfully inserted ", get({This, id})]), " into items table"]),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "insert()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = lists:concat([lists:concat(["Failed to insert ", get({This, id})]), " into items table"]),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "inserts()", E);
                false -> ok
            end,
            Error
        end.

delete(This) ->
        try
            (fun(Target_N69444) -> (get({Target_N69444, '$class'})):delete(Target_N69444, get({This, id})) end)((fun(Target_N69451) -> (get({Target_N69451, '$class'})):getPermissionItemsEntityInstance(Target_N69451) end)('PermissionItemsEntityFactory':getInstance())),
            Success = "Successfully deleted",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "delete()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to delete",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "delete()", E);
                false -> ok
            end,
            Error
        end.

update(This) ->
        try
            Success = "Update Pricing Successful",
            Values = (get({This, '$class'})):getHashMap(This),
            (fun(Target_N70170) -> (get({Target_N70170, '$class'})):update(Target_N70170, Values) end)((fun(Target_N70177) -> (get({Target_N70177, '$class'})):getPermissionItemsEntityInstance(Target_N70177) end)('PermissionItemsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70408) -> (get({Target_N70408, '$class'})):toString(Target_N70408) end)((fun(Target_N70415) -> (get({Target_N70415, '$class'})):append(Target_N70415, Success) end)((fun(Target_N70422) -> (get({Target_N70422, '$class'})):append(Target_N70422, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N70429) -> (get({Target_N70429, '$class'})):append(Target_N70429, get({This, id})) end)('StringMaker':new())))), This, "update()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = lists:concat(["Failed to update: ", get({This, id})]),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "update()", E);
                false -> ok
            end,
            Error
        end.

