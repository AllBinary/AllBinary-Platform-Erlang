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
% package views.business.context.modules.storefront.customizer.generic.page
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.data.tables.transform.info.TransformInfoEntity
% import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfo
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface
% import org.allbinary.logic.visual.transform.template.customizer.page.PageValidation
% import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.customizer.CustomizerUtil

-module('PageValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('PageView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'PageView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "PageViewValidation()");
            false -> ok
        end.

isValid(This) ->
        try
            put({local, isValid}, true),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            TransformInfoEntityInterface = 'TransformInfoEntityBuilder':getInstance(),
            PageObjectConfigInterface = (fun(Target_N67024) -> (get({Target_N67024, '$class'})):getObjectConfigInterface(Target_N67024) end)((get({This, '$class'})):getTransformInfoInterface(This)),
            AllViewsToBeModifiedVector = (get({PageObjectConfigInterface, '$class'})):getGroupTransforms(PageObjectConfigInterface),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Views To Be Modified: ", (get({AllViewsToBeModifiedVector, '$class'})):size(AllViewsToBeModifiedVector)]), This, "get(transformInfoInterface)");
                false -> ok
            end,
            Size = (get({AllViewsToBeModifiedVector, '$class'})):size(AllViewsToBeModifiedVector),
            lists:foreach(fun(Index) ->
                TransformInfoInterface = (get({AllViewsToBeModifiedVector, '$class'})):get(AllViewsToBeModifiedVector, Index),
                ViewNameOfViewToBeModified = (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (fun(Target_N67735) -> (get({Target_N67735, '$class'})):getName(Target_N67735) end)((get({This, '$class'})):getTransformInfoInterface(This))),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " is modifying view: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ViewNameOfViewToBeModified),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "insert()");
                    false -> ok
                end,
                HttpTransformInfoInterface = (get({This, '$class'})):getTransformInfoInterface(This),
                SpecifiedTransformInfoInterface = (get({TransformInfoEntityInterface, '$class'})):get(TransformInfoEntityInterface, ViewNameOfViewToBeModified, (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface), (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (fun(Target_N68233) -> (get({Target_N68233, '$class'})):getName(Target_N68233) end)((get({This, '$class'})):getTransformInfoInterface(This))),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " is adding data to view: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ViewNameOfViewToBeModified),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "insert()");
                    false -> ok
                end,
                HashMap = (fun(Target_N68376) -> (get({Target_N68376, '$class'})):createHashMap(Target_N68376) end)('StdUtil':getInstance()),
                Title = (fun(Target_N68427) -> (get({Target_N68427, '$class'})):substring(Target_N68427, (fun(Target_N68452) -> (get({Target_N68452, '$class'})):length(Target_N68452) end)((fun(Target_N68459) -> (get({Target_N68459, '$class'})):getStoreName(Target_N68459) end)((get({This, '$class'})):getTransformInfoInterface(This)))) end)((get({SpecifiedTransformInfoInterface, '$class'})):getName(SpecifiedTransformInfoInterface)),
                case ((get({Title, '$class'})):compareTo(Title, "index") =:= 0) of
                    true ->
                    (get({HashMap, '$class'})):put(HashMap, get({'TitleData':getInstance(), 'TEXT'}), lists:concat([(fun(Target_N68680) -> (get({Target_N68680, '$class'})):getStoreName(Target_N68680) end)((get({This, '$class'})):getTransformInfoInterface(This)), " - Home Page"]));
                    false ->
                    (get({HashMap, '$class'})):put(HashMap, get({'TitleData':getInstance(), 'TEXT'}), lists:concat([lists:concat([(fun(Target_N68589) -> (get({Target_N68589, '$class'})):getStoreName(Target_N68589) end)((get({This, '$class'})):getTransformInfoInterface(This)), " -"]), Title]))
                end,
                PageValidation = 'PageValidation':new(HashMap),
                case ((get({PageValidation, '$class'})):isValid(PageValidation) =:= false) of
                    true ->
                    put({local, isValid}, false);
                    false -> ok
                end,
                case (get({local, isValid}) =:= true) of
                    true ->
                    Document = 'DomDocumentHelper':create(),
                    (get({Document, '$class'})):appendChild(Document, (get({PageValidation, '$class'})):toXmlNode(PageValidation, Document)),
                    DocumentString = 'XmlDocumentHelper':toString(Document),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        put({local, stringBuffer}, 'StringMaker':new()),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ViewNameOfViewToBeModified),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " is changing data in "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (fun(Target_N69317) -> (get({Target_N69317, '$class'})):toString(Target_N69317) end)((get({SpecifiedTransformInfoInterface, '$class'})):getDataFilePath(SpecifiedTransformInfoInterface))),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to the following data:\n"),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), DocumentString),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                        false -> ok
                    end,
                    (fun(Target_N69472) -> (get({Target_N69472, '$class'})):write(Target_N69472, SpecifiedTransformInfoInterface, DocumentString) end)('CustomizerUtil':getInstance());
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
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
            TransformInfoEntityInterface = 'TransformInfoEntityBuilder':getInstance(),
            ObjectConfig = (fun(Target_N70020) -> (get({Target_N70020, '$class'})):getObjectConfigInterface(Target_N70020) end)((get({This, '$class'})):getTransformInfoInterface(This)),
            HttpTransformInfoInterface = (get({This, '$class'})):getTransformInfoInterface(This),
            AllViewsToBeModifiedVector = (get({ObjectConfig, '$class'})):getGroupTransforms(ObjectConfig),
            Size = (get({AllViewsToBeModifiedVector, '$class'})):size(AllViewsToBeModifiedVector),
            lists:foreach(fun(Index) ->
                TransformInfoInterface = (get({AllViewsToBeModifiedVector, '$class'})):get(AllViewsToBeModifiedVector, Index),
                ViewNameOfViewToBeModified = (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface),
                SpecifiedTransformInfoInterface = (get({TransformInfoEntityInterface, '$class'})):get(TransformInfoEntityInterface, ViewNameOfViewToBeModified, (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface), (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
                HashMap = (fun(Target_N70408) -> (get({Target_N70408, '$class'})):createHashMap(Target_N70408) end)('StdUtil':getInstance()),
                Title = (fun(Target_N70459) -> (get({Target_N70459, '$class'})):substring(Target_N70459, (fun(Target_N70484) -> (get({Target_N70484, '$class'})):length(Target_N70484) end)((fun(Target_N70491) -> (get({Target_N70491, '$class'})):getStoreName(Target_N70491) end)((get({This, '$class'})):getTransformInfoInterface(This)))) end)((get({SpecifiedTransformInfoInterface, '$class'})):getName(SpecifiedTransformInfoInterface)),
                case ((get({Title, '$class'})):compareTo(Title, "index") =:= 0) of
                    true ->
                    (get({HashMap, '$class'})):put(HashMap, get({'TitleData':getInstance(), 'TEXT'}), lists:concat([(fun(Target_N70712) -> (get({Target_N70712, '$class'})):getStoreName(Target_N70712) end)((get({This, '$class'})):getTransformInfoInterface(This)), " - Home Page"]));
                    false ->
                    (get({HashMap, '$class'})):put(HashMap, get({'TitleData':getInstance(), 'TEXT'}), lists:concat([lists:concat([(fun(Target_N70621) -> (get({Target_N70621, '$class'})):getStoreName(Target_N70621) end)((get({This, '$class'})):getTransformInfoInterface(This)), " -"]), Title]))
                end,
                PageValidation = 'PageValidation':new(HashMap),
                case ((get({PageValidation, '$class'})):isValid(PageValidation) =:= false) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat(["TransformInfo Name for PageValidation:", (get({SpecifiedTransformInfoInterface, '$class'})):getName(SpecifiedTransformInfoInterface)])),
                    (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat(["PageValidation:", HashMap])),
                    (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat(["PageValidation Info:", (get({PageValidation, '$class'})):validationInfo(PageValidation)]));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "An auto generated page name was invalid."
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

