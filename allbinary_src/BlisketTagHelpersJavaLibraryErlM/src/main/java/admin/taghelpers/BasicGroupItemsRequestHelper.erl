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
% import org.allbinary.business.user.commerce.inventory.item.group.BasicGroupItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.groups.BasicGroupItemsEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('BasicGroupItemsRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, itemOne}, undefined),
    put({This, itemTwo}, undefined),
    put({This, itemThree}, undefined),
    put({This, itemFour}, undefined),
    put({This, itemFive}, undefined),
    put({This, itemSix}, undefined),
    put({This, itemSeven}, undefined),
    put({This, itemEight}, undefined),
    put({This, itemNine}, undefined),
    put({This, itemTen}, undefined),
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
        put({This, itemOne}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_ONE'}))),
        put({This, itemTwo}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_TWO'}))),
        put({This, itemThree}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_THREE'}))),
        put({This, itemFour}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_FOUR'}))),
        put({This, itemFive}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_FIVE'}))),
        put({This, itemSix}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_SIX'}))),
        put({This, itemSeven}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_SEVEN'}))),
        put({This, itemEight}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_EIGHT'}))),
        put({This, itemNine}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_NINE'}))),
        put({This, itemTen}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasicGroupItemData', 'ITEM_TEN'}))),
        put({This, timeEntered}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

getHashMap(This) ->
        Values = (fun(Target_N67475) -> (get({Target_N67475, '$class'})):createHashMap(Target_N67475) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({get({This, basicItemData}), 'ID'}), get({This, id})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_ONE'}), get({This, itemOne})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_TWO'}), get({This, itemTwo})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_THREE'}), get({This, itemThree})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_FOUR'}), get({This, itemFour})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_FIVE'}), get({This, itemFive})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_SIX'}), get({This, itemSix})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_SEVEN'}), get({This, itemSeven})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_EIGHT'}), get({This, itemEight})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_NINE'}), get({This, itemNine})),
        (get({Values, '$class'})):put(Values, get({'BasicGroupItemData', 'ITEM_TEN'}), get({This, itemTen})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N68129) -> (get({Target_N68129, '$class'})):toString(Target_N68129) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

insert(This) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N68358) -> (get({Target_N68358, '$class'})):toString(Target_N68358) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, get({This, id})),
            (get({Values, '$class'})):add(Values, get({This, itemOne})),
            (get({Values, '$class'})):add(Values, get({This, itemTwo})),
            (get({Values, '$class'})):add(Values, get({This, itemThree})),
            (get({Values, '$class'})):add(Values, get({This, itemFour})),
            (get({Values, '$class'})):add(Values, get({This, itemFive})),
            (get({Values, '$class'})):add(Values, get({This, itemSix})),
            (get({Values, '$class'})):add(Values, get({This, itemSeven})),
            (get({Values, '$class'})):add(Values, get({This, itemEight})),
            (get({Values, '$class'})):add(Values, get({This, itemNine})),
            (get({Values, '$class'})):add(Values, get({This, itemTen})),
            (get({Values, '$class'})):add(Values, Time),
            (get({Values, '$class'})):add(Values, Time),
            (fun(Target_N68893) -> (get({Target_N68893, '$class'})):insert(Target_N68893, Values) end)((fun(Target_N68900) -> (get({Target_N68900, '$class'})):getBasicGroupItemsEntityInstance(Target_N68900) end)('BasicGroupItemsEntityFactory':getInstance())),
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
            (fun(Target_N69597) -> (get({Target_N69597, '$class'})):delete(Target_N69597, get({This, id})) end)((fun(Target_N69604) -> (get({Target_N69604, '$class'})):getBasicGroupItemsEntityInstance(Target_N69604) end)('BasicGroupItemsEntityFactory':getInstance())),
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
            (fun(Target_N70323) -> (get({Target_N70323, '$class'})):update(Target_N70323, Values) end)((fun(Target_N70330) -> (get({Target_N70330, '$class'})):getBasicGroupItemsEntityInstance(Target_N70330) end)('BasicGroupItemsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70561) -> (get({Target_N70561, '$class'})):toString(Target_N70561) end)((fun(Target_N70568) -> (get({Target_N70568, '$class'})):append(Target_N70568, Success) end)((fun(Target_N70575) -> (get({Target_N70575, '$class'})):append(Target_N70575, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N70582) -> (get({Target_N70582, '$class'})):append(Target_N70582, get({This, id})) end)('StringMaker':new())))), This, "update()");
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

