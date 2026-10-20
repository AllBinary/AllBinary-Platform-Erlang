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
% package views.compound.objectConfig
% import java.io.ByteArrayInputStream
% import java.io.InputStream
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.document.DocumentToNode
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.TransformFactory
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.info.RootTransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoDomNode
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document

-module('CompoundContextTransformInfoObjectConfig').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GenericStoreTransformInfoObjectConfig', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(AbeClientInformation, TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, TransformInfoInterface),
    This.

'$init'(This, AbeClientInformation, TransformInfoInterface) ->
        'GenericStoreTransformInfoObjectConfig':'$init'(This, AbeClientInformation, TransformInfoInterface),
        init_fields(This).

new(AbeClientInformation, TransformInfoInterface, Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, TransformInfoInterface, Document),
    This.

'$init'(This, AbeClientInformation, TransformInfoInterface, Document) ->
        'GenericStoreTransformInfoObjectConfig':'$init'(This, AbeClientInformation, TransformInfoInterface, Document),
        init_fields(This),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

new(AbeClientInformation, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, TransformInfoInterface, Name, Type),
    This.

'$init'(This, AbeClientInformation, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
        'GenericStoreTransformInfoObjectConfig':'$init'(This, AbeClientInformation, TransformInfoInterface, Name, Type),
        init_fields(This),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

% throws Exception
get(This) ->
        StoreName = (fun(Target_N66792) -> (get({Target_N66792, '$class'})):getStoreName(Target_N66792) end)((get({This, '$class'})):getTransformInfoInterface(This)),
        HttpTransformInfoInterface = (get({This, '$class'})):getTransformInfoInterface(This),
        TemplateNameOverride = (fun(Target_N66892) -> (get({Target_N66892, '$class'})):getNonNull(Target_N66892, (fun(Target_N66920) -> (get({Target_N66920, '$class'})):get(Target_N66920, get({'TransformInfoData':getInstance(), 'PARTIAL'})) end)((get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface))) end)('StringUtil':getInstance()),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, StoreName),
        (get({StringBuffer, '$class'})):append(StringBuffer, TemplateNameOverride),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'RootTransformInfoData', 'NAME'})),
        RootComponentInterface = (fun(Target_N67196) -> (get({Target_N67196, '$class'})):getInstance(Target_N67196, get({This, abeClientInformation}), (get({StringBuffer, '$class'})):toString(StringBuffer), (get({This, '$class'})):getTransformInfoInterface(This)) end)('TransformFactory':getInstance()),
        ViewVector = (get({This, '$class'})):getTransformDomNodes(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Root View Called with: ", (get({ViewVector, '$class'})):size(ViewVector)]), This, "get(transformInfoInterface)");
            false -> ok
        end,
        put({local, rootView}, (get({RootComponentInterface, '$class'})):view(RootComponentInterface)),
        StartXMLHeader = "<xsl:text disable-output-escaping=\"yes\" ><![CDATA[",
        EndXMLHeader = "]]></xsl:text>",
        Size = (get({ViewVector, '$class'})):size(ViewVector),
        lists:foreach(fun(Index) ->
            ObjectConfigTransformInfoDomNode = (get({ViewVector, '$class'})):get(ViewVector, Index),
            TemplateKey = (get({ObjectConfigTransformInfoDomNode, '$class'})):getReplaceKey(ObjectConfigTransformInfoDomNode),
            ComponentInterface = (fun(Target_N67845) -> (get({Target_N67845, '$class'})):getInstance(Target_N67845, get({This, abeClientInformation}), (fun(Target_N67878) -> (get({Target_N67878, '$class'})):getName(Target_N67878) end)((get({ObjectConfigTransformInfoDomNode, '$class'})):getTransformInfoInterface(ObjectConfigTransformInfoDomNode)), (get({This, '$class'})):getTransformInfoInterface(This)) end)('TransformFactory':getInstance()),
            put({local, replacementViewString}, (get({ComponentInterface, '$class'})):view(ComponentInterface)),
            put({local, replacementViewString}, 'DocumentToNode':convertDocumentToNodeString(get({local, replacementViewString}))),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, StartXMLHeader),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({local, replacementViewString})),
            (get({StringBuffer, '$class'})):append(StringBuffer, EndXMLHeader),
            TemplateValue = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Replacing: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, TemplateKey),
                (get({StringBuffer, '$class'})):append(StringBuffer, " with "),
                (get({StringBuffer, '$class'})):append(StringBuffer, TemplateValue),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "get()");
                false -> ok
            end,
            Replace = 'Replace':new(TemplateKey, TemplateValue),
            put({local, rootView}, (get({Replace, '$class'})):all(Replace, get({local, rootView})))
        end, lists:seq(0, Size - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["End: Result of a compound view: ", get({local, rootView})]), This, "get()");
            false -> ok
        end,
        get({local, rootView}).

% throws Exception
createInputStream(This) ->
        CompleteTemplateViewBytes = (fun(Target_N69039) -> (get({Target_N69039, '$class'})):getBytes(Target_N69039) end)((get({This, '$class'})):get(This)),
        Bais = 'ByteArrayInputStream':new(CompleteTemplateViewBytes),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Template: ", (fun(Target_N69327) -> (get({Target_N69327, '$class'})):toString(Target_N69327) end)(allbinary_java:to_string(CompleteTemplateViewBytes))]), This, "createInputStream()");
            false -> ok
        end,
        Bais.

