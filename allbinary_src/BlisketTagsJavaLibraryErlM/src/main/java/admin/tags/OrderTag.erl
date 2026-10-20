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
% import java.util.HashMap
% import javax.servlet.jsp.JspTagException
% import javax.servlet.jsp.tagext.TagSupport
% import admin.taghelpers.OrderHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.CustomTagSupport

-module('OrderTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTagSupport', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, command}, undefined),
    put({This, storeName}, undefined),
    put({This, propertiesHashMap}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'CustomTagSupport':'$init'(This),
    init_fields(This),
        ok.

setCommand(This, Command) when (is_list(Command) orelse Command =:= undefined) ->
        put({This, command}, Command).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value).

% throws LicensingException
process(This) ->
        try
            AnyType = (fun(Target_N66280) -> (get({Target_N66280, '$class'})):getInstance(Target_N66280, get({This, propertiesHashMap}), get({This, pageContext})) end)('OrderHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, get({get({This, commonStrings}), 'PROCESS'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
setPaymentGateway(This) ->
        try
            AnyType = (fun(Target_N66956) -> (get({Target_N66956, '$class'})):getInstance(Target_N66956, get({This, propertiesHashMap}), get({This, pageContext})) end)('OrderHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "setPaymentGateway", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({This, command}) =/= undefined) of
                true ->
                put({This, propertiesHashMap}, (fun(Target_N67647) -> (get({Target_N67647, '$class'})):createHashMap(Target_N67647) end)('StdUtil':getInstance())),
                (get({get({This, propertiesHashMap}), '$class'})):put(get({This, propertiesHashMap}), get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
                case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESS'})) =:= 0) of
                    true ->
                    (get({This, '$class'})):process(This);
                    false ->
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'}))) =:= 0) of
                    true ->
                    case ((get({This, '$class'})):setPaymentGateway(This) =:= true) of
                        true ->
                        throw({'$return', get({'TagSupport', 'EVAL_BODY_INCLUDE'})});
                        false -> ok
                    end;
                    false -> ok
                end
                end;
                false -> ok
            end,
            get({'TagSupport', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'OrderTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

