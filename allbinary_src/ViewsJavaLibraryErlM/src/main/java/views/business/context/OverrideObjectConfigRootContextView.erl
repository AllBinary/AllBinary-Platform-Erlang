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
% package views.business.context
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.TransformFactory
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.info.GeneratorTransformInfoData
% import org.allbinary.logic.visual.transform.info.RootTransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoHttp
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface
% import org.allbinary.logic.visual.transform.template.TransformTemplateInterface
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('OverrideObjectConfigRootContextView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "OverrideObjectRootContextView()");
            false -> ok
        end.

% throws Exception
view(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (fun(Target_N66708) -> (get({Target_N66708, '$class'})):getName(Target_N66708) end)((get({This, '$class'})):getTransformInfoInterface(This))]), This, "view()");
                false -> ok
            end,
            RootTransformInfoInterface = 'TransformInfoHttp':new((get({This, '$class'})):getTransformInfoInterface(This)),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66877) -> (get({Target_N66877, '$class'})):getStoreName(Target_N66877) end)((get({This, '$class'})):getTransformInfoInterface(This))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
            NameStart = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case ((fun(Target_N66996) -> (get({Target_N66996, '$class'})):indexOf(Target_N66996, get({'GeneratorTransformInfoData', 'NAME'})) end)((fun(Target_N67003) -> (get({Target_N67003, '$class'})):getName(Target_N67003) end)((get({This, '$class'})):getTransformInfoInterface(This))) > 0) of
                true ->
                (get({RootTransformInfoInterface, '$class'})):setName(RootTransformInfoInterface, lists:concat([NameStart, get({'GeneratorTransformInfoData', 'NAME'})]));
                false ->
                case ((fun(Target_N67054) -> (get({Target_N67054, '$class'})):indexOf(Target_N67054, get({'RootTransformInfoData', 'NAME'})) end)((fun(Target_N67061) -> (get({Target_N67061, '$class'})):getName(Target_N67061) end)((get({This, '$class'})):getTransformInfoInterface(This))) > 0) of
                true ->
                (get({RootTransformInfoInterface, '$class'})):setName(RootTransformInfoInterface, lists:concat([NameStart, get({'RootTransformInfoData', 'NAME'})]));
                false ->
                erlang:error({'Exception', "Override Currently Not Supported"})
            end
            end,
            OverrideObjectConfigDocument = (fun(Target_N67270) -> (get({Target_N67270, '$class'})):toXmlDoc(Target_N67270) end)((fun(Target_N67277) -> (get({Target_N67277, '$class'})):getObjectConfigInterface(Target_N67277) end)((get({This, '$class'})):getTransformInfoInterface(This))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Retrieved OverrideObjectConfig: ", 'XmlDocumentHelper':toString(OverrideObjectConfigDocument)]), This, "view()");
                false -> ok
            end,
            TransformFactory = 'TransformFactory':getInstance(),
            RootComponentInterface = (get({TransformFactory, '$class'})):getInstance(TransformFactory, get({This, abeClientInformation}), (get({RootTransformInfoInterface, '$class'})):getName(RootTransformInfoInterface), RootTransformInfoInterface),
            TransformTemplateInterface = RootComponentInterface,
            ComponentInterface = (get({TransformFactory, '$class'})):getInstance(TransformFactory, get({This, abeClientInformation}), (get({TransformTemplateInterface, '$class'})):getName(TransformTemplateInterface), (get({RootComponentInterface, '$class'})):getTransformInfoInterface(RootComponentInterface)),
            TransformInfoObjectConfigInterface = (fun(Target_N67838) -> (get({Target_N67838, '$class'})):getInstance(Target_N67838, get({This, abeClientInformation}), (get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface), OverrideObjectConfigDocument) end)('TransformInfoObjectConfigAndManipulatorFactory':getInstance()),
            (fun(Target_N67919) -> (get({Target_N67919, '$class'})):setObjectConfigInterface(Target_N67919, TransformInfoObjectConfigInterface) end)((get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Set OverrideObjectConfig: ", (fun(Target_N68157) -> (get({Target_N68157, '$class'})):toString(Target_N68157) end)((fun(Target_N68164) -> (get({Target_N68164, '$class'})):getObjectConfigInterface(Target_N68164) end)((get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface)))]), This, "view()");
                false -> ok
            end,
            (get({ComponentInterface, '$class'})):view(ComponentInterface)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

