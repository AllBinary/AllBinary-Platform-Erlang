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
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UpdateValidationView').
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
        case ((get({get({This, streetAddress}), '$class'})):isValid(get({This, streetAddress})) =:= false) of
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

