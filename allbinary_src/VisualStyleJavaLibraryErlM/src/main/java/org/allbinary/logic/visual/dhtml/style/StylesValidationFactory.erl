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
% package org.allbinary.logic.visual.dhtml.style
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.http.request.NameSpaceRequestParamData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.dhtml.style.css.CssElementData
% import org.allbinary.logic.visual.dhtml.style.css.CssElementsValidationFactory
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('StylesValidationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StylesValidationFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'StylesValidationFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, Document) ->
        try
        CommonStrings = 'CommonStrings':getInstance(),
        NodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'StylesData':getInstance(), 'NAME'})),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Style Present: ", 'XmlDocumentHelper':toString(Document)]), This, get({CommonStrings, 'GET_INSTANCE'}));
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Styles Present: ", (get({NodeList, '$class'})):getLength(NodeList)]), This, get({CommonStrings, 'GET_INSTANCE'}));
            false -> ok
        end,
        lists:foreach(fun(Index) ->
            StylesNode = (get({NodeList, '$class'})):item(NodeList, Index),
            StyleNodeList = 'DomSearchHelper':getAllNodes(get({'StyleData':getInstance(), 'NAME'}), (get({StylesNode, '$class'})):getChildNodes(StylesNode)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Style Nodes Present: ", (get({StyleNodeList, '$class'})):size(StyleNodeList)]), This, get({CommonStrings, 'GET_INSTANCE'}));
                false -> ok
            end,
            lists:foreach(fun(StyleNodesIndex) ->
                StyleNode = (get({StyleNodeList, '$class'})):get(StyleNodeList, StyleNodesIndex),
                CssElementStyleNodeList = 'DomSearchHelper':getAllNodes(get({'CssElementData':getInstance(), 'NAME'}), (get({StyleNode, '$class'})):getChildNodes(StyleNode)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Element Nodes Present: ", (get({CssElementStyleNodeList, '$class'})):size(CssElementStyleNodeList)]), This, get({CommonStrings, 'GET_INSTANCE'}));
                    false -> ok
                end,
                throw({'$return', 'CssElementsValidationFactory':getInstance(CssElementStyleNodeList)})
            end, lists:seq(0, (get({StyleNodeList, '$class'})):size(StyleNodeList) - 1))
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "No Style Present", This, get({CommonStrings, 'GET_INSTANCE'}));
            false -> ok
        end,
        'BasicArrayListD':new()
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getInstance(HashMap) ->
        StylesDocument = (get({HashMap, '$class'})):get(HashMap, get({'NameSpaceRequestParamData', 'DOCUMENT'})),
        (fun(Target_N68174) -> (get({Target_N68174, '$class'})):getInstance(Target_N68174, StylesDocument) end)('StylesValidationFactory':getInstance()).

