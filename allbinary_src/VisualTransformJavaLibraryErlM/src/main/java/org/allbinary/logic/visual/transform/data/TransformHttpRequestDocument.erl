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
% package org.allbinary.logic.visual.transform.data
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.http.AcceptableResponseGenerator
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('TransformHttpRequestDocument').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TransformDocumentInterface

static_init() ->
    put({?MODULE, language}, "en"),
    put({?MODULE, local}, "US"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, baseNode}, undefined),
    put({This, document}, undefined),
    ok.


new(PageContext, WeblisketSession) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PageContext, WeblisketSession),
    This.

init(This, PageContext, WeblisketSession) ->
    init_fields(This),
        try
            ContentType = (fun(Target_N66264) -> (get({Target_N66264, '$class'})):get(Target_N66264, (get({PageContext, '$class'})):getRequest(PageContext)) end)('AcceptableResponseGenerator':getInstance()),
            put({This, document}, 'DomDocumentHelper':create()),
            ContentTypeNode = (get({get({This, document}), '$class'})):createElement(get({This, document}), ContentType),
            LanguageTypeNode = (get({get({This, document}), '$class'})):createElement(get({This, document}), get({'TransformHttpRequestDocument', language})),
            LocalTypeNode = (get({get({This, document}), '$class'})):createElement(get({This, document}), get({'TransformHttpRequestDocument', local})),
            put({This, baseNode}, LocalTypeNode),
            (get({LanguageTypeNode, '$class'})):appendChild(LanguageTypeNode, LocalTypeNode),
            (get({ContentTypeNode, '$class'})):appendChild(ContentTypeNode, LanguageTypeNode),
            (get({get({This, document}), '$class'})):appendChild(get({This, document}), ContentTypeNode),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):log(This), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

new(SearchRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SearchRequest),
    This.

init(This, SearchRequest) ->
    init_fields(This),
        try
            ContentType = (get({SearchRequest, '$class'})):getContentType(SearchRequest),
            put({This, document}, 'DomDocumentHelper':create()),
            ContentTypeNode = (get({get({This, document}), '$class'})):createElement(get({This, document}), ContentType),
            LanguageTypeNode = (get({get({This, document}), '$class'})):createElement(get({This, document}), get({'TransformHttpRequestDocument', language})),
            LocalTypeNode = (get({get({This, document}), '$class'})):createElement(get({This, document}), get({'TransformHttpRequestDocument', local})),
            put({This, baseNode}, LocalTypeNode),
            (get({LanguageTypeNode, '$class'})):appendChild(LanguageTypeNode, LocalTypeNode),
            (get({ContentTypeNode, '$class'})):appendChild(ContentTypeNode, LanguageTypeNode),
            (get({get({This, document}), '$class'})):appendChild(get({This, document}), ContentTypeNode)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

getBaseNode(This) ->
        get({This, baseNode}).

getDoc(This) ->
        get({This, document}).

% throws Exception
log(This) ->
        StringBuffer = 'StringMaker':new(),
        case (get({This, baseNode}) =/= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "BaseNode: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, baseNode}), '$class'})):getNodeName(get({This, baseNode})));
            false ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Log-Error: BaseNode is Null")
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nDocument: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'XmlDocumentHelper':toString(get({This, document}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

