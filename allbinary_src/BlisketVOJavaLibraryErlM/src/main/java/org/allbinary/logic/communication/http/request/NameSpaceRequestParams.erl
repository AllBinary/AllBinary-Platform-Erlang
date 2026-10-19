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
% package org.allbinary.logic.communication.http.request
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.data.tree.dom.DomData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('NameSpaceRequestParams').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RequestParams', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'RequestParams':init(This),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Constructing empty", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

new(HttpServletRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HttpServletRequest),
    This;
new(PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PageContext),
    This.

init(This, HttpServletRequest) ->
        'RequestParams':init(This, HttpServletRequest),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Constructing from HttpServletRequest", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end;
init(This, PageContext) ->
        'RequestParams':init(This, PageContext),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Constructing from PageContext", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.


% throws Exception
createPackageNode(This, Document, PackageName, PackagePropertiesHashMap) when (is_list(PackageName) orelse PackageName =:= undefined) ->
        Node = (get({Document, '$class'})):createElement(Document, PackageName),
        PropertyKeySet = (get({PackagePropertiesHashMap, '$class'})):keySet(PackagePropertiesHashMap),
        PropertyKeySetArray = (get({PropertyKeySet, '$class'})):toArray(PropertyKeySet),
        Size = array:size(PropertyKeySetArray),
        lists:foreach(fun(Index) ->
            PropertyName = array:get(Index, PropertyKeySetArray),
            PropertyValue = (get({PackagePropertiesHashMap, '$class'})):get(PackagePropertiesHashMap, PropertyName),
            PropertyNode = 'ModDomHelper':createTextNode(Document, PropertyName, PropertyValue),
            (get({Node, '$class'})):appendChild(Node, PropertyNode)
        end, lists:seq(0, Size - 1)),
        Node.

% throws Exception
createPackageMultiNode(This, Document, NameSpaceRequestParam, PackageName, PackagePropertiesHashMap) when (is_list(PackageName) orelse PackageName =:= undefined) ->
        BeginIndex = allbinary_java:index_of(PackageName, $[),
        IndexValue = string:slice(PackageName, (BeginIndex + 1), ((string:length(PackageName) - 1)) - ((BeginIndex + 1))),
        MultiElementPackage = string:slice(PackageName, 0, (BeginIndex) - (0)),
        put({local, selectedValue}, (get({NameSpaceRequestParam, '$class'})):getValue(NameSpaceRequestParam)),
        PropertyValue = (get({PackagePropertiesHashMap, '$class'})):get(PackagePropertiesHashMap, get({'DomData', 'VALUE'})),
        case ((get({PropertyValue, '$class'})):compareTo(PropertyValue, get({'NameSpaceRequestParamData', 'VALUE'})) =/= 0) of
            true ->
            put({local, selectedValue}, PropertyValue);
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["\nAppending Multinode Element: ", MultiElementPackage]), "["]), IndexValue]), "] "]), get({local, selectedValue})]), This, "createPackageMultiNode");
            false -> ok
        end,
        NextNode = 'ModDomHelper':createNameValueNodes(Document, MultiElementPackage, get({local, selectedValue})),
        IndexNode = 'ModDomHelper':createTextNode(Document, get({'DomData', 'INDEX'}), IndexValue),
        (get({NextNode, '$class'})):appendChild(NextNode, IndexNode),
        NextNode.

% throws Exception
getRootNode(This, RootElementPackage, PackagePropertiesHashMap, Document) when (is_list(RootElementPackage) orelse RootElementPackage =:= undefined) ->
        try
        RootNode = 'DomSearchHelper':getNodeNoThrow(RootElementPackage, (get({Document, '$class'})):getChildNodes(Document)),
        case (RootNode =:= undefined) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat(["\nAppending Document Root: ", "\nElementName: "]), RootElementPackage]), "\nProperties: "]), (get({PackagePropertiesHashMap, '$class'})):toString(PackagePropertiesHashMap)]), This, "getRootNode");
                false -> ok
            end,
            Node = (get({This, '$class'})):createPackageNode(This, Document, RootElementPackage, PackagePropertiesHashMap),
            (get({Document, '$class'})):appendChild(Document, Node),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nAppended Document Created: ", 'XmlDocumentHelper':toString(Document)]), This, "getRootNode");
                false -> ok
            end,
            throw({'$return', Node});
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "\nUsing Existing Root Node", This, "getRootNode");
                false -> ok
            end,
            throw({'$return', RootNode})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addNewProperties(This, Document, Node, NextPackagePropertiesHashMap) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69870) -> (get({Target_N69870, '$class'})):toString(Target_N69870) end)((fun(Target_N69877) -> (get({Target_N69877, '$class'})):append(Target_N69877, (get({Node, '$class'})):getNodeName(Node)) end)((fun(Target_N69884) -> (get({Target_N69884, '$class'})):append(Target_N69884, "\nto node: ") end)((fun(Target_N69891) -> (get({Target_N69891, '$class'})):append(Target_N69891, (get({NextPackagePropertiesHashMap, '$class'})):toString(NextPackagePropertiesHashMap)) end)((fun(Target_N69898) -> (get({Target_N69898, '$class'})):append(Target_N69898, "\nAdding Any New Properties: ") end)('StringMaker':new()))))), This, "addNewProperties");
            false -> ok
        end,
        PropertyNameSet = (get({NextPackagePropertiesHashMap, '$class'})):keySet(NextPackagePropertiesHashMap),
        PropertyNameSetArray = (get({PropertyNameSet, '$class'})):toArray(PropertyNameSet),
        Size = array:size(PropertyNameSetArray),
        lists:foreach(fun(Index) ->
            NextPropertyName = array:get(Index, PropertyNameSetArray),
            PropertyValue = (fun(Target_N70216) -> (get({Target_N70216, '$class'})):getNonNull(Target_N70216, (get({NextPackagePropertiesHashMap, '$class'})):get(NextPackagePropertiesHashMap, NextPropertyName)) end)('StringUtil':getInstance()),
            ValueNode = 'DomSearchHelper':getNodeNoThrow(NextPropertyName, (get({Node, '$class'})):getChildNodes(Node)),
            case (ValueNode =/= undefined) of
                true ->
                ExistingElementNodeTextNodeValue = 'DomNodeHelper':getTextNodeValue(ValueNode),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["\nIf property: \"", NextPropertyName]), " is the same as:\n"]), "Node: "]), (get({Node, '$class'})):getNodeName(Node)]), " then: "]), PropertyValue]), "=="]), ExistingElementNodeTextNodeValue]), This, "addNewProperties");
                    false -> ok
                end,
                case ((get({PropertyValue, '$class'})):compareTo(PropertyValue, ExistingElementNodeTextNodeValue) =/= 0) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "At least one Property from NameSpaceRequest Package was different from Node", This, "addNewProperties");
                        false -> ok
                    end,
                    erlang:error({'Exception', "Property Modifications Should Not Occur"});
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Adding a new Property: ", NextPropertyName]), "="]), PropertyValue]), This, "addNewProperties");
                    false -> ok
                end,
                NewPropertyNode = 'ModDomHelper':createTextNode(Document, NextPropertyName, PropertyValue),
                (get({Node, '$class'})):appendChild(Node, NewPropertyNode)
            end
        end, lists:seq(0, Size - 1)),
        Node.

% throws Exception
isElementValueTextNodeEqual(This, NextPackagePropertiesHashMap, Node) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["\nComparing the value property in: ", (get({NextPackagePropertiesHashMap, '$class'})):toString(NextPackagePropertiesHashMap)]), "\nto node child leaves of node: "]), (get({Node, '$class'})):getNodeName(Node)]), This, "isElementValueTextNodeEqual");
            false -> ok
        end,
        PropertyValue = (get({NextPackagePropertiesHashMap, '$class'})):get(NextPackagePropertiesHashMap, get({'DomData', 'VALUE'})),
        ValueNode = 'DomSearchHelper':getNodeNoThrow(get({'DomData', 'VALUE'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ValueNode =/= undefined) of
            true ->
            ExistingElementNodeTextNodeValue = 'DomNodeHelper':getTextNodeValue(ValueNode),
            case ((get({PropertyValue, '$class'})):compareTo(PropertyValue, ExistingElementNodeTextNodeValue) =:= 0) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Value Node is the same", This, "isElementValueTextNodeEqual");
                    false -> ok
                end,
                throw({'$return', true});
                false -> ok
            end;
            false ->
            throw({'$return', true})
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isElementValueTextNodeUnique(This, NextPackagePropertiesHashMap, ElementNodeVector) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["\nComparing Properties of: ", (get({ElementNodeVector, '$class'})):size(ElementNodeVector)]), " Nodes"]), This, "isElementValueTextNodeUnique");
            false -> ok
        end,
        Size = (get({ElementNodeVector, '$class'})):size(ElementNodeVector),
        lists:foreach(fun(Index) ->
            ExistingElementNode = (get({ElementNodeVector, '$class'})):get(ElementNodeVector, Index),
            case (get({This, '$class'})):isElementValueTextNodeEqual(This, NextPackagePropertiesHashMap, ExistingElementNode) of
                true ->
                throw({'$return', Index});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addChildren(This, Document, RootNode, NameSpaceRequestParam) ->
        put({local, node}, RootNode),
        PackageVector = (get({NameSpaceRequestParam, '$class'})):getPackages(NameSpaceRequestParam),
        Size = (get({PackageVector, '$class'})):size(PackageVector),
        lists:foreach(fun(Index) ->
            NextPackageName = (get({PackageVector, '$class'})):get(PackageVector, Index),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73424) -> (get({Target_N73424, '$class'})):toString(Target_N73424) end)((fun(Target_N73431) -> (get({Target_N73431, '$class'})):append(Target_N73431, NextPackageName) end)((fun(Target_N73438) -> (get({Target_N73438, '$class'})):append(Target_N73438, "\nwith new PackageName: ") end)((fun(Target_N73445) -> (get({Target_N73445, '$class'})):append(Target_N73445, (get({get({local, node}), '$class'})):getNodeName(get({local, node}))) end)((fun(Target_N73452) -> (get({Target_N73452, '$class'})):append(Target_N73452, "\nTrying to Add Child to Node: ") end)('StringMaker':new()))))), This, "addChildren");
                false -> ok
            end,
            NextPackagePropertiesHashMap = (get({NameSpaceRequestParam, '$class'})):getPackageProperties(NameSpaceRequestParam, Index),
            ElementNodeVector = 'DomSearchHelper':getAllNodesNoThrow(NextPackageName, (get({get({local, node}), '$class'})):getChildNodes(get({local, node}))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["\nDocument Contains ", (get({ElementNodeVector, '$class'})):size(ElementNodeVector)]), " Node(s) With Same Name"]), This, "addChildren");
                false -> ok
            end,
            IsElementValueTextNodeUniqueIndex = (get({This, '$class'})):isElementValueTextNodeUnique(This, NextPackagePropertiesHashMap, ElementNodeVector),
            case (((((get({ElementNodeVector, '$class'})):size(ElementNodeVector) =:= 0) orelse (IsElementValueTextNodeUniqueIndex =:= (-1)))) andalso (not lists:suffix(get({'CommonSeps':getInstance(), 'BRACKET_CLOSE'}), NextPackageName))) of
                true ->
                put({local, nextNode}, (get({This, '$class'})):createPackageNode(This, Document, NextPackageName, NextPackagePropertiesHashMap)),
                (get({get({local, node}), '$class'})):appendChild(get({local, node}), get({local, nextNode})),
                put({local, node}, get({local, nextNode})),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nAppended Package: ", (get({get({local, node}), '$class'})):getNodeName(get({local, node}))]), This, "addChildren"),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nAppended Document Created: ", 'XmlDocumentHelper':toString(Document)]), This, "addChildren");
                    false -> ok
                end;
                false ->
                case lists:suffix(get({'CommonSeps':getInstance(), 'BRACKET_CLOSE'}), NextPackageName) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Package is MultiNode: just append", This, "addChildren");
                    false -> ok
                end,
                put({local, nextNode}, (get({This, '$class'})):createPackageMultiNode(This, Document, NameSpaceRequestParam, NextPackageName, NextPackagePropertiesHashMap)),
                (get({get({local, node}), '$class'})):appendChild(get({local, node}), get({local, nextNode})),
                put({local, node}, get({local, nextNode})),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nAppended Multinode Element: ", 'XmlDocumentHelper':toString(Document)]), This, "addChildren");
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Value Node already exists: Now compare (properties to leaf nodes)", This, "addChildren");
                    false -> ok
                end,
                NodeNameDuplicateNode = (get({ElementNodeVector, '$class'})):get(ElementNodeVector, IsElementValueTextNodeUniqueIndex),
                put({local, node}, (get({This, '$class'})):addNewProperties(This, Document, NodeNameDuplicateNode, NextPackagePropertiesHashMap)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "\nDuplicate Node Found: Moving to next child ^", This, "addChildre");
                    false -> ok
                end
            end
            end
        end, lists:seq(1, Size - 1)),
        Document.

% throws Exception
addNameSpace(This, Key, Value, Document) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N76067) -> (get({Target_N76067, '$class'})):toString(Target_N76067) end)((fun(Target_N76074) -> (get({Target_N76074, '$class'})):append(Target_N76074, Value) end)((fun(Target_N76081) -> (get({Target_N76081, '$class'})):append(Target_N76081, " Value: ") end)((fun(Target_N76088) -> (get({Target_N76088, '$class'})):append(Target_N76088, Key) end)((fun(Target_N76095) -> (get({Target_N76095, '$class'})):append(Target_N76095, "NameSpace key: ") end)('StringMaker':new()))))), This, "addNameSpace");
            false -> ok
        end,
        NameSpaceRequestParam = 'NameSpaceRequestParam':new(Key, Value),
        PackageVector = (get({NameSpaceRequestParam, '$class'})):getPackages(NameSpaceRequestParam),
        Size = (get({PackageVector, '$class'})):size(PackageVector),
        lists:foreach(fun(Index) ->
            PackageName = (get({PackageVector, '$class'})):get(PackageVector, Index),
            PackagePropertiesHashMap = (get({NameSpaceRequestParam, '$class'})):getPackageProperties(NameSpaceRequestParam, (get({PackageVector, '$class'})):indexOf(PackageVector, PackageName)),
            RootNode = (get({This, '$class'})):getRootNode(This, PackageName, PackagePropertiesHashMap, Document),
            case (Index < (Size - 1)) of
                true ->
                throw({'$return', (get({This, '$class'})):addChildren(This, Document, RootNode, NameSpaceRequestParam)});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Document
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
toHashMap(This) ->
        put({local, document}, 'DomDocumentHelper':create()),
        HashMap = (fun(Target_N76878) -> (get({Target_N76878, '$class'})):createHashMap(Target_N76878) end)('StdUtil':getInstance()),
        Keys = (fun(Target_N76936) -> (get({Target_N76936, '$class'})):keySet(Target_N76936) end)((get({This, '$class'})):getMap(This)),
        KeyArray = (get({Keys, '$class'})):toArray(Keys),
        KeySize = array:size(KeyArray),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["NameSpace Request Size: ", (get({Keys, '$class'})):size(Keys)]), This, "toHashMap");
            false -> ok
        end,
        lists:foreach(fun(I) ->
            Key = array:get(I, KeyArray),
            AnyType = (fun(Target_N77382) -> (get({Target_N77382, '$class'})):get(Target_N77382, Key) end)((get({This, '$class'})):getMap(This)),
            ClassName = atom_to_list(get({AnyType, '$class'})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Request Param Class: ", ClassName]), This, "toHashMap");
                false -> ok
            end,
            case allbinary_java:instance_of((fun(Target_N77721) -> (get({Target_N77721, '$class'})):get(Target_N77721, Key) end)((get({This, '$class'})):getMap(This)), 'String') of
                true ->
                Value = (fun(Target_N78402) -> (get({Target_N78402, '$class'})):get(Target_N78402, Key) end)((get({This, '$class'})):getMap(This)),
                case (allbinary_java:index_of(Key, get({'NameSpaceRequestParamData', 'NAME'})) < 0) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Not NameSpace key: ", Key]), " Value: "]), Value]), This, "toHashMap()");
                        false -> ok
                    end,
                    (get({HashMap, '$class'})):put(HashMap, allbinary_java:to_string(Key), allbinary_java:to_string(Value));
                    false ->
                    put({local, document}, (get({This, '$class'})):addNameSpace(This, allbinary_java:to_string(Key), allbinary_java:to_string(Value), get({local, document})))
                end;
                false ->
                case allbinary_java:instance_of((fun(Target_N77766) -> (get({Target_N77766, '$class'})):get(Target_N77766, Key) end)((get({This, '$class'})):getMap(This)), '') of
                true ->
                Values = (fun(Target_N77829) -> (get({Target_N77829, '$class'})):get(Target_N77829, Key) end)((get({This, '$class'})):getMap(This)),
                case (allbinary_java:index_of(Key, get({'NameSpaceRequestParamData', 'NAME'})) < 0) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Not NameSpace key: ", Key]), " Value: "]), array:get(0, Values)]), This, "toHashMap()");
                        false -> ok
                    end,
                    (get({HashMap, '$class'})):put(HashMap, allbinary_java:to_string(Key), allbinary_java:to_string(array:get(0, Values)));
                    false ->
                    put({local, document}, (get({This, '$class'})):addNameSpace(This, allbinary_java:to_string(Key), allbinary_java:to_string(array:get(0, Values)), get({local, document})))
                end;
                false -> ok
            end
            end
        end, lists:seq(0, KeySize - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["NameSpaceRequestParams: ", (fun(Target_N79206) -> (get({Target_N79206, '$class'})):toString(Target_N79206) end)((get({This, '$class'})):getMap(This))]), "\ntoHashMap(): "]), (get({HashMap, '$class'})):toString(HashMap)]), "\nDocument Created: "]), 'XmlDocumentHelper':toString(get({local, document}))]), This, "toHashMap()");
            false -> ok
        end,
        (get({HashMap, '$class'})):put(HashMap, get({'NameSpaceRequestParamData', 'DOCUMENT'}), get({local, document})),
        HashMap.

