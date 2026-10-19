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
% package admin.tags
% import java.lang.reflect.Method
% import javax.servlet.jsp.JspTagException
% import admin.taghelpers.ShippingAddressHelperFactory
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('ShippingAddressTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, value}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'TableTag':init(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'ShippingAddressHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'ShippingAddressHelperFactory':new()).

setValue(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, value}, Value).

% throws LicensingException
set(This) ->
        try
            AnyType = (fun(Target_N66066) -> (get({Target_N66066, '$class'})):getInstance(Target_N66066, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('ShippingAddressHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "set", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
setToBillingAddress(This) ->
        try
            AnyType = (fun(Target_N66715) -> (get({Target_N66715, '$class'})):getInstance(Target_N66715, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('ShippingAddressHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "setToBillingAddress", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({This, '$class'})):isEnabled(This) of
                true ->
                case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                    true ->
                    case ((fun(Target_N67406) -> (get({Target_N67406, '$class'})):compareTo(Target_N67406, get({'ShippingAddressData', 'SELECT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (get({This, '$class'})):set(This),
                        throw({'$return', get({This, 'EVAL_BODY_INCLUDE'})});
                        false ->
                        case ((fun(Target_N67456) -> (get({Target_N67456, '$class'})):compareTo(Target_N67456, get({'ShippingAddressData', 'SETTOBILLINGADDRESS'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (get({This, '$class'})):setToBillingAddress(This);
                        false ->
                        throw({'$return', 'TableTag':doStartTag(This)})
                    end
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            get({'ShippingAddressTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'ShippingAddressTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

