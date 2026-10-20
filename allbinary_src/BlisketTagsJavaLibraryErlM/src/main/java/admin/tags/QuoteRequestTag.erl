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
% import admin.taghelpers.QuoteHelperFactory
% import admin.taghelpers.QuoteRequestHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('QuoteRequestTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, storeName}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TableTag':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'QuoteHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'QuoteRequestHelperFactory':new()).

setStoreName(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        put({This, storeName}, StoreName).

% throws LicensingException
email(This) ->
        try
            AnyType = (fun(Target_N66091) -> (get({Target_N66091, '$class'})):getInstance(Target_N66091, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('QuoteHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "email", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                (fun(Target_N66756) -> (get({Target_N66756, '$class'})):put(Target_N66756, get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                case ((fun(Target_N66821) -> (get({Target_N66821, '$class'})):compareTo(Target_N66821, "EMAIL") end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):email(This),
                    throw({'$return', get({This, 'EVAL_BODY_INCLUDE'})});
                    false ->
                    throw({'$return', 'TableTag':doStartTag(This)})
                end;
                false -> ok
            end,
            get({'QuoteRequestTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'QuoteRequestTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

