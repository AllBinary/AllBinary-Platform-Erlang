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
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.JspTagException
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.LicensingException
% import taghelpers.ValidatedViewHelperFactory

-module('ValidationTransformTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, xslFile}, undefined),
    put({This, logic}, false),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'TransformTag':'$init'(This, 'ValidatedViewHelperFactory':new()),
        init_fields(This),
        put({This, logic}, true).

setXsl(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, xslFile}, Value),
        (get({This, '$class'})):setTemplateFile(This, get({This, xslFile})).

setLogic(This, Logic) when is_boolean(Logic) ->
        put({This, logic}, Logic).

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

% throws Exception
validationInfo(This) ->
        try
            AddressHelperClass = get({(get({This, '$class'})):getHelper(This), '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "validationInfo", undefined),
            Result = (get({Method, '$class'})):invoke(Method, (get({This, '$class'})):getHelper(This), undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "validationInfo()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                Request = (get({get({This, pageContext}), '$class'})):getRequest(get({This, pageContext})),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "ValidationViewTag Start For: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({This, '$class'})):getName(This)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nView FIle: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({This, '$class'})):getObjectFile(This)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nRequest URI: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({Request, '$class'})):getRequestURI(Request)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                false -> ok
            end,
            (get({This, '$class'})):setHelper(This),
            case (get({This, '$class'})):isValid(This) of
                true ->
                'TransformTag':doStartTag(This),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "View File: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({This, '$class'})):getObjectFile(This)),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nLogic includes body if true="),
                    (get({get({local, stringBuffer}), '$class'})):appendboolean(get({local, stringBuffer}), get({This, logic})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                    false -> ok
                end,
                case get({This, logic}) of
                    true ->
                    throw({'$return', get({'ValidationTransformTag', 'EVAL_BODY_INCLUDE'})});
                    false ->
                    throw({'$return', get({'ValidationTransformTag', 'SKIP_BODY'})})
                end;
                false ->
                (fun(Target_N67785) -> (get({Target_N67785, '$class'})):print(Target_N67785, (get({This, '$class'})):validationInfo(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "View File: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({This, '$class'})):getObjectFile(This)),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nisValid()=false"),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nLogic skips body if true="),
                    (get({get({local, stringBuffer}), '$class'})):appendboolean(get({local, stringBuffer}), get({This, logic})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                    false -> ok
                end,
                case get({This, logic}) of
                    true ->
                    throw({'$return', get({'ValidationTransformTag', 'SKIP_BODY'})});
                    false ->
                    throw({'$return', get({'ValidationTransformTag', 'EVAL_BODY_INCLUDE'})})
                end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'ValidationTransformTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

doEndTag(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Tag Ended", This, "doEndTag");
            false -> ok
        end,
        put({This, logic}, true),
        'TransformTag':doEndTag(This).

