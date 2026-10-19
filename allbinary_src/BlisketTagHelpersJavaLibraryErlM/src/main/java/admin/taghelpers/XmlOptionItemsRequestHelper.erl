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
% import org.allbinary.business.user.commerce.inventory.item.option.XmlOptionItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.options.XmlOptionItemsEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('XmlOptionItemsRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, xmlFileStatus}, undefined),
    put({This, optionXmlFile}, undefined),
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
        put({This, xmlFileStatus}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'XmlOptionItemData', 'XML_FILE_STATUS'}))),
        put({This, optionXmlFile}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'XmlOptionItemData', 'OPTION_XML_FILE'}))),
        put({This, timeEntered}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

getHashMap(This) ->
        Values = (fun(Target_N66771) -> (get({Target_N66771, '$class'})):createHashMap(Target_N66771) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'ID'}), get({This, id})),
        (get({Values, '$class'})):put(Values, get({'XmlOptionItemData', 'XML_FILE_STATUS'}), get({This, xmlFileStatus})),
        (get({Values, '$class'})):put(Values, get({'XmlOptionItemData', 'OPTION_XML_FILE'}), get({This, optionXmlFile})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N67028) -> (get({Target_N67028, '$class'})):toString(Target_N67028) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

insert(This) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N67257) -> (get({Target_N67257, '$class'})):toString(Target_N67257) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, get({This, id})),
            (get({Values, '$class'})):add(Values, get({This, xmlFileStatus})),
            (get({Values, '$class'})):add(Values, get({This, optionXmlFile})),
            (get({Values, '$class'})):add(Values, Time),
            (get({Values, '$class'})):add(Values, Time),
            (fun(Target_N67520) -> (get({Target_N67520, '$class'})):insert(Target_N67520, Values) end)((fun(Target_N67527) -> (get({Target_N67527, '$class'})):getXmlOptionItemsEntityInstance(Target_N67527) end)('XmlOptionItemsEntityFactory':getInstance())),
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
            (fun(Target_N68224) -> (get({Target_N68224, '$class'})):delete(Target_N68224, get({This, id})) end)((fun(Target_N68231) -> (get({Target_N68231, '$class'})):getXmlOptionItemsEntityInstance(Target_N68231) end)('XmlOptionItemsEntityFactory':getInstance())),
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
            (fun(Target_N68950) -> (get({Target_N68950, '$class'})):update(Target_N68950, Values) end)((fun(Target_N68957) -> (get({Target_N68957, '$class'})):getXmlOptionItemsEntityInstance(Target_N68957) end)('XmlOptionItemsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69188) -> (get({Target_N69188, '$class'})):toString(Target_N69188) end)((fun(Target_N69195) -> (get({Target_N69195, '$class'})):append(Target_N69195, Success) end)((fun(Target_N69202) -> (get({Target_N69202, '$class'})):append(Target_N69202, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N69209) -> (get({Target_N69209, '$class'})):append(Target_N69209, get({This, id})) end)('StringMaker':new())))), This, "update()");
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

