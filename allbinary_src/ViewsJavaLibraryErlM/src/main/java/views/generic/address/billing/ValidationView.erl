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
% package views.generic.address.billing
% import org.allbinary.data.tables.user.address.billing.BillingAddressesEntity
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BillingAddressesView', Function, Arguments).

init_fields(This) ->
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'BillingAddressesView':init(This, TransformInfoInterface).

isValid(This) ->
        try
        BillingAddressesEntity = 'BillingAddressesEntity':new((fun(Target_N65876) -> (get({Target_N65876, '$class'})):getUserName(Target_N65876) end)((get({This, '$class'})):getWeblisketSession(This))),
        put({This, streetAddresses}, (get({BillingAddressesEntity, '$class'})):get(BillingAddressesEntity)),
        case (get({This, streetAddresses}) =:= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        case ((get({get({This, streetAddresses}), '$class'})):size(get({This, streetAddresses})) < 1) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        "No Billing Addresses to display.<br />".

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

