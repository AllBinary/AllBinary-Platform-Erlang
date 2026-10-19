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
% import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UpdateTaxValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShippingAddressView', Function, Arguments).

init_fields(This) ->
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'ShippingAddressView':init(This, TransformInfoInterface).

% throws Exception
isValid(This) ->
        try
        put({This, streetAddress}, 'StreetAddress':new((get({This, '$class'})):getRequest(This))),
        StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N66171) -> (get({Target_N66171, '$class'})):getStoreName(Target_N66171) end)((get({This, '$class'})):getTransformInfoInterface(This))),
        case ((fun(Target_N66215) -> (get({Target_N66215, '$class'})):isValid(Target_N66215, get({This, streetAddress}), StoreFrontInterface) end)((fun(Target_N66222) -> (get({Target_N66222, '$class'})):getInstance(Target_N66222, get({This, abeClientInformation}), StoreFrontInterface) end)('TaxFactory':getInstance())) =:= false) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        BillingAddressesEntity = 'ShippingAddressesEntity':new((fun(Target_N66360) -> (get({Target_N66360, '$class'})):getUserName(Target_N66360) end)((get({This, '$class'})):getWeblisketSession(This))),
        StreetAddressList = (get({BillingAddressesEntity, '$class'})):get(BillingAddressesEntity),
        case (StreetAddressList =:= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        put({local, count}, 0),
        Size = (get({StreetAddressList, '$class'})):size(StreetAddressList),
        lists:foreach(fun(Index) ->
            AStreetAddress = (get({StreetAddressList, '$class'})):get(StreetAddressList, Index),
            case ((fun(Target_N66641) -> (get({Target_N66641, '$class'})):compareTo(Target_N66641, get({'ShippingAddressData', 'TAX'})) end)((get({AStreetAddress, '$class'})):getName(AStreetAddress)) =:= 0) of
                true ->
                put({local, count}, get({local, count}) + 1);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        case (get({local, count}) =/= 1) of
            true ->
            false;
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        "Unable to update tax location.".

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

