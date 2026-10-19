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
% package org.allbinary.logic.control.workflow.request
% import java.util.Calendar
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.workflow.WorkFlowData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicWorkFlow').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, workFlowDoc}, undefined),
    put({This, workFlowName}, undefined),
    put({This, storeName}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, workFlowName}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        put({This, workFlowDoc}, 'DomDocumentHelper':create()),
        WorkFlowNode = (get({get({This, workFlowDoc}), '$class'})):createElement(get({This, workFlowDoc}), get({'WorkFlowData':getInstance(), 'WORKFLOW'})),
        (get({get({This, workFlowDoc}), '$class'})):appendChild(get({This, workFlowDoc}), WorkFlowNode).

new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap, PageContext),
    This.

init(This, HashMap, PageContext) ->
    init_fields(This),
        WeblisketSession = 'WeblisketSession':new(HashMap, PageContext),
        put({This, storeName}, (get({WeblisketSession, '$class'})):getStoreName(WeblisketSession)),
        RequestHashMap = (fun(Target_N66748) -> (get({Target_N66748, '$class'})):toHashMap(Target_N66748) end)('RequestParams':new(PageContext)),
        put({This, workFlowName}, (get({RequestHashMap, '$class'})):get(RequestHashMap, get({'WorkFlowData':getInstance(), 'NAME'}))),
        put({This, workFlowDoc}, 'DomDocumentHelper':create((get({RequestHashMap, '$class'})):get(RequestHashMap, get({'WorkFlowData':getInstance(), 'DATA'})))).

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, HashMap) ->
    init_fields(This),
        put({This, workFlowName}, (get({HashMap, '$class'})):get(HashMap, get({'WorkFlowData':getInstance(), 'NAME'}))),
        put({This, storeName}, (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'}))),
        put({This, workFlowDoc}, 'DomDocumentHelper':create((get({HashMap, '$class'})):get(HashMap, get({'WorkFlowData':getInstance(), 'DATA'})))).

getName(This) ->
        get({This, workFlowName}).

getStoreName(This) ->
        get({This, storeName}).

getKey(This) ->
        (get({This, '$class'})):getName(This).

% throws Exception
toVector(This) ->
        Values = 'BasicArrayListD':new(),
        (get({Values, '$class'})):add(Values, get({This, workFlowName})),
        (get({Values, '$class'})):add(Values, get({This, storeName})),
        (get({Values, '$class'})):add(Values, 'XmlDocumentHelper':toString(get({This, workFlowDoc}))),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N67717) -> (get({Target_N67717, '$class'})):toString(Target_N67717) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):add(Values, Time),
        (get({Values, '$class'})):add(Values, Time),
        Values.

% throws Exception
toHashMap(This) ->
        HashMap = (fun(Target_N67900) -> (get({Target_N67900, '$class'})):createHashMap(Target_N67900) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'WorkFlowData':getInstance(), 'NAME'}), get({This, workFlowName})),
        (get({HashMap, '$class'})):put(HashMap, get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
        (get({HashMap, '$class'})):put(HashMap, get({'WorkFlowData':getInstance(), 'DATA'}), 'XmlDocumentHelper':toString(get({This, workFlowDoc}))),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N68200) -> (get({Target_N68200, '$class'})):toString(Target_N68200) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        HashMap.

toXmlNode(This, Document) ->
        try
            HashMap = (get({This, '$class'})):toHashMap(This),
            KeySet = (get({HashMap, '$class'})):keySet(HashMap),
            Node = (get({Document, '$class'})):createElement(Document, get({'WorkFlowData':getInstance(), 'WORKFLOW'})),
            NameArray = (get({KeySet, '$class'})):toArray(KeySet),
            Size = array:size(NameArray),
            lists:foreach(fun(Index) ->
                Name = array:get(Index, NameArray),
                Value = (get({HashMap, '$class'})):get(HashMap, Name),
                (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, Value))
            end, lists:seq(0, Size - 1)),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "toXmlNode()", E);
                false -> ok
            end,
            undefined
        end.

toXmlDoc(This) ->
        try
            get({This, workFlowDoc})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "toXmlDoc()", E);
                false -> ok
            end,
            undefined
        end.

isValid(This) ->
        try
            put({local, returnBoolean}, true),
            case (get({This, workFlowName}) =:= undefined) of
                true ->
                put({local, returnBoolean}, false);
                false -> ok
            end,
            get({local, returnBoolean})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case (get({This, workFlowName}) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "No WorkFlow name specified.");
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Getting Validation Info"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

