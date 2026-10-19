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
% package org.allbinary.logic.visual.transform.info.objectConfig
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.InputOutputTypeData
% import org.allbinary.logic.io.OutputTypeData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoDomNode
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.TransformInfosData
% import org.allbinary.logic.visual.transform.template.XslData
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Attr
% import org.w3c.dom.Document
% import org.w3c.dom.NamedNodeMap
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('TransformInfoObjectConfig').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInfoObjectConfigInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, ownerTransformInfoInterface}, undefined),
    put({This, document}, undefined),
    put({This, outputTypeName}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
    init_fields(This),
        put({This, ownerTransformInfoInterface}, TransformInfoInterface),
        (get({This, '$class'})):createDocument(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "TransformInfo: "),
            case (get({This, ownerTransformInfoInterface}) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, ownerTransformInfoInterface}), '$class'})):getName(get({This, ownerTransformInfoInterface})));
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "No Owner!?#@")
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nConstructed with document: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):toString(This)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "Constructor(TransformInfoInterface)");
            false -> ok
        end.

new(TransformInfoInterface, Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Document),
    This.

init(This, TransformInfoInterface, Document) ->
    init_fields(This),
        put({This, ownerTransformInfoInterface}, TransformInfoInterface),
        put({This, document}, Document),
        Node = 'DomSearchHelper':getNodeNoThrow(get({'OutputTypeData':getInstance(), 'NAME'}), (fun(Target_N67154) -> (get({Target_N67154, '$class'})):getChildNodes(Target_N67154) end)((get({This, '$class'})):getRootNode(This))),
        case (Node =/= undefined) of
            true ->
            (get({This, '$class'})):setOutputTypeName(This, 'DomNodeHelper':getTextNodeValue(Node));
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "TransformInfo: "),
            case (get({This, ownerTransformInfoInterface}) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, ownerTransformInfoInterface}), '$class'})):getName(get({This, ownerTransformInfoInterface})));
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "No Owner!?#@")
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nConstructed with document: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):toString(This)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "Constructor(TransformInfoInterface, Document)");
            false -> ok
        end.

new(TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Name, Type),
    This.

init(This, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    init_fields(This),
        put({This, ownerTransformInfoInterface}, TransformInfoInterface),
        (get({This, '$class'})):createDocument(This),
        ConfigNameAttr = (get({get({This, document}), '$class'})):createAttribute(get({This, document}), get({'TransformInfoObjectConfigData':getInstance(), 'NAME'})),
        (get({ConfigNameAttr, '$class'})):setValue(ConfigNameAttr, Name),
        ObjectConfigNode = (fun(Target_N67947) -> (get({Target_N67947, '$class'})):item(Target_N67947, 0) end)((get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TransformInfoObjectConfigData':getInstance(), 'NAME'}))),
        (get({ObjectConfigNode, '$class'})):appendChild(ObjectConfigNode, ConfigNameAttr),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "TransformInfo: "),
            case (get({This, ownerTransformInfoInterface}) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, ownerTransformInfoInterface}), '$class'})):getName(get({This, ownerTransformInfoInterface})));
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "No Owner!?#@")
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nConstructed with document: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):toString(This)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "Constructor(TransformInfoInterface, name, type)");
            false -> ok
        end.

createDocument(This) ->
        put({This, document}, 'DomDocumentHelper':create()),
        ObjectConfigNode = (get({get({This, document}), '$class'})):createElement(get({This, document}), get({'TransformInfoObjectConfigData':getInstance(), 'NAME'})),
        (get({get({This, document}), '$class'})):appendChild(get({This, document}), ObjectConfigNode).

getTransformInfoInterface(This) ->
        get({This, ownerTransformInfoInterface}).

% throws Exception
toXmlDoc(This) ->
        get({This, document}).

setDocument(This, Document) ->
        put({This, document}, Document).

containsView(This, TransformInfoInterface) ->
        try
        ObjectConfigNode = (fun(Target_N68951) -> (get({Target_N68951, '$class'})):item(Target_N68951, 0) end)((get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TransformInfoObjectConfigData':getInstance(), 'NAME'}))),
        ViewNodeList = (get({ObjectConfigNode, '$class'})):getChildNodes(ObjectConfigNode),
        NumberOfViews = (get({ViewNodeList, '$class'})):getLength(ViewNodeList),
        lists:foreach(fun(Index) ->
            ViewNode = (get({ViewNodeList, '$class'})):item(ViewNodeList, Index),
            ViewAttributes = (get({ViewNode, '$class'})):getAttributes(ViewNode),
            AttrNode = (get({ViewAttributes, '$class'})):getNamedItem(ViewAttributes, get({'TransformInfoData':getInstance(), 'NAME'})),
            case ((fun(Target_N69304) -> (get({Target_N69304, '$class'})):compareTo(Target_N69304, (get({AttrNode, '$class'})):getValue(AttrNode)) end)((get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, NumberOfViews - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getTemplateAttributes(This) ->
        ComponentNode = (fun(Target_N69503) -> (get({Target_N69503, '$class'})):item(Target_N69503, 0) end)((get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TransformInfoObjectConfigData':getInstance(), 'NAME'}))),
        (get({ComponentNode, '$class'})):getAttributes(ComponentNode).

% throws Exception
getName(This) ->
        AttrNode = (fun(Target_N69655) -> (get({Target_N69655, '$class'})):getNamedItem(Target_N69655, get({'TransformInfoObjectConfigData':getInstance(), 'NAME'})) end)((get({This, '$class'})):getTemplateAttributes(This)),
        (get({AttrNode, '$class'})):getValue(AttrNode).

% throws Exception
setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        AttrNode = (fun(Target_N69801) -> (get({Target_N69801, '$class'})):getNamedItem(Target_N69801, get({'TransformInfoObjectConfigData':getInstance(), 'NAME'})) end)((get({This, '$class'})):getTemplateAttributes(This)),
        (get({AttrNode, '$class'})):setValue(AttrNode, Name).

% throws Exception
getNodeVector(This, NodeName) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        try
        ComponentsNodeList = (get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), NodeName),
        case ((ComponentsNodeList =/= undefined) andalso ((get({ComponentsNodeList, '$class'})):getLength(ComponentsNodeList) > 0)) of
            true ->
            ViewNodeVector = 'DomSearchHelper':getAllNodes(get({'TransformInfoData':getInstance(), 'NAME'}), (fun(Target_N70122) -> (get({Target_N70122, '$class'})):getChildNodes(Target_N70122) end)((get({ComponentsNodeList, '$class'})):item(ComponentsNodeList, 0))),
            NumberOfViews = (get({ViewNodeVector, '$class'})):size(ViewNodeVector),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Number Of "),
                (get({StringBuffer, '$class'})):append(StringBuffer, NodeName),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Nodes: "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, NumberOfViews),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "getNodeVector(nodename)");
                false -> ok
            end,
            throw({'$return', ViewNodeVector});
            false -> ok
        end,
        'BasicArrayListD':new()
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getTransformDomNodes(This, NodeName) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        ViewVector = 'BasicArrayListD':new(),
        ViewNodeVector = (get({This, '$class'})):getNodeVector(This, NodeName),
        Size = (get({ViewNodeVector, '$class'})):size(ViewNodeVector),
        lists:foreach(fun(Index) ->
            ViewNode = (get({ViewNodeVector, '$class'})):get(ViewNodeVector, Index),
            (get({ViewVector, '$class'})):add(ViewVector, 'TransformInfoDomNode':new(ViewNode))
        end, lists:seq(0, Size - 1)),
        ViewVector.

% throws Exception
getTransforms(This, NodeName) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        ViewVector = 'BasicArrayListD':new(),
        ViewNodeVector = (get({This, '$class'})):getNodeVector(This, NodeName),
        Size = (get({ViewNodeVector, '$class'})):size(ViewNodeVector),
        lists:foreach(fun(Index) ->
            ViewNode = (get({ViewNodeVector, '$class'})):get(ViewNodeVector, Index),
            (get({ViewVector, '$class'})):add(ViewVector, (fun(Target_N71305) -> (get({Target_N71305, '$class'})):getTransformInfoInterface(Target_N71305) end)('TransformInfoDomNode':new(ViewNode)))
        end, lists:seq(0, Size - 1)),
        ViewVector.

% throws Exception
getTransformsGroup(This, Group) when (is_list(Group) orelse Group =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Started: ", Group]), This, "getTransformsGroup()");
            false -> ok
        end,
        ViewVector = 'BasicArrayListD':new(),
        GROUP = get({'TransformInfosData':getInstance(), 'GROUP'}),
        ComponentsNodeList = (get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), GROUP),
        case ((ComponentsNodeList =/= undefined) andalso ((get({ComponentsNodeList, '$class'})):getLength(ComponentsNodeList) > 0)) of
            true ->
            put({local, componentsNode}, (get({ComponentsNodeList, '$class'})):item(ComponentsNodeList, 0)),
            Length = (get({ComponentsNodeList, '$class'})):getLength(ComponentsNodeList),
            lists:foreach(fun(Index) ->
                Node = (get({ComponentsNodeList, '$class'})):item(ComponentsNodeList, Index),
                Attributes = (get({Node, '$class'})):getAttributes(Node),
                AttrNode = (get({Attributes, '$class'})):getNamedItem(Attributes, GROUP),
                Value = (get({AttrNode, '$class'})):getValue(AttrNode),
                case ((get({Value, '$class'})):compareTo(Value, Group) =:= 0) of
                    true ->
                    put({local, componentsNode}, Node),
                    throw('$break');
                    false -> ok
                end
            end, lists:seq(0, Length - 1)),
            ViewNodeVector = 'DomSearchHelper':getAllNodes(get({'TransformInfoData':getInstance(), 'NAME'}), (get({get({local, componentsNode}), '$class'})):getChildNodes(get({local, componentsNode}))),
            NumberOfViews = (get({ViewNodeVector, '$class'})):size(ViewNodeVector),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Nodes: ", NumberOfViews]), This, "getTransformsGroup()");
                false -> ok
            end,
            Size = (get({ViewNodeVector, '$class'})):size(ViewNodeVector),
            lists:foreach(fun(Index) ->
                ViewNode = (get({ViewNodeVector, '$class'})):get(ViewNodeVector, Index),
                (get({ViewVector, '$class'})):add(ViewVector, 'TransformInfoDomNode':new(ViewNode))
            end, lists:seq(0, Size - 1));
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                case (ComponentsNodeList =:= undefined) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Number Of Nodes: NULL", This, "getTransformsGroup()");
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Number Of Nodes: 0", This, "getTransformsGroup()")
                end;
                false -> ok
            end
        end,
        ViewVector.

% throws Exception
getTransformDomNodes(This) ->
        (get({This, '$class'})):getTransformDomNodes(This, get({'TransformInfosData':getInstance(), 'GROUP'})).

% throws Exception
getTransforms(This) ->
        (get({This, '$class'})):getTransforms(This, get({'TransformInfosData':getInstance(), 'NAME'})).

% throws Exception
getGroupTransforms(This) ->
        (get({This, '$class'})):getTransforms(This, get({'TransformInfosData':getInstance(), 'GROUP'})).

% throws Exception
getParentTransforms(This) ->
        (get({This, '$class'})):getTransforms(This, get({'TransformInfoData':getInstance(), 'PARENT'})).

getRootNode(This) ->
        (fun(Target_N73635) -> (get({Target_N73635, '$class'})):item(Target_N73635, 0) end)((get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TransformInfoObjectConfigData':getInstance(), 'NAME'}))).

setOutputTypeName(This, OutputTypeName) when (is_list(OutputTypeName) orelse OutputTypeName =:= undefined) ->
        put({This, outputTypeName}, OutputTypeName).

% throws Exception
getOutputTypeName(This) ->
        get({This, outputTypeName}).

% throws Exception
getInputOutputTypeName(This) ->
        Node = 'DomSearchHelper':getNode(get({'InputOutputTypeData':getInstance(), 'NAME'}), (fun(Target_N73908) -> (get({Target_N73908, '$class'})):getChildNodes(Target_N73908) end)((get({This, '$class'})):getRootNode(This))),
        'DomNodeHelper':getTextNodeValue(Node).

% throws Exception
getInputOutputTypeFile(This) ->
        Node = 'DomSearchHelper':getNode(get({'InputOutputTypeData':getInstance(), 'FILE'}), (fun(Target_N74069) -> (get({Target_N74069, '$class'})):getChildNodes(Target_N74069) end)((get({This, '$class'})):getRootNode(This))),
        'DomNodeHelper':getTextNodeValue(Node).

% throws Exception
getImportUriPath(This) ->
        Node = 'DomSearchHelper':getNode(get({'XslData':getInstance(), 'ROOT_IMPORT_URI'}), (fun(Target_N74230) -> (get({Target_N74230, '$class'})):getChildNodes(Target_N74230) end)((get({This, '$class'})):getRootNode(This))),
        'DomNodeHelper':getTextNodeValue(Node).

toString(This) ->
        try
        try
            case (get({This, document}) =/= undefined) of
                true ->
                throw({'$return', 'XmlDocumentHelper':toString(get({This, document}))});
                false ->
                throw({'$return', undefined})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "DOM Document error", This, get({get({This, commonStrings}), 'TOSTRING'}));
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

