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
% import admin.taghelpers.PaymentGatewayHelperFactory
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('PaymentGatewayTag').
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
        (get({This, '$class'})):setTagHelperFactory(This, 'PaymentGatewayHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'PaymentGatewayHelperFactory':new()).

% throws LicensingException, Exception
process(This) ->
        try
            AnyType = (fun(Target_N65928) -> (get({Target_N65928, '$class'})):getInstance(Target_N65928, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)('PaymentGatewayHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, get({get({This, commonStrings}), 'PROCESS'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "LicensingException", This, get({get({This, commonStrings}), 'PROCESS'}), E),
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({This, '$class'})):isEnabled(This) of
                true ->
                case ((((fun(Target_N66664) -> (get({Target_N66664, '$class'})):compareTo(Target_N66664, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEORDEREVALBODYONERROR'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) orelse ((fun(Target_N66735) -> (get({Target_N66735, '$class'})):compareTo(Target_N66735, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEORDERANDEVALBODY'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) orelse ((fun(Target_N66807) -> (get({Target_N66807, '$class'})):compareTo(Target_N66807, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEFORMEVALBODYONERROR'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) of
                    true ->
                    Output = (get({This, '$class'})):process(This),
                    begin
                        (fun(Target_N66956) -> (get({Target_N66956, '$class'})):print(Target_N66956, lists:concat([Output, "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})))
                    end,
                    case ((fun(Target_N67013) -> (get({Target_N67013, '$class'})):compareTo(Target_N67013, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEORDEREVALBODYONERROR'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        throw({'$return', get({This, 'SKIP_BODY'})});
                        false ->
                        throw({'$return', get({This, 'EVAL_BODY_INCLUDE'})})
                    end;
                    false ->
                    throw({'$return', 'TableTag':doStartTag(This)})
                end;
                false -> ok
            end,
            get({'PaymentGatewayTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'PaymentGatewayTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

