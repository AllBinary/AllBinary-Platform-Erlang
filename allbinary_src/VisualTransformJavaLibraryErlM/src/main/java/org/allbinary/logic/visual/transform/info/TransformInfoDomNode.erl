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
% package org.allbinary.logic.visual.transform.info
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.w3c.dom.Attr
% import org.w3c.dom.NamedNodeMap
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('TransformInfoDomNode').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, transformInfoInterface}, undefined),
    put({This, mappedName}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, Node) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Constructing TransformInfo From TransformInfoDomNode: ", (get({Node, '$class'})):getNodeName(Node)]), This, "TransformInfoDomNode(Node node)");
            false -> ok
        end,
        TransformInfoData = 'TransformInfoData':getInstance(),
        Attributes = (get({Node, '$class'})):getAttributes(Node),
        AttrNode = (get({Attributes, '$class'})):getNamedItem(Attributes, get({TransformInfoData, 'NAME'})),
        Name = (get({AttrNode, '$class'})):getValue(AttrNode),
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        case ((get({NodeList, '$class'})):getLength(NodeList) > 1) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Constructing Complete TransformInfo Node For: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Name),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " with "),
                (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc((get({NodeList, '$class'})):getLength(NodeList))),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " children"),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "TransformInfoObjectConfigComponent(Node node)");
                false -> ok
            end,
            ObjectFileNameNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'OBJECTFILENAME'}), NodeList),
            ObjectFileName = 'DomNodeHelper':getTextNodeValue(ObjectFileNameNode),
            ObjectConfigFileNameNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'OBJECTCONFIGFILENAME'}), NodeList),
            ObjectConfigFileName = 'DomNodeHelper':getTextNodeValue(ObjectConfigFileNameNode),
            TemplateFileNameNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'TEMPLATEFILENAME'}), NodeList),
            TemplateFileName = 'DomNodeHelper':getTextNodeValue(TemplateFileNameNode),
            DataFileNameNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'DATAFILENAME'}), NodeList),
            DataFileName = 'DomNodeHelper':getTextNodeValue(DataFileNameNode),
            put({This, transformInfoInterface}, 'TransformInfo':new(Name, ObjectFileName, ObjectConfigFileName, TemplateFileName, DataFileName));
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Constructing Partial TransformInfo Node For: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Name),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " with "),
                (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc((get({NodeList, '$class'})):getLength(NodeList))),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " children"),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "TransformInfoObjectConfigComponent(Node node)");
                false -> ok
            end,
            put({This, transformInfoInterface}, 'TransformInfo':new(Name))
        end,
        TemplateAttrNode = (get({Attributes, '$class'})):getNamedItem(Attributes, get({TransformInfoData, 'MAPPED'})),
        case (TemplateAttrNode =/= undefined) of
            true ->
            put({This, mappedName}, (get({TemplateAttrNode, '$class'})):getValue(TemplateAttrNode));
            false ->
            put({This, mappedName}, (fun(Target_N68051) -> (get({Target_N68051, '$class'})):getName(Target_N68051) end)((get({This, '$class'})):getTransformInfoInterface(This)))
        end;
init(This, TransformInfoInterface) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, mappedName}, (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)).


new(Name, MappedName) when (is_list(Name) orelse Name =:= undefined), (is_list(MappedName) orelse MappedName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, MappedName),
    This;
new(TransformInfoInterface, MappedName) when (is_list(MappedName) orelse MappedName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, MappedName),
    This.

init(This, Name, MappedName) when (is_list(Name) orelse Name =:= undefined), (is_list(MappedName) orelse MappedName =:= undefined) ->
    init_fields(This),
        put({This, transformInfoInterface}, 'TransformInfo':new(Name)),
        put({This, mappedName}, MappedName);
init(This, TransformInfoInterface, MappedName) when (is_list(MappedName) orelse MappedName =:= undefined) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, mappedName}, MappedName).


getTransformInfoInterface(This) ->
        get({This, transformInfoInterface}).

getMappedName(This) ->
        get({This, mappedName}).

getReplaceKey(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "<transform:component name=\""),
        (get({StringBuffer, '$class'})):append(StringBuffer, "body"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\"/>"),
        Key = (get({StringBuffer, '$class'})):toString(StringBuffer),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Component Key: ", Key]), This, "getReplaceKey()");
            false -> ok
        end,
        Key.

