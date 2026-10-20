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
% import org.allbinary.business.user.commerce.inventory.item.special.SpecialItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.special.SpecialItemsEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('SpecialItemsRequestHelper').
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
    put({This, startTime}, undefined),
    put({This, endTime}, undefined),
    put({This, price}, undefined),
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
        put({This, number}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'NUMBER'}))),
        put({This, enabled}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'ENABLE'}))),
        put({This, startTime}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'SpecialItemData', 'START_TIME'}))),
        put({This, endTime}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'SpecialItemData', 'END_TIME'}))),
        put({This, price}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'PRICE'}))),
        put({This, timeEntered}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

getHashMap(This) ->
        Values = (fun(Target_N67043) -> (get({Target_N67043, '$class'})):createHashMap(Target_N67043) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'ID'}), get({This, id})),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'NUMBER'}), get({This, number})),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'ENABLE'}), get({This, enabled})),
        (get({Values, '$class'})):put(Values, get({'SpecialItemData', 'START_TIME'}), get({This, startTime})),
        (get({Values, '$class'})):put(Values, get({'SpecialItemData', 'END_TIME'}), get({This, endTime})),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'PRICE'}), get({This, price})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N67458) -> (get({Target_N67458, '$class'})):toString(Target_N67458) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

insert(This) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N67687) -> (get({Target_N67687, '$class'})):toString(Target_N67687) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, get({This, id})),
            (get({Values, '$class'})):add(Values, get({This, number})),
            (get({Values, '$class'})):add(Values, get({This, enabled})),
            (get({Values, '$class'})):add(Values, get({This, startTime})),
            (get({Values, '$class'})):add(Values, get({This, endTime})),
            (get({Values, '$class'})):add(Values, get({This, price})),
            (get({Values, '$class'})):add(Values, Time),
            (get({Values, '$class'})):add(Values, Time),
            (fun(Target_N68052) -> (get({Target_N68052, '$class'})):insert(Target_N68052, Values) end)((fun(Target_N68059) -> (get({Target_N68059, '$class'})):getSpecialItemsEntityInstance(Target_N68059) end)('SpecialItemsEntityFactory':getInstance())),
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
            (fun(Target_N68756) -> (get({Target_N68756, '$class'})):delete(Target_N68756, get({This, id})) end)((fun(Target_N68763) -> (get({Target_N68763, '$class'})):getSpecialItemsEntityInstance(Target_N68763) end)('SpecialItemsEntityFactory':getInstance())),
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
            Success = "Update Successful",
            Values = (get({This, '$class'})):getHashMap(This),
            (fun(Target_N69482) -> (get({Target_N69482, '$class'})):update(Target_N69482, Values) end)((fun(Target_N69489) -> (get({Target_N69489, '$class'})):getSpecialItemsEntityInstance(Target_N69489) end)('SpecialItemsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69720) -> (get({Target_N69720, '$class'})):toString(Target_N69720) end)((fun(Target_N69727) -> (get({Target_N69727, '$class'})):append(Target_N69727, Success) end)((fun(Target_N69734) -> (get({Target_N69734, '$class'})):append(Target_N69734, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N69741) -> (get({Target_N69741, '$class'})):append(Target_N69741, get({This, id})) end)('StringMaker':new())))), This, "update()");
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

