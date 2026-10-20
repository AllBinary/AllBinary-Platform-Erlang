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
% package tags.generic.order.history
% import java.lang.reflect.Method
% import javax.servlet.jsp.JspTagException
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import taghelpers.OrderHistoryHelperFactory
% import tags.StoreValidationTransformTag

-module('OrderHistoryTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

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
    'StoreValidationTransformTag':'$init'(This),
    init_fields(This),
        ok.

setStatus(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, status}, Value).

% throws LicensingException
setOrderStatus(This) ->
        try
            AnyType = (fun(Target_N66044) -> (get({Target_N66044, '$class'})):getInstance(Target_N66044, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('OrderHistoryHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "setOrderStatus", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            (get({This, '$class'})):setName(This, "Basic Order History View"),
            (get({This, '$class'})):setObjectFile(This, "views.generic.order.history.ValidationView"),
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N66761) -> (get({Target_N66761, '$class'})):compareTo(Target_N66761, get({'OrderHistoryData', 'SETSTATUS'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (fun(Target_N66936) -> (get({Target_N66936, '$class'})):put(Target_N66936, get({'OrderHistoryData', 'STATUS'}), get({This, status})) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                    (fun(Target_N66989) -> (get({Target_N66989, '$class'})):print(Target_N66989, (get({This, '$class'})):setOrderStatus(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                    false ->
                    case ((fun(Target_N66811) -> (get({Target_N66811, '$class'})):compareTo(Target_N66811, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    ok;
                    false ->
                    erlang:error({'Exception', lists:concat(["No Such View Command: ", (get({This, '$class'})):getCommand(This)])})
                end
                end,
                throw({'$return', 'StoreValidationTransformTag':doStartTag(This)});
                false -> ok
            end,
            erlang:error({'Exception', "Command Null"})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'OrderHistoryTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

