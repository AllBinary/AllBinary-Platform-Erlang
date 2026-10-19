%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% III
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.logic.visual.transform.template.customizer.includes.meta
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeData
% import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory
% import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaData
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('MetaValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, label}, undefined),
    put({This, name}, undefined),
    put({This, httpEquiv}, undefined),
    put({This, content}, undefined),
    ok.


new(HtmlMetaAttributeData, Label, AttributeValue, ContentValue) when (is_list(Label) orelse Label =:= undefined), (is_list(AttributeValue) orelse AttributeValue =:= undefined), (is_list(ContentValue) orelse ContentValue =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HtmlMetaAttributeData, Label, AttributeValue, ContentValue),
    This.

init(This, HtmlMetaAttributeData, Label, AttributeValue, ContentValue) when (is_list(Label) orelse Label =:= undefined), (is_list(AttributeValue) orelse AttributeValue =:= undefined), (is_list(ContentValue) orelse ContentValue =:= undefined) ->
    'Validation':init(This),
    init_fields(This),
        put({This, label}, Label),
        case (get({HtmlMetaAttributeData, '$class'})):equals(HtmlMetaAttributeData, get({'HtmlMetaAttributeDataFactory':getInstance(), 'HTTP_EQUIV'})) of
            true ->
            put({This, httpEquiv}, AttributeValue);
            false ->
            case (get({HtmlMetaAttributeData, '$class'})):equals(HtmlMetaAttributeData, get({'HtmlMetaAttributeDataFactory':getInstance(), 'NAME'})) of
            true ->
            put({This, name}, AttributeValue);
            false -> ok
        end
        end,
        put({This, content}, ContentValue).

new(Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Document),
    This.

init(This, Document) ->
    'Validation':init(This),
    init_fields(This),
        erlang:error({'Exception', get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'})}).

isValid(This) ->
        try
            Valid = true,
            Valid
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

toHashMap(This) ->
        HashMap = (fun(Target_N67521) -> (get({Target_N67521, '$class'})):createHashMap(Target_N67521) end)('StdUtil':getInstance()),
        HtmlMetaAttributeDataFactory = 'HtmlMetaAttributeDataFactory':getInstance(),
        (get({HashMap, '$class'})):put(HashMap, (fun(Target_N67624) -> (get({Target_N67624, '$class'})):toString(Target_N67624) end)(get({'HtmlMetaData':getInstance(), 'LABEL'})), get({This, label})),
        (get({HashMap, '$class'})):put(HashMap, (get({get({HtmlMetaAttributeDataFactory, 'NAME'}), '$class'})):toString(get({HtmlMetaAttributeDataFactory, 'NAME'})), get({This, name})),
        (get({HashMap, '$class'})):put(HashMap, (get({get({HtmlMetaAttributeDataFactory, 'HTTP_EQUIV'}), '$class'})):toString(get({HtmlMetaAttributeDataFactory, 'HTTP_EQUIV'})), get({This, httpEquiv})),
        (get({HashMap, '$class'})):put(HashMap, (get({get({HtmlMetaAttributeDataFactory, 'CONTENT'}), '$class'})):toString(get({HtmlMetaAttributeDataFactory, 'CONTENT'})), get({This, content})),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createNameValueNodes(Document, (fun(Target_N67922) -> (get({Target_N67922, '$class'})):toString(Target_N67922) end)(get({'HtmlMetaData':getInstance(), 'NAME'})), (get({This, '$class'})):toHashMap(This)),
        Node.

