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
% package views.generic.address.shipping
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.money.tax.TaxFactory
% import org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface
% import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('AddTaxValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShippingAddressView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'ShippingAddressView':init(This, TransformInfoInterface),
        init_fields(This).

% throws Exception
isValid(This) ->
        try
        try
            put({This, streetAddress}, 'StreetAddress':new((get({This, '$class'})):getRequest(This))),
            StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N66344) -> (get({Target_N66344, '$class'})):getStoreName(Target_N66344) end)((get({This, '$class'})):getTransformInfoInterface(This))),
            TaxInterface = (fun(Target_N66392) -> (get({Target_N66392, '$class'})):getInstance(Target_N66392, get({This, abeClientInformation}), StoreFrontInterface) end)('TaxFactory':getInstance()),
            case (TaxInterface =:= undefined) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((get({TaxInterface, '$class'})):isValid(TaxInterface, get({This, streetAddress}), StoreFrontInterface) =:= false) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            BillingAddressesEntity = 'ShippingAddressesEntity':new((fun(Target_N66615) -> (get({Target_N66615, '$class'})):getUserName(Target_N66615) end)((get({This, '$class'})):getWeblisketSession(This))),
            StreetAddressList = (get({BillingAddressesEntity, '$class'})):get(BillingAddressesEntity),
            case (StreetAddressList =:= undefined) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            Size = (get({StreetAddressList, '$class'})):size(StreetAddressList),
            lists:foreach(fun(Index) ->
                AStreetAddress = (get({StreetAddressList, '$class'})):get(StreetAddressList, Index),
                case ((fun(Target_N66873) -> (get({Target_N66873, '$class'})):compareTo(Target_N66873, get({'ShippingAddressData', 'TAX'})) end)((get({AStreetAddress, '$class'})):getName(AStreetAddress)) =:= 0) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N67439) -> (get({Target_N67439, '$class'})):getStoreName(Target_N67439) end)((get({This, '$class'})):getTransformInfoInterface(This))),
            TaxInterface = (fun(Target_N67487) -> (get({Target_N67487, '$class'})):getInstance(Target_N67487, get({This, abeClientInformation}), StoreFrontInterface) end)('TaxFactory':getInstance()),
            case (TaxInterface =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Unable to Load Tax Component<br/>");
                false ->
                case ((get({TaxInterface, '$class'})):isValid(TaxInterface, get({This, streetAddress}), StoreFrontInterface) =:= false) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Unable to validate address with Tax Component<br/>");
                    false -> ok
                end
            end,
            BillingAddressesEntity = 'ShippingAddressesEntity':new((fun(Target_N67731) -> (get({Target_N67731, '$class'})):getUserName(Target_N67731) end)((get({This, '$class'})):getWeblisketSession(This))),
            StreetAddressList = (get({BillingAddressesEntity, '$class'})):get(BillingAddressesEntity),
            Size = (get({StreetAddressList, '$class'})):size(StreetAddressList),
            lists:foreach(fun(Index) ->
                AStreetAddress = (get({StreetAddressList, '$class'})):get(StreetAddressList, Index),
                case ((fun(Target_N67942) -> (get({Target_N67942, '$class'})):compareTo(Target_N67942, get({'ShippingAddressData', 'TAX'})) end)((get({AStreetAddress, '$class'})):getName(AStreetAddress)) =:= 0) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Not a valid tax location<br/>");
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to create validateInfo", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Creating ValidationInfo"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

