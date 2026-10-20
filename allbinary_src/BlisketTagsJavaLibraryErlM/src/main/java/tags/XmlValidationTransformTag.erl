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
% package tags
% import java.lang.reflect.Method
% import javax.servlet.jsp.JspTagException
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('XmlValidationTransformTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TransformTag':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
isValid(This) ->
        try
            HelperClass = get({(get({This, '$class'})):getHelper(This), '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, get({get({This, commonStrings}), 'IS_VALID'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, (get({This, '$class'})):getHelper(This), undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            (get({This, '$class'})):setHelper(This),
            case (get({This, '$class'})):isValid(This) of
                true ->
                'TransformTag':doStartTag(This),
                throw({'$return', get({This, 'EVAL_BODY_INCLUDE'})});
                false ->
                'TransformTag':doStartTag(This),
                throw({'$return', get({This, 'SKIP_BODY'})})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'XmlValidationTransformTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

