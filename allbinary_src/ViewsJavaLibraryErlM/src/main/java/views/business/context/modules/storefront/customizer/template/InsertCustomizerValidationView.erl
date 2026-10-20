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
% package views.business.context.modules.storefront.customizer.template
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.TransformFactory
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.info.GeneratorTransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfo
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.TransformInfosData
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView
% import views.business.context.modules.storefront.customizer.template.objectConfig.InsertTemplateCustomizerTransformInfoObjectConfig
% import views.business.context.modules.storefront.customizer.template.objectConfig.NoTemplateTransformInfoObjectConfig

-module('InsertCustomizerValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, viewName}, undefined),
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
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        RequestHashMap = (fun(Target_N66746) -> (get({Target_N66746, '$class'})):toHashMap(Target_N66746) end)('RequestParams':new((get({This, '$class'})):getPageContext(This))),
        put({This, viewName}, (get({RequestHashMap, '$class'})):get(RequestHashMap, get({'TransformInfoData':getInstance(), 'NAME'}))).

isValid(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Started Validation", This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            put({local, isValid}, true),
            case (fun(Target_N67208) -> (get({Target_N67208, '$class'})):isEmpty(Target_N67208, get({This, viewName})) end)('StringValidationUtil':getInstance()) of
                true ->
                put({local, isValid}, false);
                false ->
                ObjectConfig = 'NoTemplateTransformInfoObjectConfig':new((get({This, '$class'})):getTransformInfoInterface(This), (fun(Target_N67286) -> (get({Target_N67286, '$class'})):toXmlDoc(Target_N67286) end)((fun(Target_N67293) -> (get({Target_N67293, '$class'})):getObjectConfigInterface(Target_N67293) end)((get({This, '$class'})):getTransformInfoInterface(This)))),
                ComponentVector = (get({ObjectConfig, '$class'})):getGroupTransforms(ObjectConfig),
                Size = (get({ComponentVector, '$class'})):size(ComponentVector),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Pointing "),
                    (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), (get({ComponentVector, '$class'})):size(ComponentVector)),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " Components"),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                lists:foreach(fun(Index) ->
                    TransformInfo = (get({ComponentVector, '$class'})):get(ComponentVector, Index),
                    TransformInfoName = (get({TransformInfo, '$class'})):getName(TransformInfo),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Setting Template Component with ViewName: ", TransformInfoName]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                        false -> ok
                    end,
                    ComponentInterface = (fun(Target_N68172) -> (get({Target_N68172, '$class'})):getInstance(Target_N68172, get({This, abeClientInformation}), TransformInfoName, (get({This, '$class'})):getTransformInfoInterface(This)) end)('TransformFactory':getInstance()),
                    TemplateViewObjectConfig = 'InsertTemplateCustomizerTransformInfoObjectConfig':new((get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface), (fun(Target_N68285) -> (get({Target_N68285, '$class'})):toXmlDoc(Target_N68285) end)((fun(Target_N68292) -> (get({Target_N68292, '$class'})):getObjectConfigInterface(Target_N68292) end)((get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface)))),
                    StoreName = (fun(Target_N68346) -> (get({Target_N68346, '$class'})):getStoreName(Target_N68346) end)((get({This, '$class'})):getTransformInfoInterface(This)),
                    EndIndex = (allbinary_java:index_of(get({This, viewName}), StoreName) + string:length(StoreName)),
                    StorePrepend = string:slice(get({This, viewName}), 0, (EndIndex) - (0)),
                    ViewNamePostfix = string:slice(get({This, viewName}), EndIndex, (string:length(get({This, viewName}))) - (EndIndex)),
                    NewViewNameStringBuffer = 'StringMaker':new(),
                    (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, StorePrepend),
                    CommonSeps = 'CommonSeps':getInstance(),
                    TransformInfosData = 'TransformInfosData':getInstance(),
                    case (allbinary_java:index_of(TransformInfoName, get({TransformInfosData, 'SMALL_PREVIEW'})) >= 0) of
                        true ->
                        (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, get({CommonSeps, 'SPACE'})),
                        (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, get({TransformInfosData, 'SMALL_PREVIEW'}));
                        false ->
                        case (allbinary_java:index_of(TransformInfoName, get({TransformInfosData, 'PREVIEW'})) >= 0) of
                        true ->
                        (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, get({CommonSeps, 'SPACE'})),
                        (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, get({TransformInfosData, 'PREVIEW'}));
                        false -> ok
                    end
                    end,
                    (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, get({CommonSeps, 'SPACE'})),
                    (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, ViewNamePostfix),
                    case (allbinary_java:index_of(TransformInfoName, get({'GeneratorTransformInfoData', 'NAME'})) >= 0) of
                        true ->
                        (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, get({CommonSeps, 'SPACE'})),
                        (get({NewViewNameStringBuffer, '$class'})):append(NewViewNameStringBuffer, get({'GeneratorTransformInfoData', 'NAME'}));
                        false -> ok
                    end,
                    NewViewName = (get({NewViewNameStringBuffer, '$class'})):toString(NewViewNameStringBuffer),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        put({local, stringBuffer}, 'StringMaker':new()),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Template Component: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), TransformInfoName),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\n Now Pointing To View Name: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), NewViewName),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                        false -> ok
                    end,
                    (get({TemplateViewObjectConfig, '$class'})):set(TemplateViewObjectConfig, NewViewName),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        put({local, stringBuffer}, 'StringMaker':new()),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Template Component: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), TransformInfoName),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\n with ObjectConfig: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({TemplateViewObjectConfig, '$class'})):toString(TemplateViewObjectConfig)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                        false -> ok
                    end,
                    (fun(Target_N70099) -> (get({Target_N70099, '$class'})):setObjectConfigInterface(Target_N70099, TemplateViewObjectConfig) end)((get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface)),
                    UpdatedTransformInfoHashMap = (fun(Target_N70146) -> (get({Target_N70146, '$class'})):toHashMap(Target_N70146) end)((get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface)),
                    (fun(Target_N70189) -> (get({Target_N70189, '$class'})):update(Target_N70189, UpdatedTransformInfoHashMap) end)('TransformInfoEntityBuilder':getInstance())
                end, lists:seq(0, Size - 1))
            end,
            get({local, isValid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Error: Template Name Is Empty."),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Getting Validation Info"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
view(This) ->
        (fun(Target_N71146) -> (get({Target_N71146, '$class'})):view(Target_N71146, This) end)((get({get({get({This, views}), 'ValidationOnlyTempUtil'}), '$class'})):getInstance(get({get({This, views}), 'ValidationOnlyTempUtil'}))).

