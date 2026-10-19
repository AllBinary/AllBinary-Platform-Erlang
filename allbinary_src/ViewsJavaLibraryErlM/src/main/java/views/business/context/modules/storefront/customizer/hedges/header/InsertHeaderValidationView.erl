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
% package views.business.context.modules.storefront.customizer.hedges.header
% import java.util.HashMap
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.request.MultipartRequestParams
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.template.customizer.hedges.heading.HeadingValidation
% import org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.customizer.CustomizerUtil

-module('InsertHeaderValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TopBarView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'LOGOPATH'}, "logo/"),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'TopBarView':init(This, TransformInfoInterface),
        init_fields(This),
        MultipartRequestHashMap = (fun(Target_N66288) -> (get({Target_N66288, '$class'})):toHashMap(Target_N66288) end)('MultipartRequestParams':new((get({This, '$class'})):getPageContext(This))),
        StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N66366) -> (get({Target_N66366, '$class'})):getStoreName(Target_N66366) end)((get({This, '$class'})):getWeblisketSession(This))),
        FullPath = lists:concat([((get({get({'InsertHeaderValidationView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'InsertHeaderValidationView', 'URLGLOBALS'})) + (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)), get({This, 'LOGOPATH'})]),
        (get({MultipartRequestHashMap, '$class'})):put(MultipartRequestHashMap, get({'LogoData':getInstance(), 'IMAGEPATH'}), FullPath),
        put({This, heading}, 'HeadingValidation':new(MultipartRequestHashMap)).

% throws Exception
toXmlDoc(This) ->
        undefined.

isValid(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "topbarValidation", This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            IsValid = (get({get({This, heading}), '$class'})):isValid(get({This, heading})),
            case (IsValid =:= true) of
                true ->
                (fun(Target_N67006) -> (get({Target_N67006, '$class'})):insert(Target_N67006, (get({This, '$class'})):getTransformInfoInterface(This), This) end)('CustomizerUtil':getInstance());
                false -> ok
            end,
            IsValid
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
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, heading}), '$class'})):validationInfo(get({This, heading}))),
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

