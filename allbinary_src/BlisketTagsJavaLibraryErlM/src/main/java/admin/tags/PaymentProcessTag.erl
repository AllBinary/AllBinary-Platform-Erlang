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
% import admin.taghelpers.PaymentProcessHelperFactory
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.StoreValidationTransformTag

-module('PaymentProcessTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'StoreValidationTransformTag':init(This),
    init_fields(This),
        ok.

% throws LicensingException, Exception
process(This) ->
        try
            AnyType = (fun(Target_N65879) -> (get({Target_N65879, '$class'})):getInstance(Target_N65879, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('PaymentProcessHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, get({get({This, commonStrings}), 'PROCESS'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LICENSINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "LicensingException", This, get({get({This, commonStrings}), 'PROCESS'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
            case ((((fun(Target_N66770) -> (get({Target_N66770, '$class'})):compareTo(Target_N66770, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEORDEREVALBODYONERROR'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) orelse ((fun(Target_N66841) -> (get({Target_N66841, '$class'})):compareTo(Target_N66841, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEORDERANDEVALBODY'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) orelse ((fun(Target_N66913) -> (get({Target_N66913, '$class'})):compareTo(Target_N66913, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEFORMEVALBODYONERROR'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) of
                true ->
                (fun(Target_N67023) -> (get({Target_N67023, '$class'})):print(Target_N67023, lists:concat([(get({This, '$class'})):process(This), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                case ((fun(Target_N67081) -> (get({Target_N67081, '$class'})):compareTo(Target_N67081, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEORDEREVALBODYONERROR'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    throw({'$return', get({This, 'SKIP_BODY'})});
                    false ->
                    throw({'$return', get({This, 'EVAL_BODY_INCLUDE'})})
                end;
                false ->
                erlang:error({'Exception', "No Such Payment Processing Command"})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'PaymentProcessTag', 'SKIP_BODY'})
        end.

