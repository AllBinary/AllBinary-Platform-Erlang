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
% import org.allbinary.business.user.address.StreetAddressData
% import org.allbinary.data.tables.user.address.billing.BillingAddressesEntity
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('EditValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BillingAddressView', Function, Arguments).

init_fields(This) ->
    put({This, value}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'BillingAddressView':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, value}, (fun(Target_N65882) -> (get({Target_N65882, '$class'})):getParameter(Target_N65882, get({'StreetAddressData', 'ID'})) end)((fun(Target_N65889) -> (get({Target_N65889, '$class'})):getRequest(Target_N65889) end)((get({This, '$class'})):getPageContext(This)))).

isValid(This) ->
        try
        case ((fun(Target_N65990) -> (get({Target_N65990, '$class'})):getUserName(Target_N65990) end)((get({This, '$class'})):getWeblisketSession(This)) =/= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        BillingAddressesEntity = 'BillingAddressesEntity':new((fun(Target_N66065) -> (get({Target_N66065, '$class'})):getUserName(Target_N66065) end)((get({This, '$class'})):getWeblisketSession(This))),
        put({This, streetAddress}, (get({BillingAddressesEntity, '$class'})):get(BillingAddressesEntity, get({This, value}))),
        case (get({This, streetAddress}) =:= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        (get({get({This, streetAddress}), '$class'})):isValid(get({This, streetAddress}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        (get({get({This, streetAddress}), '$class'})):validationInfo(get({This, streetAddress})).

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

