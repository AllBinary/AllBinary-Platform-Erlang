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
% package views.admin.storefront
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('EditValidationStoreFrontView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreFrontComponent', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'StoreFrontComponent':init(This, TransformInfoInterface),
        init_fields(This).

isValid(This) ->
        try
            put({local, valid}, true),
            case ((get({get({This, newStoreFrontInterface}), '$class'})):isNameValid(get({This, newStoreFrontInterface})) =:= false) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case ('StoreFrontFactory':getInstance((get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface}))) =:= undefined) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            put({This, newStoreFrontInterface}, 'StoreFrontFactory':getInstance((get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface})))),
            get({local, valid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case ((get({get({This, newStoreFrontInterface}), '$class'})):isNameValid(get({This, newStoreFrontInterface})) =:= false) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, newStoreFrontInterface}), '$class'})):nameValidationInfo(get({This, newStoreFrontInterface})));
                false -> ok
            end,
            case ('StoreFrontFactory':getInstance((get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface}))) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([get({This, newStoreFrontInterface}), " does not exist.<br>"]));
                false -> ok
            end,
            "Unkown Error"
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
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

