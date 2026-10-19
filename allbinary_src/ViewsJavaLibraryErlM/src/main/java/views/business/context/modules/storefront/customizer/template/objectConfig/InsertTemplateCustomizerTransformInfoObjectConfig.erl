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
% package views.business.context.modules.storefront.customizer.template.objectConfig
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoDomNodeView
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.TransformInfosData
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('InsertTemplateCustomizerTransformInfoObjectConfig').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('NoTemplateTransformInfoObjectConfig', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'NoTemplateTransformInfoObjectConfig':init(This, TransformInfoInterface),
        init_fields(This).

new(TransformInfoInterface, Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Document),
    This.

init(This, TransformInfoInterface, Document) ->
        'NoTemplateTransformInfoObjectConfig':init(This, TransformInfoInterface, Document),
        init_fields(This),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

new(TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Name, Type),
    This.

init(This, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
        'NoTemplateTransformInfoObjectConfig':init(This, TransformInfoInterface, Name, Type),
        init_fields(This),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

% throws Exception
set(This, AParentViewName) when (is_list(AParentViewName) orelse AParentViewName =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Setting: ", AParentViewName]), This, "set()");
            false -> ok
        end,
        Document = (get({This, '$class'})):toXmlDoc(This),
        ParentComponentsNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'TransformInfosData':getInstance(), 'NAME'})),
        case ((ParentComponentsNodeList =/= undefined) andalso ((get({ParentComponentsNodeList, '$class'})):getLength(ParentComponentsNodeList) > 0)) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Replacing", This, "set()");
                false -> ok
            end,
            ComponentNode = (fun(Target_N67431) -> (get({Target_N67431, '$class'})):item(Target_N67431, 0) end)((fun(Target_N67438) -> (get({Target_N67438, '$class'})):getChildNodes(Target_N67438) end)((get({ParentComponentsNodeList, '$class'})):item(ParentComponentsNodeList, 0))),
            case (ComponentNode =/= undefined) of
                true ->
                (get({Document, '$class'})):removeChild(Document, ComponentNode);
                false -> ok
            end,
            (fun(Target_N67554) -> (get({Target_N67554, '$class'})):appendChild(Target_N67554, (fun(Target_N67586) -> (get({Target_N67586, '$class'})):toXmlNode(Target_N67586, Document) end)('TransformInfoDomNodeView':new(AParentViewName))) end)((get({ParentComponentsNodeList, '$class'})):item(ParentComponentsNodeList, 0));
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Setting", This, "set()");
                false -> ok
            end,
            ObjectConfigNode = (fun(Target_N66927) -> (get({Target_N66927, '$class'})):item(Target_N66927, 0) end)((get({Document, '$class'})):getElementsByTagName(Document, get({'TransformInfoObjectConfigData':getInstance(), 'NAME'}))),
            ParentComponentsNode = (get({Document, '$class'})):createElement(Document, get({'TransformInfosData':getInstance(), 'NAME'})),
            (get({ObjectConfigNode, '$class'})):appendChild(ObjectConfigNode, ParentComponentsNode),
            TransformInfoDomNodeView = 'TransformInfoDomNodeView':new(AParentViewName),
            (get({ParentComponentsNode, '$class'})):appendChild(ParentComponentsNode, (get({TransformInfoDomNodeView, '$class'})):toXmlNode(TransformInfoDomNodeView, Document))
        end.

