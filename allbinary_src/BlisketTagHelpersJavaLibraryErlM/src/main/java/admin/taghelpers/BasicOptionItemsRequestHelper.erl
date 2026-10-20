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
% import org.allbinary.business.user.commerce.inventory.item.option.BasicOptionItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.options.BasicOptionItemsEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('BasicOptionItemsRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, optionOneTitle}, undefined),
    put({This, defaultOptionItem}, undefined),
    put({This, defaultOptionValue}, undefined),
    put({This, optionItem}, undefined),
    put({This, optionValue}, undefined),
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
        put({This, optionItem}, 'BasicArrayListD':new()),
        put({This, optionValue}, 'BasicArrayListD':new()),
        put({This, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'ID'}))),
        put({This, optionOneTitle}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_TITLE'}))),
        put({This, defaultOptionItem}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'DEFAULT_OPTION_ITEM'}))),
        put({This, defaultOptionValue}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'DEFAULT_OPTION_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_ONE_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_ONE_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_TWO_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_TWO_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_THREE_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_THREE_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_FOUR_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_FOUR_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_FIVE_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_FIVE_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_SIX_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_SIX_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_SEVEN_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_SEVEN_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_EIGHT_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_EIGHT_VALUE'}))),
        (get({get({This, optionItem}), '$class'})):add(get({This, optionItem}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_NINE_ITEM'}))),
        (get({get({This, optionValue}), '$class'})):add(get({This, optionValue}), (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicOptionItemData', 'OPTION_ONE_NINE_VALUE'}))),
        put({This, timeEntered}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

getHashMap(This) ->
        Values = (fun(Target_N68142) -> (get({Target_N68142, '$class'})):createHashMap(Target_N68142) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'ID'}), get({This, id})),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_ONE_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 0)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_ONE_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 0)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_TWO_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 1)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_TWO_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 1)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_THREE_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 2)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_THREE_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 2)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_FOUR_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 3)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_FOUR_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 3)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_FIVE_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 4)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_FIVE_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 4)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_SIX_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 5)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_SIX_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 5)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_SEVEN_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 6)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_SEVEN_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 6)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_EIGHT_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 7)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_EIGHT_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 7)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_NINE_ITEM'}), (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), 8)),
        (get({Values, '$class'})):put(Values, get({'BasicOptionItemData', 'OPTION_ONE_NINE_VALUE'}), (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), 8)),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N69480) -> (get({Target_N69480, '$class'})):toString(Target_N69480) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

insert(This) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N69723) -> (get({Target_N69723, '$class'})):toString(Target_N69723) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, get({This, id})),
            Size = (get({get({This, optionValue}), '$class'})):size(get({This, optionValue})),
            lists:foreach(fun(Index) ->
                (get({Values, '$class'})):add(Values, (get({get({This, optionValue}), '$class'})):get(get({This, optionValue}), Index)),
                (get({Values, '$class'})):add(Values, (get({get({This, optionItem}), '$class'})):get(get({This, optionItem}), Index))
            end, lists:seq(0, Size - 1)),
            (get({Values, '$class'})):add(Values, Time),
            (get({Values, '$class'})):add(Values, Time),
            (fun(Target_N70154) -> (get({Target_N70154, '$class'})):insert(Target_N70154, Values) end)((fun(Target_N70161) -> (get({Target_N70161, '$class'})):getBasicOptionItemsEntityInstance(Target_N70161) end)('BasicOptionItemsEntityFactory':getInstance())),
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
            (fun(Target_N70865) -> (get({Target_N70865, '$class'})):delete(Target_N70865, get({This, id})) end)((fun(Target_N70872) -> (get({Target_N70872, '$class'})):getBasicOptionItemsEntityInstance(Target_N70872) end)('BasicOptionItemsEntityFactory':getInstance())),
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
            (fun(Target_N71591) -> (get({Target_N71591, '$class'})):update(Target_N71591, Values) end)((fun(Target_N71598) -> (get({Target_N71598, '$class'})):getBasicOptionItemsEntityInstance(Target_N71598) end)('BasicOptionItemsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71829) -> (get({Target_N71829, '$class'})):toString(Target_N71829) end)((fun(Target_N71836) -> (get({Target_N71836, '$class'})):append(Target_N71836, Success) end)((fun(Target_N71843) -> (get({Target_N71843, '$class'})):append(Target_N71843, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N71850) -> (get({Target_N71850, '$class'})):append(Target_N71850, get({This, id})) end)('StringMaker':new())))), This, "update()");
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

