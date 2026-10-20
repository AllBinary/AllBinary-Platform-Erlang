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
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.AbContext
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('SearchRequest').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbContext', Function, Arguments).

init_fields(This) ->
    put({This, xslFile}, undefined),
    put({This, pageName}, undefined),
    put({This, contentType}, undefined),
    put({This, searchParams}, undefined),
    put({This, storeFront}, undefined),
    ok.


new(StoreFront, SearchParams, XslFile, ContentType, PropertiesHashMap, PageContext) when (is_list(XslFile) orelse XslFile =:= undefined), (is_list(ContentType) orelse ContentType =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreFront, SearchParams, XslFile, ContentType, PropertiesHashMap, PageContext),
    This.

'$init'(This, StoreFront, SearchParams, XslFile, ContentType, PropertiesHashMap, PageContext) when (is_list(XslFile) orelse XslFile =:= undefined), (is_list(ContentType) orelse ContentType =:= undefined) ->
        'AbContext':'$init'(This, PropertiesHashMap, PageContext),
        init_fields(This),
        put({This, storeFront}, StoreFront),
        put({This, searchParams}, SearchParams),
        put({This, xslFile}, XslFile),
        put({This, pageName}, get({This, pageName})),
        put({This, contentType}, ContentType).

setStoreFront(This, StoreFront) ->
        put({This, storeFront}, StoreFront).

setParams(This, SearchParams) ->
        put({This, searchParams}, SearchParams).

setXslFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, xslFile}, Value).

setFileBaseName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, pageName}, Value).

setContentType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, contentType}, Value).

getStoreFront(This) ->
        get({This, storeFront}).

getParams(This) ->
        get({This, searchParams}).

getXslFile(This) ->
        get({This, xslFile}).

getFileBaseName(This) ->
        get({This, pageName}).

getContentType(This) ->
        get({This, contentType}).

% throws Exception
getFileBaseNameNode(This, Document) ->
        'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'FILENAME'}), (get({This, '$class'})):getFileBaseName(This)).

