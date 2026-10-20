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
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('TableSearchRequest').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, xslFile}, undefined),
    put({This, pageName}, undefined),
    put({This, contentType}, undefined),
    put({This, keywords}, undefined),
    put({This, searchParams}, undefined),
    ok.


new(Keywords, SearchParams, XslFile, ContentType) when (is_list(Keywords) orelse Keywords =:= undefined), (is_list(XslFile) orelse XslFile =:= undefined), (is_list(ContentType) orelse ContentType =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Keywords, SearchParams, XslFile, ContentType),
    This.

'$init'(This, Keywords, SearchParams, XslFile, ContentType) when (is_list(Keywords) orelse Keywords =:= undefined), (is_list(XslFile) orelse XslFile =:= undefined), (is_list(ContentType) orelse ContentType =:= undefined) ->
    init_fields(This),
        put({This, keywords}, Keywords),
        put({This, searchParams}, SearchParams),
        put({This, xslFile}, XslFile),
        put({This, pageName}, get({This, pageName})),
        put({This, contentType}, ContentType).

setKeywords(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, keywords}, Value).

setParams(This, SearchParams) ->
        put({This, searchParams}, SearchParams).

setXslFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, xslFile}, Value).

setFileBaseName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, pageName}, Value).

setContentType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, contentType}, Value).

getKeywords(This) ->
        get({This, keywords}).

getParams(This) ->
        get({This, searchParams}).

% throws Exception
getXslFile(This) ->
        Path = lists:concat([((get({get({'TableSearchRequest', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TableSearchRequest', 'URLGLOBALS'})) + get({(get({get({'TableSearchRequest', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TableSearchRequest', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})), get({This, xslFile})]),
        Path.

getFileBaseName(This) ->
        get({This, pageName}).

getContentType(This) ->
        get({This, contentType}).

% throws Exception
getFileBaseNameNode(This, Document) ->
        'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'FILENAME'}), (get({This, '$class'})):getFileBaseName(This)).

