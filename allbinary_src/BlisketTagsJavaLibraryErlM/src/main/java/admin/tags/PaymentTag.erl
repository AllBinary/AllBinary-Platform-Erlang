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
% import admin.taghelpers.PaymentHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('PaymentTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, storeName}, undefined),
    put({This, propertiesHashMap}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'TableTag':init(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'PaymentHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'PaymentHelperFactory':new()).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value).

% throws LicensingException
select(This) ->
        try
            AnyType = (fun(Target_N66191) -> (get({Target_N66191, '$class'})):getInstance(Target_N66191, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('PaymentHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "select", undefined),
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
                put({This, propertiesHashMap}, (fun(Target_N66863) -> (get({Target_N66863, '$class'})):createHashMap(Target_N66863) end)('StdUtil':getInstance())),
                (get({get({This, propertiesHashMap}), '$class'})):put(get({This, propertiesHashMap}), get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
                case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                    true ->
                    case ((fun(Target_N66984) -> (get({Target_N66984, '$class'})):compareTo(Target_N66984, get({'PaymentData', 'SELECT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        Output = (get({This, '$class'})):select(This),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N67266) -> (get({Target_N67266, '$class'})):print(Target_N67266, lists:concat([Output, "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end,
                        throw({'$return', get({This, 'EVAL_BODY_INCLUDE'})});
                        false ->
                        throw({'$return', 'TableTag':doStartTag(This)})
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            get({'PaymentTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'PaymentTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

