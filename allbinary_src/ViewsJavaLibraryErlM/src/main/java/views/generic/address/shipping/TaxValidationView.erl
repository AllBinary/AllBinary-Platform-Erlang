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
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('TaxValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShippingAddressView', Function, Arguments).

init_fields(This) ->
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'ShippingAddressView':'$init'(This, TransformInfoInterface).

isValid(This) ->
        try
        BillingAddressesEntity = 'ShippingAddressesEntity':new((fun(Target_N66026) -> (get({Target_N66026, '$class'})):getUserName(Target_N66026) end)((get({This, '$class'})):getWeblisketSession(This))),
        StreetAddressList = (get({BillingAddressesEntity, '$class'})):get(BillingAddressesEntity),
        case (StreetAddressList =:= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        Size = (get({StreetAddressList, '$class'})):size(StreetAddressList),
        lists:foreach(fun(Index) ->
            AStreetAddress = (get({StreetAddressList, '$class'})):get(StreetAddressList, Index),
            case ((fun(Target_N66280) -> (get({Target_N66280, '$class'})):compareTo(Target_N66280, get({'ShippingAddressData', 'TAX'})) end)((get({AStreetAddress, '$class'})):getName(AStreetAddress)) =:= 0) of
                true ->
                put({This, streetAddress}, AStreetAddress),
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

