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
% package tags.generic.inventory
% import java.lang.reflect.Method
% import javax.servlet.jsp.JspTagException
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import taghelpers.InventoryHelperFactory
% import tags.StoreValidationTransformTag

-module('InventoryTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'StoreValidationTransformTag':'$init'(This),
        init_fields(This).

% throws LicensingException
search(This) ->
        try
            AnyType = (fun(Target_N65891) -> (get({Target_N65891, '$class'})):getInstance(Target_N65891, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('InventoryHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "search", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (fun(Target_N66120) -> (get({Target_N66120, '$class'})):print(Target_N66120, Result) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
viewSummary(This) ->
        try
            AnyType = (fun(Target_N66916) -> (get({Target_N66916, '$class'})):getInstance(Target_N66916, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('InventoryHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "viewSummary", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (fun(Target_N67145) -> (get({Target_N67145, '$class'})):print(Target_N67145, Result) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N67964) -> (get({Target_N67964, '$class'})):compareTo(Target_N67964, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'SEARCH'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Search Inventory View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.inventory.AutoSearchValidationInventoryView"),
                    (get({This, '$class'})):search(This),
                    throw({'$return', get({'InventoryTag', 'EVAL_BODY_INCLUDE'})});
                    false ->
                    case ((fun(Target_N68038) -> (get({Target_N68038, '$class'})):compareTo(Target_N68038, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEWSUMMARY'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Inventory View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.inventory.AutoValidationInventoryView"),
                    (get({This, '$class'})):viewSummary(This),
                    throw({'$return', get({'InventoryTag', 'EVAL_BODY_INCLUDE'})});
                    false ->
                    case ((fun(Target_N68112) -> (get({Target_N68112, '$class'})):compareTo(Target_N68112, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Basic Inventory View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.inventory.AutoValidationInventoryView"),
                    throw({'$return', 'StoreValidationTransformTag':doStartTag(This)});
                    false ->
                    erlang:error({'Exception', lists:concat(["No Such View Command: ", (get({This, '$class'})):getCommand(This)])})
                end
                end
                end;
                false -> ok
            end,
            erlang:error({'Exception', "Command Null"})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'InventoryTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

