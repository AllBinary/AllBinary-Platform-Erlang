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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.JspTagException
% import javax.servlet.jsp.tagext.TagSupport
% import admin.taghelpers.AuthenticationHelperFactory
% import admin.taghelpers.AuthenticationRequestHelperFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.CustomTagSupport

-module('AuthenticationTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTagSupport', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, command}, undefined),
    put({This, userName}, undefined),
    put({This, password}, undefined),
    put({This, newPassword}, undefined),
    put({This, roles}, undefined),
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
        StringUtil = 'StringUtil':getInstance(),
        put({This, userName}, get({StringUtil, 'EMPTY_STRING'})),
        put({This, password}, get({StringUtil, 'EMPTY_STRING'})).

setCommand(This, Command) when (is_list(Command) orelse Command =:= undefined) ->
        put({This, command}, Command).

setUserName(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        put({This, userName}, UserName).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, password}, Value).

setNewPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, newPassword}, Value).

setRoles(This, Values) ->
        put({This, roles}, Values).

% throws LicensingException
changePassword(This) ->
        try
            AnyType = (fun(Target_N66825) -> (get({Target_N66825, '$class'})):getInstance(Target_N66825, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationRequestHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "changePassword", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
newPassword(This) ->
        try
            AnyType = (fun(Target_N67443) -> (get({Target_N67443, '$class'})):getInstance(Target_N67443, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationRequestHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "newPassword", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
invalidateSession(This) ->
        try
            AnyType = (fun(Target_N68061) -> (get({Target_N68061, '$class'})):getInstance(Target_N68061, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "invalidateSession", undefined),
            ResultInteger = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({ResultInteger, '$class'})):intValue(ResultInteger)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
isSessionOld(This) ->
        try
            AnyType = (fun(Target_N68691) -> (get({Target_N68691, '$class'})):getInstance(Target_N68691, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "isSessionOld", undefined),
            ResultBoolean = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({ResultBoolean, '$class'})):booleanValue(ResultBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
isRoleValid(This) ->
        try
            AnyType = (fun(Target_N69309) -> (get({Target_N69309, '$class'})):getInstance(Target_N69309, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationRequestHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            MethodParams = array:from_list([get({get({This, userName}), '$class'}), get({get({This, password}), '$class'}), get({get({This, roles}), '$class'})]),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "isRoleValid", MethodParams),
            MethodArgs = array:from_list([get({This, userName}), get({This, password}), get({This, roles})]),
            ResultBoolean = (get({Method, '$class'})):invoke(Method, AnyType, MethodArgs),
            (get({ResultBoolean, '$class'})):booleanValue(ResultBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
validRole(This) ->
        try
            AnyType = (fun(Target_N70105) -> (get({Target_N70105, '$class'})):getInstance(Target_N70105, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "validRole", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
invalidRole(This) ->
        try
            AnyType = (fun(Target_N70754) -> (get({Target_N70754, '$class'})):getInstance(Target_N70754, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "invalidRole", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
isAuthenticationSessionValid(This) ->
        try
            AnyType = (fun(Target_N71403) -> (get({Target_N71403, '$class'})):getInstance(Target_N71403, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            MethodParams = array:from_list([get({get({This, roles}), '$class'})]),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "isAuthenticationSessionValid", MethodParams),
            MethodArgs = array:from_list([get({This, roles})]),
            ResultBoolean = (get({Method, '$class'})):invoke(Method, AnyType, MethodArgs),
            (get({ResultBoolean, '$class'})):booleanValue(ResultBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
processIfNewLogin(This) ->
        try
            AnyType = (fun(Target_N72139) -> (get({Target_N72139, '$class'})):getInstance(Target_N72139, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationHelperFactory':new()),
            HelperClass = get({AnyType, '$class'}),
            MethodParams = array:from_list([get({get({This, userName}), '$class'}), get({get({This, password}), '$class'})]),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "processIfNewLogin", MethodParams),
            MethodArgs = array:from_list([get({This, userName}), get({This, password})]),
            ResultBoolean = (get({Method, '$class'})):invoke(Method, AnyType, MethodArgs),
            (get({ResultBoolean, '$class'})):booleanValue(ResultBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws LicensingException
processInvalidation(This) ->
        try
            AnyType = (fun(Target_N72905) -> (get({Target_N72905, '$class'})):getInstance(Target_N72905, get({This, propertiesHashMap}), get({This, pageContext})) end)('AuthenticationHelperFactory':new()),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "processInvalidation", undefined),
            ResultBoolean = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            (get({ResultBoolean, '$class'})):booleanValue(ResultBoolean)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            StringUtil = 'StringUtil':getInstance(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                true ->
                Request = (get({get({This, pageContext}), '$class'})):getRequest(get({This, pageContext})),
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Request URI: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({Request, '$class'})):getRequestURI(Request)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                false -> ok
            end,
            case (get({This, command}) =/= undefined) of
                true ->
                put({This, propertiesHashMap}, (fun(Target_N74005) -> (get({Target_N74005, '$class'})):createHashMap(Target_N74005) end)('StdUtil':getInstance())),
                case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NEWPASSWORD'})) =:= 0) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New Password", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                        false -> ok
                    end,
                    case (not (get({This, '$class'})):newPassword(This)) of
                        true ->
                        (fun(Target_N78500) -> (get({Target_N78500, '$class'})):print(Target_N78500, "New Password Request Failed.<p/>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                        throw({'$return', get({'AuthenticationTag', 'EVAL_BODY_INCLUDE'})});
                        false ->
                        (fun(Target_N78446) -> (get({Target_N78446, '$class'})):print(Target_N78446, "New Password Was Sent.<p/>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                        throw({'$return', get({'AuthenticationTag', 'SKIP_BODY'})})
                    end;
                    false ->
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'CHANGEPASSWORD'})) =:= 0) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Change Password", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                        false -> ok
                    end,
                    case (not (get({This, '$class'})):changePassword(This)) of
                        true ->
                        (fun(Target_N78141) -> (get({Target_N78141, '$class'})):print(Target_N78141, "Password Change Attempt Failed.<p/>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                        throw({'$return', get({'AuthenticationTag', 'EVAL_BODY_INCLUDE'})});
                        false ->
                        (fun(Target_N78087) -> (get({Target_N78087, '$class'})):print(Target_N78087, "Password Changed Successfully.<p/>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                        throw({'$return', get({'AuthenticationTag', 'SKIP_BODY'})})
                    end;
                    false ->
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({'WeblisketSessionData', 'INVALIDATESESSION'})) =:= 0) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "INVALIDATESESSION", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                        false -> ok
                    end,
                    throw({'$return', (get({This, '$class'})):invalidateSession(This)});
                    false ->
                    case (get({This, '$class'})):isSessionOld(This) of
                        true ->
                        case (get({This, '$class'})):processInvalidation(This) of
                            true ->
                            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                                true ->
                                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Processing Invalidation", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                                false -> ok
                            end,
                            (fun(Target_N74865) -> (get({Target_N74865, '$class'})):print(Target_N74865, "Please login again.<p>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                            case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                                true ->
                                throw({'$return', get({'TagSupport', 'SKIP_BODY'})});
                                false ->
                                throw({'$return', get({'TagSupport', 'EVAL_BODY_INCLUDE'})})
                            end;
                            false ->
                            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                                true ->
                                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Preparing session for invalidation", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                                false -> ok
                            end,
                            case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                                true ->
                                throw({'$return', get({'TagSupport', 'SKIP_BODY'})});
                                false ->
                                throw({'$return', get({'TagSupport', 'EVAL_BODY_INCLUDE'})})
                            end
                        end;
                        false -> ok
                    end,
                    case ((((((get({This, userName}) =:= undefined) orelse ((get({get({This, userName}), '$class'})):compareTo(get({This, userName}), get({StringUtil, 'EMPTY_STRING'})) =:= 0))) andalso (((get({This, password}) =:= undefined) orelse ((get({get({This, password}), '$class'})):compareTo(get({This, password}), get({StringUtil, 'EMPTY_STRING'})) =:= 0)))) andalso (get({This, roles}) =/= undefined)) andalso (get({This, '$class'})):isAuthenticationSessionValid(This)) of
                        true ->
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Authenticated session is valid", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                            false -> ok
                        end,
                        case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                            true ->
                            throw({'$return', get({'TagSupport', 'EVAL_BODY_INCLUDE'})});
                            false ->
                            throw({'$return', get({'TagSupport', 'SKIP_BODY'})})
                        end;
                        false -> ok
                    end,
                    case (((get({This, userName}) =/= undefined) andalso (get({This, password}) =/= undefined)) andalso (get({This, '$class'})):processIfNewLogin(This)) of
                        true ->
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Processing new login.", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                            false -> ok
                        end,
                        case (get({This, '$class'})):isRoleValid(This) of
                            true ->
                            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                                true ->
                                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Role is valid - Processing new login", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                                false -> ok
                            end,
                            (fun(Target_N76946) -> (get({Target_N76946, '$class'})):print(Target_N76946, (get({This, '$class'})):validRole(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                            case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                                true ->
                                throw({'$return', get({'AuthenticationTag', 'EVAL_BODY_INCLUDE'})});
                                false ->
                                throw({'$return', get({'AuthenticationTag', 'SKIP_BODY'})})
                            end;
                            false ->
                            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                                true ->
                                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Role is not valid - Processing new login", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                                false -> ok
                            end,
                            (fun(Target_N76564) -> (get({Target_N76564, '$class'})):print(Target_N76564, (get({This, '$class'})):invalidRole(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                            case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                                true ->
                                throw({'$return', get({'AuthenticationTag', 'SKIP_BODY'})});
                                false ->
                                throw({'$return', get({'AuthenticationTag', 'EVAL_BODY_INCLUDE'})})
                            end
                        end;
                        false ->
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Invalid Login", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                            false -> ok
                        end,
                        case ((((get({This, userName}) =/= undefined) andalso ((get({get({This, userName}), '$class'})):compareTo(get({This, userName}), get({StringUtil, 'EMPTY_STRING'})) =/= 0)) andalso (get({This, password}) =/= undefined)) andalso ((get({get({This, password}), '$class'})):compareTo(get({This, password}), get({StringUtil, 'EMPTY_STRING'})) =/= 0)) of
                            true ->
                            (fun(Target_N76054) -> (get({Target_N76054, '$class'})):print(Target_N76054, "Sorry your username and/or password is invalid.<p/>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end
                    end,
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N77295) -> (get({Target_N77295, '$class'})):toString(Target_N77295) end)((fun(Target_N77302) -> (get({Target_N77302, '$class'})):append(Target_N77302, get({This, command})) end)((fun(Target_N77309) -> (get({Target_N77309, '$class'})):append(Target_N77309, " Command: ") end)((fun(Target_N77316) -> (get({Target_N77316, '$class'})):append(Target_N77316, get({This, password})) end)((fun(Target_N77323) -> (get({Target_N77323, '$class'})):append(Target_N77323, " Password: ") end)((fun(Target_N77330) -> (get({Target_N77330, '$class'})):append(Target_N77330, get({This, userName})) end)((fun(Target_N77337) -> (get({Target_N77337, '$class'})):append(Target_N77337, "Major authentication error - userName: ") end)('StringMaker':new()))))))), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                        false -> ok
                    end,
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                        true ->
                        throw({'$return', get({'TagSupport', 'SKIP_BODY'})});
                        false ->
                        throw({'$return', get({'TagSupport', 'EVAL_BODY_INCLUDE'})})
                    end
                end
                end
                end;
                false -> ok
            end,
            get({'AuthenticationTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'AuthenticationTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

