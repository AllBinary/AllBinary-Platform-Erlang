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
% package admin.taghelpers
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import javax.servlet.jsp.tagext.TagSupport
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.role.BasicUserRole
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.business.user.role.UserRoleFactory
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.data.tables.user.UserEntityInterface
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.java.bool.BooleanUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('AuthenticationHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, authenticated}, undefined),
    put({This, sessionUserName}, undefined),
    put({This, role}, undefined),
    put({This, timeout}, undefined),
    put({This, attemptsInteger}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This;
new(HashMap, HttpServletRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, HttpServletRequest),
    This.

'$init'(This, HashMap, PageContext) ->
        '$init'(This, HashMap, (get({PageContext, '$class'})):getRequest(PageContext));
'$init'(This, HashMap, HttpServletRequest) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        put({This, weblisketSession}, 'WeblisketSession':new(HashMap, HttpServletRequest)),
        (get({This, '$class'})):getFormData(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATION'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):outputSessionInfo(This), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.


% throws Exception
getFormData(This) ->
        put({This, authenticated}, (get({get({This, weblisketSession}), '$class'})):getAuthentication(get({This, weblisketSession}))),
        put({This, sessionUserName}, (get({get({This, weblisketSession}), '$class'})):getUserName(get({This, weblisketSession}))),
        put({This, role}, (get({get({This, weblisketSession}), '$class'})):getRole(get({This, weblisketSession}))),
        put({This, attemptsInteger}, (get({get({This, weblisketSession}), '$class'})):getAttempts(get({This, weblisketSession}))),
        put({This, timeout}, (get({get({This, weblisketSession}), '$class'})):getTimeout(get({This, weblisketSession}))).

% throws Exception
invalidateSession(This) ->
        try
            (get({get({This, weblisketSession}), '$class'})):clear(get({This, weblisketSession})),
            get({'TagSupport', 'EVAL_BODY_INCLUDE'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "invalidateSession()", E);
                false -> ok
            end,
            undefined
        end.

isSessionOld(This) ->
        try
        case (get({This, role}) =/= undefined) of
            true ->
            TimeCreated = (get({get({This, weblisketSession}), '$class'})):getCreationTime(get({This, weblisketSession})),
            SessionTimout = (get({get({This, role}), '$class'})):getSessionTimeout(get({This, role})),
            Calendar = 'Calendar':getInstance(),
            TimeFirst = ((get({Calendar, '$class'})):getTimeInMillis(Calendar) - SessionTimout),
            case (TimeFirst > TimeCreated) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATION'})) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Session Is Old - Timeout: "),
                    (get({StringBuffer, '$class'})):appendlong(StringBuffer, SessionTimout),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " Eval: "),
                    (get({StringBuffer, '$class'})):appendlong(StringBuffer, TimeFirst),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " > "),
                    (get({StringBuffer, '$class'})):appendlong(StringBuffer, TimeCreated),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "isSessionOld()");
                    false -> ok
                end,
                throw({'$return', true});
                false -> ok
            end;
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATION'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Role Is Not In Session", This, "isSessionOld()");
                false -> ok
            end
        end,
        (get({This, '$class'})):isRarelyUsedSession(This)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isRarelyUsedSession(This) ->
        case (get({This, role}) =/= undefined) of
            true ->
            TimeCreated = (get({get({This, weblisketSession}), '$class'})):getCreationTime(get({This, weblisketSession})),
            LastAccess = (get({get({This, weblisketSession}), '$class'})):getLastAccessedTime(get({This, weblisketSession})),
            InactivityAllowed = (get({get({This, role}), '$class'})):getSessionInactivityTimeout(get({This, role})),
            Calendar = 'Calendar':getInstance(),
            TimeFirst = ((get({Calendar, '$class'})):getTimeInMillis(Calendar) - LastAccess),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATION'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Session Is Rarely Used - Timeout: "),
                (get({StringBuffer, '$class'})):appendlong(StringBuffer, LastAccess),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Eval: "),
                (get({StringBuffer, '$class'})):appendlong(StringBuffer, TimeFirst),
                (get({StringBuffer, '$class'})):append(StringBuffer, " > "),
                (get({StringBuffer, '$class'})):appendlong(StringBuffer, InactivityAllowed),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "isRarelyUsedSession()");
                false -> ok
            end;
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATION'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Role Is Not In Session", This, "isRarelyUsedSession()");
                false -> ok
            end
        end,
        false.

validRole(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Trying New login<p/>"),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to set valid role",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "validRole()", E);
                false -> ok
            end,
            Error
        end.

invalidRole(This) ->
        try
            (get({get({This, weblisketSession}), '$class'})):setAuthenticated(get({This, weblisketSession}), false),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Sorry your username and password is invalid on this page. "),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Trying New login<p/>"),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to set role invalid",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "invalidRole()", E);
                false -> ok
            end,
            Error
        end.

% throws Exception
isAuthenticated(This) ->
        try
        case (fun(Target_N70389) -> (get({Target_N70389, '$class'})):getFromString(Target_N70389, get({This, authenticated})) end)('BooleanUtil':getInstance()) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isAuthenticationSessionValid(This, Roles) ->
        try
        try
            case (get({This, role}) =/= undefined) of
                true ->
                case (get({This, '$class'})):isAuthenticated(This) of
                    true ->
                    case (get({This, sessionUserName}) =/= undefined) of
                        true ->
                        BasicUserRole = (get({get({This, role}), '$class'})):getBasicUserRole(get({This, role})),
                        BasicUserRoleArray = (get({Roles, '$class'})):toArray(Roles),
                        Size = array:size(BasicUserRoleArray),
                        lists:foreach(fun(Index) ->
                            MustBeOfRole = array:get(Index, BasicUserRoleArray),
                            case (get({BasicUserRole, '$class'})):equals(BasicUserRole, MustBeOfRole) of
                                true ->
                                case (get({BasicUserRole, '$class'})):equals(BasicUserRole, get({'UserRoleFactory':getInstance(), 'CUSTOMER'})) of
                                    true ->
                                    UserEntityInterface = 'UserEntityFactory':getInstance(),
                                    UserInterface = (get({UserEntityInterface, '$class'})):getUser(UserEntityInterface, get({This, sessionUserName})),
                                    case (not (fun(Target_N71201) -> (get({Target_N71201, '$class'})):booleanValue(Target_N71201) end)((get({UserInterface, '$class'})):isSessionValid(UserInterface))) of
                                        true ->
                                        throw({'$return', false});
                                        false -> ok
                                    end;
                                    false -> ok
                                end,
                                throw({'$return', true});
                                false -> ok
                            end
                        end, lists:seq(0, Size - 1));
                        false -> ok
                    end,
                    throw({'$return', false});
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATION'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Role Is Not In Session", This, "isAuthenticationSessionValid()");
                    false -> ok
                end
            end,
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "isAuthenticatedSessionValid()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

nextAttempt(This) ->
        case ((get({This, attemptsInteger}) =/= undefined) andalso ((get({get({This, attemptsInteger}), '$class'})):intValue(get({This, attemptsInteger})) > 0)) of
            true ->
            (get({get({This, weblisketSession}), '$class'})):setAttempts(get({This, weblisketSession}), ((get({get({This, attemptsInteger}), '$class'})):intValue(get({This, attemptsInteger})) + 1));
            false ->
            (get({get({This, weblisketSession}), '$class'})):setAttempts(get({This, weblisketSession}), 1)
        end.

processIfNewLogin(This, UserName, Password) when (is_list(UserName) orelse UserName =:= undefined), (is_list(Password) orelse Password =:= undefined) ->
        try
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Starting: ", UserName]), This, "processIfNewLogin()");
                false -> ok
            end,
            case ((((UserName =/= undefined) andalso ((get({UserName, '$class'})):compareTo(UserName, get({'StringUtil':getInstance(), 'EMPTY_STRING'})) =/= 0)) andalso (Password =/= undefined)) andalso ((get({Password, '$class'})):compareTo(Password, get({'StringUtil':getInstance(), 'EMPTY_STRING'})) =/= 0)) of
                true ->
                put({local, login}, undefined),
                UserEntityInterface = 'UserEntityFactory':getInstance(),
                put({local, login}, (get({UserEntityInterface, '$class'})):login(UserEntityInterface, UserName, Password)),
                case ((get({get({local, login}), '$class'})):compareTo(get({local, login}), get({get({'AuthenticationHelper', 'GLOBALS2'}), 'LOGINSUCCESS'})) =:= 0) of
                    true ->
                    UserInterface = (get({UserEntityInterface, '$class'})):getUser(UserEntityInterface, UserName),
                    case (fun(Target_N72572) -> (get({Target_N72572, '$class'})):booleanValue(Target_N72572) end)((get({UserInterface, '$class'})):isSessionValid(UserInterface)) of
                        true ->
                        (get({get({This, weblisketSession}), '$class'})):setAttempts(get({This, weblisketSession}), 0),
                        throw({'$return', true});
                        false -> ok
                    end;
                    false -> ok
                end,
                (get({This, '$class'})):nextAttempt(This),
                throw({'$return', false});
                false -> ok
            end,
            (get({This, '$class'})):nextAttempt(This),
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processIfNewLogin()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

processInvalidation(This) ->
        try
        try
            case (fun(Target_N73115) -> (get({Target_N73115, '$class'})):getFromString(Target_N73115, get({This, timeout})) end)('BooleanUtil':getInstance()) of
                true ->
                (get({This, '$class'})):invalidateSession(This),
                throw({'$return', true});
                false -> ok
            end,
            begin
                (get({get({This, weblisketSession}), '$class'})):setTimeout(get({This, weblisketSession}), get({'BooleanFactory':getInstance(), 'TRUE_STRING'})),
                false
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processInvalidation()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

outputSessionInfo(This) ->
        try
            Calendar = 'Calendar':getInstance(),
            TimeCreated = (get({get({This, weblisketSession}), '$class'})):getCreationTime(get({This, weblisketSession})),
            StringBuffer = 'StringMaker':new(),
            LastAccess = (get({get({This, weblisketSession}), '$class'})):getLastAccessedTime(get({This, weblisketSession})),
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Time Since Last Access: ", (((get({Calendar, '$class'})):getTimeInMillis(Calendar) - LastAccess))]), "<br/>\n"])),
            case (get({This, role}) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Auth: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, authenticated})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " UserName: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, sessionUserName})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Role: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, role}), '$class'})):toString(get({This, role}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>\n"),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Time Left: "),
                (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc((((get({get({This, role}), '$class'})):getSessionTimeout(get({This, role})) - (((get({Calendar, '$class'})):getTimeInMillis(Calendar) - TimeCreated)))))),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>\n"),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Inactivity Time Allowed: "),
                (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc((get({get({This, role}), '$class'})):getSessionTimeout(get({This, role})))),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>\n"),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Inactivity Time Allowed: "),
                (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc((get({get({This, role}), '$class'})):getSessionInactivityTimeout(get({This, role})))),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>\n");
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Role Is Not Set<br/>\n")
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            "Error"
        end.

getRole(This) ->
        get({This, role}).

