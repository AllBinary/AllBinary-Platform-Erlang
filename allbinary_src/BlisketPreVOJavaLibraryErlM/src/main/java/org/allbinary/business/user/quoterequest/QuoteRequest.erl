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
% package org.allbinary.business.user.quoterequest
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.quoterequest.QuoteRequestData
% import org.allbinary.business.user.UserData
% import org.allbinary.data.generator.QuoteRequestIdGenerator
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('QuoteRequest').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, id}, undefined),
    put({This, userName}, undefined),
    put({This, projectInfo}, undefined),
    put({This, userComments}, undefined),
    put({This, budget}, undefined),
    put({This, timeFrame}, undefined),
    put({This, comments}, undefined),
    ok.


new(UserName, Request) when (is_list(UserName) orelse UserName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UserName, Request),
    This.

init(This, UserName, Request) when (is_list(UserName) orelse UserName =:= undefined) ->
    init_fields(This),
        QuoteRequestData = 'QuoteRequestData':getInstance(),
        put({This, id}, (fun(Target_N66382) -> (get({Target_N66382, '$class'})):getNext(Target_N66382) end)('QuoteRequestIdGenerator':new())),
        (get({This, '$class'})):setUserName(This, UserName),
        (get({This, '$class'})):setProjectInfo(This, (get({Request, '$class'})):getParameter(Request, get({QuoteRequestData, 'PROJECT_INFO'}))),
        (get({This, '$class'})):setUserComments(This, (get({Request, '$class'})):getParameter(Request, get({QuoteRequestData, 'CUSTOMER_COMMENTS'}))),
        (get({This, '$class'})):setBudget(This, (get({Request, '$class'})):getParameter(Request, get({QuoteRequestData, 'BUDGET'}))),
        (get({This, '$class'})):setTimeFrame(This, (get({Request, '$class'})):getParameter(Request, get({QuoteRequestData, 'TIMEFRAME'}))),
        (get({This, '$class'})):setComments(This, (get({Request, '$class'})):getParameter(Request, get({QuoteRequestData, 'COMMENTS'}))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Created with: ", (get({This, '$class'})):toHashMap(This)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, HashMap) ->
    init_fields(This),
        QuoteRequestData = 'QuoteRequestData':getInstance(),
        put({This, id}, (get({HashMap, '$class'})):get(HashMap, get({QuoteRequestData, 'ID'}))),
        (get({This, '$class'})):setUserName(This, (get({HashMap, '$class'})):get(HashMap, get({'UserData', 'USERNAME'}))),
        (get({This, '$class'})):setProjectInfo(This, (get({HashMap, '$class'})):get(HashMap, get({QuoteRequestData, 'PROJECT_INFO'}))),
        (get({This, '$class'})):setUserComments(This, (get({HashMap, '$class'})):get(HashMap, get({QuoteRequestData, 'CUSTOMER_COMMENTS'}))),
        (get({This, '$class'})):setBudget(This, (get({HashMap, '$class'})):get(HashMap, get({QuoteRequestData, 'BUDGET'}))),
        (get({This, '$class'})):setTimeFrame(This, (get({HashMap, '$class'})):get(HashMap, get({QuoteRequestData, 'TIMEFRAME'}))),
        (get({This, '$class'})):setComments(This, (get({HashMap, '$class'})):get(HashMap, get({QuoteRequestData, 'COMMENTS'}))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Created with: ", (get({This, '$class'})):toHashMap(This)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

isValid(This) ->
        try
            put({local, valid}, true),
            case (((get({This, userName}) =:= undefined) orelse (string:length(get({This, userName})) < 4)) orelse (string:length(get({This, userName})) > 250)) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (((get({This, projectInfo}) =:= undefined) orelse (string:length(get({This, projectInfo})) < 0)) orelse (string:length(get({This, projectInfo})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (((get({This, userComments}) =:= undefined) orelse (string:length(get({This, userComments})) < 0)) orelse (string:length(get({This, userComments})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (((get({This, budget}) =:= undefined) orelse (string:length(get({This, budget})) < 0)) orelse (string:length(get({This, budget})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (((get({This, timeFrame}) =:= undefined) orelse (string:length(get({This, timeFrame})) < 0)) orelse (string:length(get({This, timeFrame})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (((get({This, comments}) =:= undefined) orelse (string:length(get({This, comments})) < 0)) orelse (string:length(get({This, comments})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            get({local, valid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case (((get({This, userName}) =:= undefined) orelse (string:length(get({This, userName})) < 4)) orelse (string:length(get({This, userName})) > 250)) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a User Name with more than 4 characters.<br>");
                false -> ok
            end,
            case (((get({This, projectInfo}) =:= undefined) orelse (string:length(get({This, projectInfo})) < 0)) orelse (string:length(get({This, projectInfo})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Please enter Project Info with less than ", get({'AbSqlData', 'MAXBLOB'})]), " characters.<br>"]));
                false -> ok
            end,
            case (((get({This, userComments}) =:= undefined) orelse (string:length(get({This, userComments})) < 0)) orelse (string:length(get({This, userComments})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Please enter User Comments with less than ", get({'AbSqlData', 'MAXBLOB'})]), " characters.<br>"]));
                false -> ok
            end,
            case (((get({This, budget}) =:= undefined) orelse (string:length(get({This, budget})) < 0)) orelse (string:length(get({This, budget})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Please enter Budget with less than ", get({'AbSqlData', 'MAXBLOB'})]), " characters.<br>"]));
                false -> ok
            end,
            case (((get({This, timeFrame}) =:= undefined) orelse (string:length(get({This, timeFrame})) < 0)) orelse (string:length(get({This, timeFrame})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Please enter time frame with less than ", get({'AbSqlData', 'MAXBLOB'})]), " characters.<br>"]));
                false -> ok
            end,
            case (((get({This, comments}) =:= undefined) orelse (string:length(get({This, comments})) < 0)) orelse (string:length(get({This, comments})) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Please enter comments with less than ", get({'AbSqlData', 'MAXBLOB'})]), " characters.<br>"]));
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toVector(This) ->
        Values = 'BasicArrayListD':new(),
        (get({Values, '$class'})):add(Values, get({This, id})),
        (get({Values, '$class'})):add(Values, get({This, userName})),
        (get({Values, '$class'})):add(Values, get({This, projectInfo})),
        (get({Values, '$class'})):add(Values, get({This, userComments})),
        (get({Values, '$class'})):add(Values, get({This, budget})),
        (get({Values, '$class'})):add(Values, get({This, timeFrame})),
        (get({Values, '$class'})):add(Values, get({This, comments})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N70735) -> (get({Target_N70735, '$class'})):toString(Target_N70735) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):add(Values, Time),
        (get({Values, '$class'})):add(Values, Time),
        Values.

toHashMap(This) ->
        QuoteRequestData = 'QuoteRequestData':getInstance(),
        Values = (fun(Target_N70950) -> (get({Target_N70950, '$class'})):createHashMap(Target_N70950) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({'UserData', 'USERNAME'}), get({This, userName})),
        (get({Values, '$class'})):put(Values, get({QuoteRequestData, 'PROJECT_INFO'}), get({This, projectInfo})),
        (get({Values, '$class'})):put(Values, get({QuoteRequestData, 'CUSTOMER_COMMENTS'}), get({This, userComments})),
        (get({Values, '$class'})):put(Values, get({QuoteRequestData, 'BUDGET'}), get({This, budget})),
        (get({Values, '$class'})):put(Values, get({QuoteRequestData, 'TIMEFRAME'}), get({This, timeFrame})),
        (get({Values, '$class'})):put(Values, get({QuoteRequestData, 'COMMENTS'}), get({This, comments})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N71354) -> (get({Target_N71354, '$class'})):toString(Target_N71354) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userName}, Value).

setProjectInfo(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, projectInfo}, Value).

setUserComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userComments}, Value).

setBudget(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, budget}, Value).

setTimeFrame(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, timeFrame}, Value).

setComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, comments}, Value),
        StringUtil = 'StringUtil':getInstance(),
        case (get({This, comments}) =:= undefined) of
            true ->
            put({This, comments}, get({StringUtil, 'EMPTY_STRING'}));
            false -> ok
        end.

getUserName(This) ->
        get({This, userName}).

getProjectInfo(This) ->
        get({This, projectInfo}).

getUserComments(This) ->
        get({This, userComments}).

getBudget(This) ->
        get({This, budget}).

getTimeFrame(This) ->
        get({This, timeFrame}).

getComments(This) ->
        get({This, comments}).

