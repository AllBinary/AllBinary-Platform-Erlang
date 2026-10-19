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
% package tags.generic.address.shipping
% import javax.servlet.jsp.JspTagException
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.StoreValidationTransformTag

-module('ShippingAddressTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

init_fields(This) ->
    put({This, value}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'StoreValidationTransformTag':init(This),
    init_fields(This),
        ok.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N65847) -> (get({Target_N65847, '$class'})):compareTo(Target_N65847, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Shipping Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.shipping.ViewShippingAddressesView");
                    false ->
                    case ((fun(Target_N65921) -> (get({Target_N65921, '$class'})):compareTo(Target_N65921, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Shipping Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.shipping.EditShippingAddressesView");
                    false ->
                    case ((fun(Target_N65995) -> (get({Target_N65995, '$class'})):compareTo(Target_N65995, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Shipping Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.shipping.NewShippingAddressesView");
                    false ->
                    case ((fun(Target_N66069) -> (get({Target_N66069, '$class'})):compareTo(Target_N66069, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Shipping Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.shipping.AddShippingAddressesView");
                    false ->
                    case ((fun(Target_N66122) -> (get({Target_N66122, '$class'})):compareTo(Target_N66122, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Shipping Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.shipping.DeleteShippingAddressesView");
                    false ->
                    case ((fun(Target_N66175) -> (get({Target_N66175, '$class'})):compareTo(Target_N66175, get({'ShippingAddressData', 'SELECT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Shipping Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.shipping.SelectShippingAddressesView");
                    false ->
                    case ((fun(Target_N66225) -> (get({Target_N66225, '$class'})):compareTo(Target_N66225, get({'ShippingAddressData', 'SETTOBILLINGADDRESS'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Shipping Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.shipping.SetShippingAddressesView");
                    false ->
                    erlang:error({'Exception', lists:concat(["No Such View Command: ", (get({This, '$class'})):getCommand(This)])})
                end
                end
                end
                end
                end
                end
                end,
                throw({'$return', 'StoreValidationTransformTag':doStartTag(This)});
                false -> ok
            end,
            erlang:error({'Exception', "Command Null"})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'ShippingAddressTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

