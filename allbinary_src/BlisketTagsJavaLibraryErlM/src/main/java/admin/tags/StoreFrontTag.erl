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
% import admin.taghelpers.StoreFrontHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.CustomTagSupport

-module('StoreFrontTag').
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
getCurrentLocation(This) ->
        try
            AnyType = (fun(Target_N66200) -> (get({Target_N66200, '$class'})):getInstance(Target_N66200, get({This, propertiesHashMap}), get({This, pageContext})) end)('StoreFrontHelperFactory':new()),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "getCurrentLocation", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
getCurrentHomeLocation(This) ->
        try
            AnyType = (fun(Target_N66814) -> (get({Target_N66814, '$class'})):getInstance(Target_N66814, get({This, propertiesHashMap}), get({This, pageContext})) end)('StoreFrontHelperFactory':new()),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "getCurrentHomeLocation", undefined),
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
                put({This, propertiesHashMap}, (fun(Target_N67462) -> (get({Target_N67462, '$class'})):createHashMap(Target_N67462) end)('StdUtil':getInstance())),
                (get({get({This, propertiesHashMap}), '$class'})):put(get({This, propertiesHashMap}), get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
                case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'GETCURRENTLOCATION'})) =:= 0) of
                    true ->
                    (fun(Target_N67755) -> (get({Target_N67755, '$class'})):print(Target_N67755, (get({This, '$class'})):getCurrentLocation(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                    false ->
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'GETCURRENTHOMELOCATION'})) =:= 0) of
                    true ->
                    (fun(Target_N67705) -> (get({Target_N67705, '$class'})):print(Target_N67705, (get({This, '$class'})):getCurrentHomeLocation(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                    false -> ok
                end
                end;
                false -> ok
            end,
            get({'StoreFrontTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'StoreFrontTag', 'SKIP_BODY'})
        end.

