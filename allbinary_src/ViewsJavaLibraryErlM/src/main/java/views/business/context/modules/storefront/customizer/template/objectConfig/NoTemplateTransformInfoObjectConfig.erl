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
% import java.util.HashMap
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData
% import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil
% import org.w3c.dom.Document

-module('NoTemplateTransformInfoObjectConfig').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoObjectConfig', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'TransformInfoObjectConfig':init(This, TransformInfoInterface),
        init_fields(This).

new(TransformInfoInterface, Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Document),
    This.

init(This, TransformInfoInterface, Document) ->
        'TransformInfoObjectConfig':init(This, TransformInfoInterface, Document),
        init_fields(This),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

new(TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Name, Type),
    This.

init(This, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
        'TransformInfoObjectConfig':init(This, TransformInfoInterface, Name, Type),
        init_fields(This),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

% throws Exception
generate(This, ObjectConfigDocument) ->
        DocString = 'XmlDocumentHelper':toString(ObjectConfigDocument),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Initial ObjectConfig: ", DocString]), This, "generate()");
            false -> ok
        end,
        StoreName = (fun(Target_N66809) -> (get({Target_N66809, '$class'})):getStoreName(Target_N66809) end)((get({This, '$class'})):getTransformInfoInterface(This)),
        ViewName = (fun(Target_N66855) -> (get({Target_N66855, '$class'})):getName(Target_N66855) end)((get({This, '$class'})):getTransformInfoInterface(This)),
        HashMap = (fun(Target_N66901) -> (get({Target_N66901, '$class'})):createHashMap(Target_N66901) end)('StdUtil':getInstance()),
        VARKEY = get({'TransformInfoObjectConfigData':getInstance(), 'VARKEY'}),
        (get({HashMap, '$class'})):put(HashMap, lists:concat([VARKEY, get({'StoreFrontData':getInstance(), 'NAME'})]), StoreName),
        (get({HashMap, '$class'})):put(HashMap, lists:concat([VARKEY, get({'TransformInfoData':getInstance(), 'OWNER'})]), ViewName),
        PageName = (fun(Target_N67146) -> (get({Target_N67146, '$class'})):getPageNameHack(Target_N67146, (fun(Target_N67171) -> (get({Target_N67171, '$class'})):getName(Target_N67171) end)((get({This, '$class'})):getTransformInfoInterface(This)), (fun(Target_N67190) -> (get({Target_N67190, '$class'})):getStoreName(Target_N67190) end)((get({This, '$class'})):getTransformInfoInterface(This))) end)('TransformTemplateCustomizerUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, lists:concat([VARKEY, get({'TransformInfoData':getInstance(), 'PARTIAL'})]), PageName),
        Replace = 'Replace':new(HashMap),
        NewObjectConfigDocument = 'DomDocumentHelper':create((get({Replace, '$class'})):all(Replace, DocString)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Final ObjectConfig: ", 'XmlDocumentHelper':toString(NewObjectConfigDocument)]), This, "generate()");
            false -> ok
        end,
        NewObjectConfigDocument.

