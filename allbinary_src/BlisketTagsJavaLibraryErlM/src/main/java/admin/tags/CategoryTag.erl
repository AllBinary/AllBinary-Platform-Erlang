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
% import admin.taghelpers.CategoryHelperFactory
% import admin.taghelpers.CategoryRequestHelperFactory
% import org.allbinary.business.category.CategoryData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.logic.visual.transform.info.TransformInfoData

-module('CategoryTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, xsl}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TableTag':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'CategoryHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'CategoryRequestHelperFactory':new()).

setXsl(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, xsl}, Value).

% throws LicensingException
viewCategory(This) ->
        try
            AnyType = (fun(Target_N66121) -> (get({Target_N66121, '$class'})):getInstance(Target_N66121, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('CategoryRequestHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "viewCategory", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
viewCategories(This) ->
        try
            AnyType = (fun(Target_N66770) -> (get({Target_N66770, '$class'})):getInstance(Target_N66770, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('CategoryRequestHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "viewCategories", undefined),
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
                    (fun(Target_N67457) -> (get({Target_N67457, '$class'})):put(Target_N67457, get({'TransformInfoData':getInstance(), 'TEMPLATEFILENAME'}), get({This, xsl})) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                    case ((fun(Target_N67522) -> (get({Target_N67522, '$class'})):compareTo(Target_N67522, get({'CategoryData':getInstance(), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):viewCategory(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N68129) -> (get({Target_N68129, '$class'})):print(Target_N68129, get({local, output})) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end;
                        false ->
                        case ((fun(Target_N67580) -> (get({Target_N67580, '$class'})):compareTo(Target_N67580, get({'CategoryData':getInstance(), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):viewCategories(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N67870) -> (get({Target_N67870, '$class'})):print(Target_N67870, get({local, output})) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end;
                        false ->
                        throw({'$return', 'TableTag':doStartTag(This)})
                    end
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            get({'CategoryTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'CategoryTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

