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
% package org.allbinary.business.user.commerce.inventory.item.download
% import java.util.Calendar
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('DownloadableItemView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, downloadableItem}, undefined),
    ok.


new(DownloadableItem) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DownloadableItem),
    This.

'$init'(This, DownloadableItem) ->
    init_fields(This),
        put({This, downloadableItem}, DownloadableItem).

% throws Exception
toXmlNode(This, Document) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "toXmlNode");
            false -> ok
        end,
        HashMap = (get({get({This, downloadableItem}), '$class'})):toHashMap(get({This, downloadableItem})),
        TotalTime = (fun(Target_N66379) -> (get({Target_N66379, '$class'})):longValue(Target_N66379) end)((get({get({This, downloadableItem}), '$class'})):getValidTime(get({This, downloadableItem}))),
        Calendar = 'Calendar':getInstance(),
        Year = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'YEAR'})),
        Month = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'MONTH'})),
        Day = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'DAY_OF_MONTH'})),
        Hour = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'HOUR'})),
        Minute = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'MINUTE'})),
        Second = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'SECOND'})),
        (get({Calendar, '$class'})):setTimeInMillis(Calendar, ((get({Calendar, '$class'})):getTimeInMillis(Calendar) + TotalTime)),
        YearDelta = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'YEAR'})),
        MonthDelta = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'MONTH'})),
        DayDelta = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'DAY_OF_MONTH'})),
        HourDelta = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'HOUR'})),
        MinuteDelta = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'MINUTE'})),
        SecondDelta = (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'SECOND'})),
        (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'VALID_TIME_YEARS'}), allbinary_java:to_string((YearDelta - Year))),
        (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'VALID_TIME_MONTHS'}), allbinary_java:to_string((MonthDelta - Month))),
        (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'VALID_TIME_DAYS'}), allbinary_java:to_string((DayDelta - Day))),
        (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'VALID_TIME_HOURS'}), allbinary_java:to_string((HourDelta - Hour))),
        (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'VALID_TIME_MINUTES'}), allbinary_java:to_string((MinuteDelta - Minute))),
        (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'VALID_TIME_SECONDS'}), allbinary_java:to_string((SecondDelta - Second))),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        Node = (get({Document, '$class'})):createElement(Document, get({'DownloadItemData', 'NAME'})),
        StringUtil = 'StringUtil':getInstance(),
        NameArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size = array:size(NameArray),
        lists:foreach(fun(Index) ->
            Name = array:get(Index, NameArray),
            put({local, value}, (get({HashMap, '$class'})):get(HashMap, Name)),
            put({local, value}, (get({StringUtil, '$class'})):getNonNull(StringUtil, get({local, value}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, get({local, value})))
        end, lists:seq(0, Size - 1)),
        Node.

toXmlDoc(This) ->
        undefined.

view(This) ->
        undefined.

