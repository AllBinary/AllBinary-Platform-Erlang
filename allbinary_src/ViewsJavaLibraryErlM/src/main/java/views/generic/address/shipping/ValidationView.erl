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
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShippingAddressesView', Function, Arguments).

init_fields(This) ->
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'ShippingAddressesView':init(This, TransformInfoInterface).

isValid(This) ->
        try
        BillingAddressesEntity = 'ShippingAddressesEntity':new((fun(Target_N65911) -> (get({Target_N65911, '$class'})):getUserName(Target_N65911) end)((get({This, '$class'})):getWeblisketSession(This))),
        put({This, streetAddressList}, (get({BillingAddressesEntity, '$class'})):get(BillingAddressesEntity)),
        case (get({This, streetAddressList}) =:= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        Size = (get({get({This, streetAddressList}), '$class'})):size(get({This, streetAddressList})),
        lists:foreach(fun(Index) ->
            StreetAddress = (get({get({This, streetAddressList}), '$class'})):get(get({This, streetAddressList}), Index),
            case ((get({StreetAddress, '$class'})):isValid(StreetAddress) =:= false) of
                true ->
                (get({get({This, streetAddressList}), '$class'})):remove(get({This, streetAddressList}), StreetAddress);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        case ((get({get({This, streetAddressList}), '$class'})):size(get({This, streetAddressList})) < 1) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        "No Shipping Addresses to display.<br />".

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

