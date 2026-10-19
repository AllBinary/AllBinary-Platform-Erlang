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
% import admin.taghelpers.ShippingHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.CustomTagSupport

-module('ShippingTag').
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
    init(This),
    This.

init(This) ->
    'CustomTagSupport':init(This),
    init_fields(This),
        ok.

setCommand(This, Command) when (is_list(Command) orelse Command =:= undefined) ->
        put({This, command}, Command).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value).

% throws LicensingException
setShippingType(This) ->
        try
            AnyType = (fun(Target_N66200) -> (get({Target_N66200, '$class'})):getInstance(Target_N66200, get({This, propertiesHashMap}), get({This, pageContext})) end)('ShippingHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "setShippingType", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
            case (get({This, command}) =/= undefined) of
                true ->
                put({This, propertiesHashMap}, (fun(Target_N66883) -> (get({Target_N66883, '$class'})):createHashMap(Target_N66883) end)('StdUtil':getInstance())),
                (get({get({This, propertiesHashMap}), '$class'})):put(get({This, propertiesHashMap}), get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
                case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'SETSHIPPINGTYPE'})) =:= 0) of
                    true ->
                    (get({This, '$class'})):setShippingType(This);
                    false -> ok
                end;
                false -> ok
            end,
            get({'ShippingTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'ShippingTag', 'SKIP_BODY'})
        end.

