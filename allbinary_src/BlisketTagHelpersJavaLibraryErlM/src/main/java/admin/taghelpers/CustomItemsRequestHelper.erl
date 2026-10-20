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
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.custom.CustomItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.customs.CustomItemsEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('CustomItemsRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, className}, undefined),
    put({This, packageName}, undefined),
    put({This, timeEntered}, undefined),
    put({This, lastModified}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'ModifyTable':'$init'(This),
    init_fields(This),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'ID'}))),
        put({This, className}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'DynamicObjectData', 'NAME'}))),
        put({This, packageName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'CustomItemData', 'PACKAGE'}))),
        put({This, timeEntered}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

getHashMap(This) ->
        Values = (fun(Target_N66796) -> (get({Target_N66796, '$class'})):createHashMap(Target_N66796) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'ID'}), get({This, id})),
        (get({Values, '$class'})):put(Values, get({'DynamicObjectData', 'NAME'}), get({This, className})),
        (get({Values, '$class'})):put(Values, get({'CustomItemData', 'PACKAGE'}), get({This, packageName})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N67053) -> (get({Target_N67053, '$class'})):toString(Target_N67053) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

insert(This) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N67282) -> (get({Target_N67282, '$class'})):toString(Target_N67282) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, get({This, id})),
            (get({Values, '$class'})):add(Values, get({This, className})),
            (get({Values, '$class'})):add(Values, get({This, packageName})),
            (get({Values, '$class'})):add(Values, Time),
            (get({Values, '$class'})):add(Values, Time),
            (fun(Target_N67545) -> (get({Target_N67545, '$class'})):insert(Target_N67545, Values) end)((fun(Target_N67552) -> (get({Target_N67552, '$class'})):getCustomItemsEntityInstance(Target_N67552) end)('CustomItemsEntityFactory':getInstance())),
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
            (fun(Target_N68249) -> (get({Target_N68249, '$class'})):delete(Target_N68249, get({This, id})) end)((fun(Target_N68256) -> (get({Target_N68256, '$class'})):getCustomItemsEntityInstance(Target_N68256) end)('CustomItemsEntityFactory':getInstance())),
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
            (fun(Target_N68975) -> (get({Target_N68975, '$class'})):update(Target_N68975, Values) end)((fun(Target_N68982) -> (get({Target_N68982, '$class'})):getCustomItemsEntityInstance(Target_N68982) end)('CustomItemsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69213) -> (get({Target_N69213, '$class'})):toString(Target_N69213) end)((fun(Target_N69220) -> (get({Target_N69220, '$class'})):append(Target_N69220, Success) end)((fun(Target_N69227) -> (get({Target_N69227, '$class'})):append(Target_N69227, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N69234) -> (get({Target_N69234, '$class'})):append(Target_N69234, get({This, id})) end)('StringMaker':new())))), This, "update()");
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

