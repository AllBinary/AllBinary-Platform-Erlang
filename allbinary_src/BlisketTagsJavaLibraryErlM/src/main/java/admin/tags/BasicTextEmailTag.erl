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
% import admin.taghelpers.BasicTextEmailHelperFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import tags.CustomTagSupport

-module('BasicTextEmailTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTagSupport', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, subject}, undefined),
    put({This, body}, undefined),
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

setSubject(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, subject}, Value).

setBody(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, body}, Value).

send(This) ->
        try
            PropertiesHashMap = (fun(Target_N66090) -> (get({Target_N66090, '$class'})):createHashMap(Target_N66090) end)('StdUtil':getInstance()),
            (get({PropertiesHashMap, '$class'})):put(PropertiesHashMap, "Subject", get({This, subject})),
            (get({PropertiesHashMap, '$class'})):put(PropertiesHashMap, "Body", get({This, body})),
            AnyType = (fun(Target_N66217) -> (get({Target_N66217, '$class'})):getInstance(Target_N66217, PropertiesHashMap, get({This, pageContext})) end)('BasicTextEmailHelperFactory':new()),
            Method = (get({get({AnyType, '$class'}), '$class'})):getMethod(get({AnyType, '$class'}), "send", undefined),
            (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            "Email Sent"
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to Send Email.",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "send()", E);
                false -> ok
            end,
            Error
        end.

% throws JspTagException
doStartTag(This) ->
        try
            (fun(Target_N66730) -> (get({Target_N66730, '$class'})):print(Target_N66730, (get({This, '$class'})):send(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
            get({'BasicTextEmailTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'BasicTextEmailTag', 'SKIP_BODY'})
        end.

