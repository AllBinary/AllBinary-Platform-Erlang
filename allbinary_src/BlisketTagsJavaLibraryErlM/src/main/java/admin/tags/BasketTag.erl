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
% import admin.taghelpers.BasketHelperFactory
% import admin.taghelpers.BasketRequestHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.user.commerce.inventory.basket.BasketData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.CustomTagSupport

-module('BasketTag').
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
isBasketEmpty(This) ->
        try
            AnyType = (fun(Target_N66265) -> (get({Target_N66265, '$class'})):getInstance(Target_N66265, get({This, propertiesHashMap}), get({This, pageContext})) end)('BasketHelperFactory':new()),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "isBasketEmpty", undefined),
            EmptyBoolean = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({EmptyBoolean, '$class'})):booleanValue(EmptyBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
addItemToBasket(This) ->
        try
            AnyType = (fun(Target_N66848) -> (get({Target_N66848, '$class'})):getInstance(Target_N66848, get({This, propertiesHashMap}), get({This, pageContext})) end)('BasketRequestHelperFactory':new()),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "addItemToBasket", undefined),
            EmptyBoolean = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({EmptyBoolean, '$class'})):booleanValue(EmptyBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
removeItemFromBasket(This) ->
        try
            AnyType = (fun(Target_N67462) -> (get({Target_N67462, '$class'})):getInstance(Target_N67462, get({This, propertiesHashMap}), get({This, pageContext})) end)('BasketRequestHelperFactory':new()),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "removeItemFromBasket", undefined),
            EmptyBoolean = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({EmptyBoolean, '$class'})):booleanValue(EmptyBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
adjustBasket(This) ->
        try
            AnyType = (fun(Target_N68076) -> (get({Target_N68076, '$class'})):getInstance(Target_N68076, get({This, propertiesHashMap}), get({This, pageContext})) end)('BasketRequestHelperFactory':new()),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "adjustBasket", undefined),
            EmptyBoolean = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({EmptyBoolean, '$class'})):booleanValue(EmptyBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
            case (get({This, command}) =/= undefined) of
                true ->
                put({This, propertiesHashMap}, (fun(Target_N68724) -> (get({Target_N68724, '$class'})):createHashMap(Target_N68724) end)('StdUtil':getInstance())),
                (get({get({This, propertiesHashMap}), '$class'})):put(get({This, propertiesHashMap}), get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
                case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({'BasketData', 'INSERT'})) =:= 0) of
                    true ->
                    case (not (get({This, '$class'})):addItemToBasket(This)) of
                        true ->
                        (fun(Target_N69139) -> (get({Target_N69139, '$class'})):println(Target_N69139, "Item is not currently being sold.<p/>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                        false -> ok
                    end;
                    false ->
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({'BasketData', 'DELETE'})) =:= 0) of
                    true ->
                    (get({This, '$class'})):removeItemFromBasket(This);
                    false ->
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({'BasketData', 'ADJUST'})) =:= 0) of
                    true ->
                    (get({This, '$class'})):adjustBasket(This);
                    false ->
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({'BasketData', 'ISEMPTY'})) =:= 0) of
                    true ->
                    case (get({This, '$class'})):isBasketEmpty(This) of
                        true ->
                        throw({'$return', get({This, 'EVAL_BODY_INCLUDE'})});
                        false ->
                        throw({'$return', get({'BasketTag', 'SKIP_BODY'})})
                    end;
                    false -> ok
                end
                end
                end
                end;
                false -> ok
            end,
            get({'BasketTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'BasketTag', 'SKIP_BODY'})
        end.

