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
% package tags.generic.address.billing
% import javax.servlet.jsp.JspTagException
% import org.allbinary.business.user.address.BillingAddressData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.StoreValidationTransformTag

-module('BillingAddressTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'StoreValidationTransformTag':'$init'(This),
    init_fields(This),
        ok.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N65821) -> (get({Target_N65821, '$class'})):compareTo(Target_N65821, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Billing Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.billing.ValidationView");
                    false ->
                    case ((fun(Target_N65895) -> (get({Target_N65895, '$class'})):compareTo(Target_N65895, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Billing Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.billing.EditValidationView");
                    false ->
                    case ((fun(Target_N65969) -> (get({Target_N65969, '$class'})):compareTo(Target_N65969, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Billing Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.billing.NewValidationView");
                    false ->
                    case ((fun(Target_N66043) -> (get({Target_N66043, '$class'})):compareTo(Target_N66043, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Billing Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.billing.AddValidationView");
                    false ->
                    case ((fun(Target_N66096) -> (get({Target_N66096, '$class'})):compareTo(Target_N66096, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Billing Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.billing.DeleteValidationView");
                    false ->
                    case ((fun(Target_N66149) -> (get({Target_N66149, '$class'})):compareTo(Target_N66149, get({'BillingAddressData', 'SELECT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Billing Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.billing.SelectValidationView");
                    false ->
                    case ((fun(Target_N66199) -> (get({Target_N66199, '$class'})):compareTo(Target_N66199, get({'BillingAddressData', 'SETTOSHIPPINGADDRESS'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Billing Address View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.address.billing.SetValidationView");
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
            get({'BillingAddressTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

