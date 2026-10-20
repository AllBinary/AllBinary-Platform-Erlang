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
% import admin.taghelpers.OrderItemsHelperFactory
% import admin.taghelpers.OrderItemsRequestHelperFactory
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('OrderItemsTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, status}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TableTag':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'OrderItemsHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'OrderItemsRequestHelperFactory':new()).

setStatus(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, status}, Value).

% throws LicensingException
setOrderStatus(This) ->
        try
        try
            AnyType = (fun(Target_N66096) -> (get({Target_N66096, '$class'})):getInstance(Target_N66096, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('OrderItemsRequestHelperFactory':new()),
            case (get({This, status}) =:= undefined) of
                true ->
                put({local, helperClass}, get({AnyType, '$class'})),
                put({local, method}, (get({get({local, helperClass}), '$class'})):getMethod(get({local, helperClass}), "setOrderStatus", undefined)),
                put({local, result}, (get({get({local, method}), '$class'})):invoke(get({local, method}), AnyType, undefined)),
                throw({'$return', get({local, result})});
                false ->
                put({local, helperClass}, get({AnyType, '$class'})),
                MethodParams = array:from_list([get({get({This, status}), '$class'})]),
                put({local, method}, (get({get({local, helperClass}), '$class'})):getMethod(get({local, helperClass}), "setOrderStatus", MethodParams)),
                MethodArgs = array:from_list([get({This, status})]),
                put({local, result}, (get({get({local, method}), '$class'})):invoke(get({local, method}), AnyType, MethodArgs)),
                throw({'$return', get({local, result})})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({This, '$class'})):isEnabled(This) of
                true ->
                case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                    true ->
                    (fun(Target_N67131) -> (get({Target_N67131, '$class'})):put(Target_N67131, get({'OrderHistoryData', 'STATUS'}), get({This, status})) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                    case ((fun(Target_N67188) -> (get({Target_N67188, '$class'})):compareTo(Target_N67188, get({'OrderHistoryData', 'SETSTATUS'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (fun(Target_N67261) -> (get({Target_N67261, '$class'})):print(Target_N67261, (get({This, '$class'})):setOrderStatus(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                        false ->
                        throw({'$return', 'TableTag':doStartTag(This)})
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            get({'OrderItemsTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'OrderItemsTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

