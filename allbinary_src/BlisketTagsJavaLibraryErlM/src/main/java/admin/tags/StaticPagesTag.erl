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
% import admin.taghelpers.StaticPagesHelperFactory
% import admin.taghelpers.StaticPagesRequestHelperFactory
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchData
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.logic.visual.transform.info.TransformInfoData

-module('StaticPagesTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, xslFile}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'TableTag':init(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'StaticPagesHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'StaticPagesRequestHelperFactory':new()).

setXsl(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, xslFile}, Value).

% throws LicensingException
generateStaticPages(This) ->
        try
            AnyType = (fun(Target_N66126) -> (get({Target_N66126, '$class'})):getInstance(Target_N66126, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('StaticPagesRequestHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "generateStaticPages", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
makePublic(This) ->
        try
            AnyType = (fun(Target_N66779) -> (get({Target_N66779, '$class'})):getInstance(Target_N66779, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('StaticPagesRequestHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "makePublic", undefined),
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
                    case ((fun(Target_N67470) -> (get({Target_N67470, '$class'})):compareTo(Target_N67470, get({'SearchData', 'GENERATESTATICPAGES'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (fun(Target_N67862) -> (get({Target_N67862, '$class'})):put(Target_N67862, get({'TransformInfoData':getInstance(), 'TEMPLATEFILENAME'}), get({This, xslFile})) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                        put({local, output}, (get({This, '$class'})):generateStaticPages(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N68139) -> (get({Target_N68139, '$class'})):print(Target_N68139, get({local, output})) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end;
                        false ->
                        case ((fun(Target_N67520) -> (get({Target_N67520, '$class'})):compareTo(Target_N67520, get({'SearchData', 'MAKEPUBLIC'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):makePublic(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N67809) -> (get({Target_N67809, '$class'})):print(Target_N67809, get({local, output})) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
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
            get({'StaticPagesTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'StaticPagesTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

