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
% import java.util.HashMap
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.RootTransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoHttp
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.template.TransformTemplateFactory
% import org.allbinary.logic.visual.transform.template.TransformTemplateInterface
% import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document

-module('GenericStoreTransformInfoObjectConfig').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoObjectConfig', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, undefined),
    ok.


new(AbeClientInformation, TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, TransformInfoInterface),
    This.

init(This, AbeClientInformation, TransformInfoInterface) ->
        'TransformInfoObjectConfig':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation).

new(AbeClientInformation, TransformInfoInterface, Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, TransformInfoInterface, Document),
    This.

init(This, AbeClientInformation, TransformInfoInterface, Document) ->
        'TransformInfoObjectConfig':init(This, TransformInfoInterface, Document),
        init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

new(AbeClientInformation, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, TransformInfoInterface, Name, Type),
    This.

init(This, AbeClientInformation, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
        'TransformInfoObjectConfig':init(This, TransformInfoInterface, Name, Type),
        init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

% throws Exception
generate(This, ObjectConfigDocument) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "TransformInfo: "),
            case ((get({This, '$class'})):getTransformInfoInterface(This) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N67260) -> (get({Target_N67260, '$class'})):getName(Target_N67260) end)((get({This, '$class'})):getTransformInfoInterface(This)));
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "No Owner!?#@")
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "generate()");
            false -> ok
        end,
        TransformInfoHttpStoreInterface = (get({This, '$class'})):getTransformInfoInterface(This),
        ObjectConfigDocumentString = 'XmlDocumentHelper':toString(ObjectConfigDocument),
        ReplaceHashMap = (get({This, '$class'})):createReplaceHashMap(This, TransformInfoHttpStoreInterface, ObjectConfigDocumentString),
        (get({This, '$class'})):generate(This, ObjectConfigDocumentString, ReplaceHashMap).

% throws Exception
createReplaceHashMap(This, TransformInfoHttpStoreInterface, ObjectConfigDocumentString) when (is_list(ObjectConfigDocumentString) orelse ObjectConfigDocumentString =:= undefined) ->
        StoreName = (get({TransformInfoHttpStoreInterface, '$class'})):getStoreName(TransformInfoHttpStoreInterface),
        HashMap = (get({This, '$class'})):createHashMap(This, TransformInfoHttpStoreInterface, ObjectConfigDocumentString),
        TransformInfoObjectConfigData = 'TransformInfoObjectConfigData':getInstance(),
        (get({HashMap, '$class'})):put(HashMap, (get({TransformInfoObjectConfigData, 'VARKEY'}) + get({'StoreFrontData':getInstance(), 'NAME'})), StoreName),
        PageName = (fun(Target_N67892) -> (get({Target_N67892, '$class'})):getPageNameHack(Target_N67892, (fun(Target_N67917) -> (get({Target_N67917, '$class'})):getName(Target_N67917) end)((get({This, '$class'})):getTransformInfoInterface(This)), StoreName) end)('TransformTemplateCustomizerUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, (get({TransformInfoObjectConfigData, 'VARKEY'}) + get({'TransformInfoData':getInstance(), 'PARTIAL'})), PageName),
        HashMap.

% throws Exception
createHashMap(This, TransformInfoHttpStoreInterface, ObjectConfigDocumentString) when (is_list(ObjectConfigDocumentString) orelse ObjectConfigDocumentString =:= undefined) ->
        HashMap = (fun(Target_N68157) -> (get({Target_N68157, '$class'})):createHashMap(Target_N68157) end)('StdUtil':getInstance()),
        StoreName = (get({TransformInfoHttpStoreInterface, '$class'})):getStoreName(TransformInfoHttpStoreInterface),
        PropertiesHashMap = (get({TransformInfoHttpStoreInterface, '$class'})):getPropertiesHashMap(TransformInfoHttpStoreInterface),
        TemplateNameOverride = (fun(Target_N68298) -> (get({Target_N68298, '$class'})):getNonNull(Target_N68298, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'TransformInfoData':getInstance(), 'PARTIAL'}))) end)('StringUtil':getInstance()),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TemplateNameOverride: ", TemplateNameOverride]), This, "generate()");
            false -> ok
        end,
        TemplateNameStringBuffer = 'StringMaker':new(),
        (get({TemplateNameStringBuffer, '$class'})):append(TemplateNameStringBuffer, StoreName),
        (get({TemplateNameStringBuffer, '$class'})):append(TemplateNameStringBuffer, TemplateNameOverride),
        (get({TemplateNameStringBuffer, '$class'})):append(TemplateNameStringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({TemplateNameStringBuffer, '$class'})):append(TemplateNameStringBuffer, get({'RootTransformInfoData', 'NAME'})),
        TemplateNameKey = (get({'TransformInfoObjectConfigData':getInstance(), 'VARKEY'}) + get({'TransformInfoData':getInstance(), 'OWNER'})),
        case (allbinary_java:index_of(ObjectConfigDocumentString, TemplateNameKey) =/= (-1)) of
            true ->
            TemplateInterface = (fun(Target_N68947) -> (get({Target_N68947, '$class'})):getInstance(Target_N68947, get({This, abeClientInformation}), (get({TemplateNameStringBuffer, '$class'})):toString(TemplateNameStringBuffer), (get({TransformInfoHttpStoreInterface, '$class'})):getPropertiesHashMap(TransformInfoHttpStoreInterface), (get({TransformInfoHttpStoreInterface, '$class'})):getPageContext(TransformInfoHttpStoreInterface)) end)('TransformTemplateFactory':getInstance()),
            SelectedTemplate = (get({TemplateInterface, '$class'})):getName(TemplateInterface),
            (get({HashMap, '$class'})):put(HashMap, TemplateNameKey, SelectedTemplate);
            false -> ok
        end,
        HashMap.

% throws Exception
generate(This, ObjectConfigDocumentString, HashMap) when (is_list(ObjectConfigDocumentString) orelse ObjectConfigDocumentString =:= undefined) ->
        Replace = 'Replace':new(HashMap),
        NewObjectConfigDocument = 'DomDocumentHelper':create((get({Replace, '$class'})):all(Replace, ObjectConfigDocumentString)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Final ObjectConfig: ", 'XmlDocumentHelper':toString(NewObjectConfigDocument)]), This, "generate()");
            false -> ok
        end,
        NewObjectConfigDocument.

