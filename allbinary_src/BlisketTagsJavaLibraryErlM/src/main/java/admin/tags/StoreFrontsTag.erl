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
% import javax.servlet.jsp.tagext.TagSupport
% import admin.taghelpers.StoreFrontsHelperFactory
% import admin.taghelpers.StoreFrontsRequestHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('StoreFrontsTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TableTag':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'StoreFrontsHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'StoreFrontsRequestHelperFactory':new()).

% throws LicensingException
generateSelect(This) ->
        try
            AnyType = (fun(Target_N66018) -> (get({Target_N66018, '$class'})):getInstance(Target_N66018, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagHelperFactoryInterface(This)),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "generateSelect", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
install(This) ->
        try
            AnyType = (fun(Target_N66628) -> (get({Target_N66628, '$class'})):getInstance(Target_N66628, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagRequestHelperFactoryInterface(This)),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "install", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
sendStoreCreatedEmails(This) ->
        try
            AnyType = (fun(Target_N67238) -> (get({Target_N67238, '$class'})):getInstance(Target_N67238, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagRequestHelperFactoryInterface(This)),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "sendStoreCreatedEmails", undefined),
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
                    StoreFrontData = 'StoreFrontData':getInstance(),
                    case ((fun(Target_N67933) -> (get({Target_N67933, '$class'})):compareTo(Target_N67933, get({StoreFrontData, 'SELECT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (fun(Target_N68312) -> (get({Target_N68312, '$class'})):print(Target_N68312, (get({This, '$class'})):generateSelect(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                        false ->
                        case ((fun(Target_N67983) -> (get({Target_N67983, '$class'})):compareTo(Target_N67983, get({StoreFrontData, 'INSTALL'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (fun(Target_N68129) -> (get({Target_N68129, '$class'})):put(Target_N68129, "current", (get({This, '$class'})):getCurrent(This)) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                        (fun(Target_N68170) -> (get({Target_N68170, '$class'})):put(Target_N68170, "total", (get({This, '$class'})):getTotal(This)) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                        case ((fun(Target_N68215) -> (get({Target_N68215, '$class'})):intValue(Target_N68215) end)((get({This, '$class'})):getCurrent(This)) =:= (fun(Target_N68234) -> (get({Target_N68234, '$class'})):intValue(Target_N68234) end)((get({This, '$class'})):getTotal(This))) of
                            true ->
                            throw({'$return', get({'TagSupport', 'EVAL_BODY_INCLUDE'})});
                            false -> ok
                        end,
                        (get({This, '$class'})):install(This);
                        false ->
                        case ((fun(Target_N68033) -> (get({Target_N68033, '$class'})):compareTo(Target_N68033, get({StoreFrontData, 'INSTALL_COMPLETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (get({This, '$class'})):sendStoreCreatedEmails(This);
                        false ->
                        throw({'$return', 'TableTag':doStartTag(This)})
                    end
                    end
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            get({'StoreFrontsTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'StoreFrontsTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

