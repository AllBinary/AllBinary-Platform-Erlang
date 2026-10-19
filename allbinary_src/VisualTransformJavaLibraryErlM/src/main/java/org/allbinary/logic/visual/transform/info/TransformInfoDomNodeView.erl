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
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.w3c.dom.Attr
% import org.w3c.dom.Document
% import org.w3c.dom.NamedNodeMap
% import org.w3c.dom.Node

-module('TransformInfoDomNodeView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoDomNode', Function, Arguments).

init_fields(This) ->
    ok.


new(Name, MappedName) when (is_list(Name) orelse Name =:= undefined), (is_list(MappedName) orelse MappedName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, MappedName),
    This;
new(TransformInfoInterface, Mapping) when (is_list(Mapping) orelse Mapping =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Mapping),
    This.

init(This, Name, MappedName) when (is_list(Name) orelse Name =:= undefined), (is_list(MappedName) orelse MappedName =:= undefined) ->
        'TransformInfoDomNode':init(This, Name, MappedName);
init(This, TransformInfoInterface, Mapping) when (is_list(Mapping) orelse Mapping =:= undefined) ->
        'TransformInfoDomNode':init(This, TransformInfoInterface, Mapping).

new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This;
new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'TransformInfoDomNode':init(This, Name, undefined);
init(This, TransformInfoInterface) ->
        'TransformInfoDomNode':init(This, TransformInfoInterface).



% throws Exception
toXmlNode(This, Document) ->
        TransformInfoData = 'TransformInfoData':getInstance(),
        SubViewNode = (get({Document, '$class'})):createElement(Document, get({TransformInfoData, 'NAME'})),
        ViewNameAttr = (get({Document, '$class'})):createAttribute(Document, get({TransformInfoData, 'NAME'})),
        (get({ViewNameAttr, '$class'})):setValue(ViewNameAttr, (fun(Target_N66252) -> (get({Target_N66252, '$class'})):getName(Target_N66252) end)((get({This, '$class'})):getTransformInfoInterface(This))),
        ComponentNodeAttributes = (get({SubViewNode, '$class'})):getAttributes(SubViewNode),
        (get({ComponentNodeAttributes, '$class'})):setNamedItem(ComponentNodeAttributes, ViewNameAttr),
        case ((get({This, '$class'})):getMappedName(This) =/= undefined) of
            true ->
            MappedNameAttr = (get({Document, '$class'})):createAttribute(Document, get({TransformInfoData, 'MAPPED'})),
            (get({MappedNameAttr, '$class'})):setValue(MappedNameAttr, (get({This, '$class'})):getMappedName(This)),
            (get({ComponentNodeAttributes, '$class'})):setNamedItem(ComponentNodeAttributes, MappedNameAttr);
            false -> ok
        end,
        SubViewNode.

