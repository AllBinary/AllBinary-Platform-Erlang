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
% package org.allbinary.logic.control.search
% import java.util.HashMap
% import java.util.Set
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.data.tree.dom.ToDomHelper
% import org.allbinary.logic.StdUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('SearchParams').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, columnsAndSearchValues}, undefined),
    put({This, order}, undefined),
    put({This, sortBy}, undefined),
    put({This, listLength}, undefined),
    put({This, startPage}, undefined),
    put({This, endPage}, undefined),
    ok.


new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Request),
    This.

init(This, Request) ->
    init_fields(This),
        put({This, columnsAndSearchValues}, (fun(Target_N66004) -> (get({Target_N66004, '$class'})):createHashMap(Target_N66004) end)('StdUtil':getInstance())),
        (get({This, '$class'})):setLength(This, (get({Request, '$class'})):getParameter(Request, get({'SearchData', 'LENGTH'}))),
        (get({This, '$class'})):setOrder(This, (get({Request, '$class'})):getParameter(Request, get({'SearchData', 'ORDER'}))),
        Page = (get({Request, '$class'})):getParameter(Request, get({'SearchData', 'PAGE'})),
        (get({This, '$class'})):setStartPage(This, Page),
        (get({This, '$class'})):setEndPage(This, Page),
        (get({This, '$class'})):setSortBy(This, (get({Request, '$class'})):getParameter(Request, get({'SearchData', 'SORTBY'}))),
        put({local, index}, 0),
        put({local, columnName}, (get({Request, '$class'})):getParameter(Request, lists:concat([get({'SearchData', 'COLUMNNAME'}), "[0]"]))),
        put({local, columnValue}, (get({Request, '$class'})):getParameter(Request, lists:concat([get({'SearchData', 'COLUMNVALUE'}), "[0]"]))),
        (fun Loop() -> case (get({local, columnName}) =/= undefined) of true ->
            (get({This, '$class'})):add(This, get({local, columnName}), get({local, columnValue})),
            put({local, index}, get({local, index}) + 1),
            put({local, columnName}, (get({Request, '$class'})):getParameter(Request, lists:concat([lists:concat([lists:concat([get({'SearchData', 'COLUMNNAME'}), "["]), get({local, index})]), "]"]))),
            put({local, columnValue}, (get({Request, '$class'})):getParameter(Request, lists:concat([lists:concat([lists:concat([get({'SearchData', 'COLUMNVALUE'}), "["]), get({local, index})]), "]"]))),
            Loop();
        false -> ok end end)().

add(This, Column, Value) when (is_list(Column) orelse Column =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, columnsAndSearchValues}), '$class'})):put(get({This, columnsAndSearchValues}), Column, Value).

setOrder(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, order}, Value).

setSortBy(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, sortBy}, Value).

setLength(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, listLength}, Value).

setStartPage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, startPage}, Value).

setEndPage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, endPage}, Value).

get(This) ->
        get({This, columnsAndSearchValues}).

getOrder(This) ->
        get({This, order}).

getSortBy(This) ->
        get({This, sortBy}).

getLength(This) ->
        get({This, listLength}).

getLengthInt(This) ->
        try
        case (get({This, listLength}) =/= undefined) of
            true ->
            throw({'$return', get({This, listLength})});
            false ->
            0
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getStartPage(This) ->
        get({This, startPage}).

getEndPage(This) ->
        get({This, endPage}).

getStartPageInt(This) ->
        try
        case (get({This, startPage}) =/= undefined) of
            true ->
            throw({'$return', get({This, startPage})});
            false ->
            0
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getEndPageInt(This) ->
        try
        case (get({This, endPage}) =/= undefined) of
            true ->
            throw({'$return', get({This, endPage})});
            false ->
            0
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getParamsNode(This, Document) ->
        ParamsNode = 'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'PARAMS'}), get({'SearchData', 'PARAMS'})),
        (get({ParamsNode, '$class'})):appendChild(ParamsNode, (get({This, '$class'})):getFieldsNode(This, Document)),
        (get({ParamsNode, '$class'})):appendChild(ParamsNode, (get({This, '$class'})):getOrderNode(This, Document)),
        (get({ParamsNode, '$class'})):appendChild(ParamsNode, (get({This, '$class'})):getSortByNode(This, Document)),
        (get({ParamsNode, '$class'})):appendChild(ParamsNode, (get({This, '$class'})):getLengthNode(This, Document)),
        ParamsNode.

% throws Exception
getFieldsNode(This, Document) ->
        FieldsNode = 'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'FIELDS'}), (fun(Target_N68243) -> (get({Target_N68243, '$class'})):toString(Target_N68243) end)((get({get({This, columnsAndSearchValues}), '$class'})):size(get({This, columnsAndSearchValues})))),
        Set = (get({get({This, columnsAndSearchValues}), '$class'})):keySet(get({This, columnsAndSearchValues})),
        SearchValueArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(SearchValueArray),
        lists:foreach(fun(Index) ->
            Key = array:get(Index, SearchValueArray),
            SearchValue = (get({get({This, columnsAndSearchValues}), '$class'})):get(get({This, columnsAndSearchValues}), Key),
            (get({FieldsNode, '$class'})):appendChild(FieldsNode, 'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'FIELD'}), Key, 'ToDomHelper':convertNull(SearchValue)))
        end, lists:seq(0, Size - 1)),
        FieldsNode.

% throws Exception
getOrderNode(This, Document) ->
        'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'ORDER'}), 'ToDomHelper':convertNull((get({This, '$class'})):getOrder(This))).

% throws Exception
getSortByNode(This, Document) ->
        'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'SORTBY'}), 'ToDomHelper':convertNull((get({This, '$class'})):getSortBy(This))).

% throws Exception
getLengthNode(This, Document) ->
        'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'LENGTH'}), 'ToDomHelper':convertNull((get({This, '$class'})):getLength(This))).

