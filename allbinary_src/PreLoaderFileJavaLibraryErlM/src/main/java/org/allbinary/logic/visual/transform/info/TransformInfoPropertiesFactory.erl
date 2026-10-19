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
% import org.allbinary.string.CommonLabels
% import org.w3c.dom.Attr
% import org.w3c.dom.NamedNodeMap
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('TransformInfoPropertiesFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformInfoPropertiesFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'TransformInfoPropertiesFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, Node) ->
        TransformInfoChildNodeList = (get({Node, '$class'})):getChildNodes(Node),
        TransformInfoData = 'TransformInfoData':getInstance(),
        Attributes = (get({Node, '$class'})):getAttributes(Node),
        AttrNode = (get({Attributes, '$class'})):getNamedItem(Attributes, get({TransformInfoData, 'NAME'})),
        Name = (get({AttrNode, '$class'})):getValue(AttrNode),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([get({'CommonLabels':getInstance(), 'NEXT'}), " View Name: "]), Name]), This, "toTransformInfoPropertiesHashMap()");
            false -> ok
        end,
        LabelNode = 'DomSearchHelper':getNodeNoThrow(get({TransformInfoData, 'LABEL'}), TransformInfoChildNodeList),
        put({local, label}, 'DomNodeHelper':getTextNodesValue(LabelNode)),
        case (get({local, label}) =:= undefined) of
            true ->
            put({local, label}, Name);
            false -> ok
        end,
        DescriptionNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'DESCRIPTION'}), TransformInfoChildNodeList),
        Description = 'DomNodeHelper':getTextNodesValue(DescriptionNode),
        ObjectFileNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'OBJECTFILENAME'}), TransformInfoChildNodeList),
        ObjectFileName = 'DomNodeHelper':getTextNodeValue(ObjectFileNode),
        ObjectConfigFileNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'OBJECTCONFIGFILENAME'}), TransformInfoChildNodeList),
        ObjectConfigFileName = 'DomNodeHelper':getTextNodeValue(ObjectConfigFileNode),
        TemplateFileNode = 'DomSearchHelper':getNode(get({TransformInfoData, 'TEMPLATEFILENAME'}), TransformInfoChildNodeList),
        TemplateFileName = 'DomNodeHelper':getTextNodeValue(TemplateFileNode),
        TransformInfoProperties = 'TransformInfoProperties':new(Name, get({local, label}), Description, ObjectFileName, ObjectConfigFileName, TemplateFileName),
        TransformInfoProperties.

