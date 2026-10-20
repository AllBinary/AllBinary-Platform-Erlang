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
% import java.util.Calendar
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.JspTagException
% import javax.servlet.jsp.tagext.TagSupport
% import org.allbinary.business.init.InstallerInfo
% import org.allbinary.business.user.role.BasicUserRole
% import org.allbinary.business.user.role.BasicUserRoleFactory
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.http.request.session.BasicWeblisketSession
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.java.bool.BooleanUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.CustomTagSupport

-module('FileAuthenticationTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTagSupport', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, attemptsInteger}, undefined),
    put({This, weblisketSession}, undefined),
    put({This, request}, undefined),
    put({This, command}, undefined),
    put({This, userName}, undefined),
    put({This, password}, undefined),
    put({This, newPassword}, undefined),
    put({This, authenticated}, undefined),
    put({This, sessionUserName}, undefined),
    put({This, role}, undefined),
    put({This, timeout}, undefined),
    put({This, roles}, undefined),
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

makeSessionValid(This, StoredRole, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        (get({get({This, weblisketSession}), '$class'})):setAuthenticated(get({This, weblisketSession})),
        (get({get({This, weblisketSession}), '$class'})):setRole(get({This, weblisketSession}), StoredRole),
        (get({get({This, weblisketSession}), '$class'})):setUserName(get({This, weblisketSession}), UserName),
        (get({get({This, request}), '$class'})):removeAttribute(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEUSERNAME'})),
        (get({get({This, request}), '$class'})):removeAttribute(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEPASSWORD'})).

getFormData(This) ->
        put({This, authenticated}, (get({get({This, weblisketSession}), '$class'})):getAuthentication(get({This, weblisketSession}))),
        put({This, sessionUserName}, (get({get({This, weblisketSession}), '$class'})):getUserName(get({This, weblisketSession}))),
        put({This, role}, (get({get({This, weblisketSession}), '$class'})):getRole(get({This, weblisketSession}))),
        put({This, attemptsInteger}, (get({get({This, weblisketSession}), '$class'})):getAttempts(get({This, weblisketSession}))),
        put({This, timeout}, (get({get({This, weblisketSession}), '$class'})):getTimeout(get({This, weblisketSession}))).

nextAttempt(This) ->
        case ((get({This, attemptsInteger}) =/= undefined) andalso ((get({get({This, attemptsInteger}), '$class'})):intValue(get({This, attemptsInteger})) > 0)) of
            true ->
            (get({get({This, weblisketSession}), '$class'})):setAttempts(get({This, weblisketSession}), ((get({get({This, attemptsInteger}), '$class'})):intValue(get({This, attemptsInteger})) + 1));
            false ->
            (get({get({This, weblisketSession}), '$class'})):setAttempts(get({This, weblisketSession}), 1)
        end.

% throws LicensingException
changePassword(This) ->
        try
        try
            UserName = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEUSERNAME'})),
            Password = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEPASSWORD'})),
            NewPassword = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLENEWPASSWORD'})),
            NewReenteredPassword = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEREENTERNEWPASSWORD'})),
            case ((get({NewPassword, '$class'})):compareTo(NewPassword, NewReenteredPassword) =/= 0) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            InstallerInfo = 'InstallerInfo':new(),
            case (get({InstallerInfo, '$class'})):isValid(InstallerInfo, UserName, Password) of
                true ->
                (get({InstallerInfo, '$class'})):setPassword(InstallerInfo, NewPassword),
                (get({InstallerInfo, '$class'})):write(InstallerInfo),
                (get({get({This, weblisketSession}), '$class'})):setUserName(get({This, weblisketSession}), UserName),
                (get({get({This, weblisketSession}), '$class'})):setPassword(get({This, weblisketSession}), NewPassword),
                throw({'$return', true});
                false -> ok
            end,
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

invalidateSession(This) ->
        try
            (get({get({This, weblisketSession}), '$class'})):clear(get({This, weblisketSession})),
            (get({get({'TagSupport', 'EVAL_BODY_INCLUDE'}), '$class'})):intValue(get({'TagSupport', 'EVAL_BODY_INCLUDE'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "invalidateSession()", E);
                false -> ok
            end,
            get({'TagSupport', 'SKIP_BODY'})
        end.

% throws LicensingException
isSessionOld(This) ->
        try
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
                    throw({'$return', (get({true, '$class'})):booleanValue(true)});
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'AUTHENTICATION'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Role Is Not In Session", This, "isSessionOld()");
                    false -> ok
                end
            end,
            (fun(Target_N69885) -> (get({Target_N69885, '$class'})):booleanValue(Target_N69885) end)((get({This, '$class'})):isRarelyUsedSession(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "isSessionOld()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isRarelyUsedSession(This) ->
        case (get({This, role}) =/= undefined) of
            true ->
            TimeCreated = (get({get({This, weblisketSession}), '$class'})):getCreationTime(get({This, weblisketSession})),
            LastAccess = (get({get({This, weblisketSession}), '$class'})):getLastAccessedTime(get({This, weblisketSession})),
            TimePassed = (get({get({This, role}), '$class'})):getSessionInactivityTimeout(get({This, role})),
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
                (get({StringBuffer, '$class'})):appendlong(StringBuffer, TimePassed),
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

% throws LicensingException
isRoleValid(This) ->
        try
            (get({This, '$class'})):makeSessionValid(This, get({'BasicUserRoleFactory':getInstance(), 'INSTALLER'}), get({This, userName})),
            (get({true, '$class'})):booleanValue(true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "isRoleValid()", E);
                false -> ok
            end,
            false
        end.

% throws LicensingException
validRole(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Trying New login<p>"),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to set valid role",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "validRole()", E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
invalidRole(This) ->
        try
            (get({get({This, weblisketSession}), '$class'})):setAuthenticated(get({This, weblisketSession}), false),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Sorry your username and password is invalid on this page."),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Trying New login<p>"),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to set role invalid",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "invalidRole()", E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
isAuthenticationSessionValid(This) ->
        try
        try
            case (fun(Target_N72540) -> (get({Target_N72540, '$class'})):getFromString(Target_N72540, get({This, authenticated})) end)('BooleanUtil':getInstance()) of
                true ->
                Size = (get({get({This, roles}), '$class'})):size(get({This, roles})),
                lists:foreach(fun(Index) ->
                    MustBeOfRole = (get({get({This, roles}), '$class'})):get(get({This, roles}), Index),
                    case ((get({This, sessionUserName}) =/= undefined) andalso (get({get({This, role}), '$class'})):equals(get({This, role}), MustBeOfRole)) of
                        true ->
                        throw({'$return', (get({true, '$class'})):booleanValue(true)});
                        false -> ok
                    end
                end, lists:seq(0, Size - 1)),
                throw({'$return', (get({false, '$class'})):booleanValue(false)});
                false -> ok
            end,
            (get({false, '$class'})):booleanValue(false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "isAuthenticationSessionValid()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws LicensingException
processIfNewLogin(This) ->
        try
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Starting for User: ", get({This, userName})]), " Attempt: "]), (get({get({This, weblisketSession}), '$class'})):getAttempts(get({This, weblisketSession}))]), This, "processIfNewLogin()");
                false -> ok
            end,
            case ((((get({This, userName}) =/= undefined) andalso ((get({get({This, userName}), '$class'})):compareTo(get({This, userName}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})) =/= 0)) andalso (get({This, password}) =/= undefined)) andalso ((get({get({This, password}), '$class'})):compareTo(get({This, password}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})) =/= 0)) of
                true ->
                put({local, login}, undefined),
                InstallerInfo = 'InstallerInfo':new(),
                case (get({InstallerInfo, '$class'})):isValid(InstallerInfo, get({This, userName}), get({This, password})) of
                    true ->
                    put({local, login}, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'LOGINSUCCESS'}));
                    false ->
                    put({local, login}, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'LOGINFAILED'}))
                end,
                case ((get({get({local, login}), '$class'})):compareTo(get({local, login}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'LOGINSUCCESS'})) =:= 0) of
                    true ->
                    (get({get({This, weblisketSession}), '$class'})):setAttempts(get({This, weblisketSession}), 0),
                    throw({'$return', (get({true, '$class'})):booleanValue(true)});
                    false -> ok
                end,
                (get({This, '$class'})):nextAttempt(This),
                throw({'$return', (get({false, '$class'})):booleanValue(false)});
                false -> ok
            end,
            (get({This, '$class'})):nextAttempt(This),
            (get({false, '$class'})):booleanValue(false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processIfNewLogin()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws LicensingException
processInvalidation(This) ->
        try
        try
            case (fun(Target_N74499) -> (get({Target_N74499, '$class'})):getFromString(Target_N74499, get({This, timeout})) end)('BooleanUtil':getInstance()) of
                true ->
                (get({This, '$class'})):invalidateSession(This),
                throw({'$return', (get({true, '$class'})):booleanValue(true)});
                false -> ok
            end,
            begin
                (get({get({This, weblisketSession}), '$class'})):setTimeout(get({This, weblisketSession}), get({'BooleanFactory':getInstance(), 'TRUE_STRING'})),
                (get({false, '$class'})):booleanValue(false)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "isSetToInvalidate()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            StringUtil = 'StringUtil':getInstance(),
            put({This, request}, (get({get({This, pageContext}), '$class'})):getRequest(get({This, pageContext}))),
            put({This, weblisketSession}, 'BasicWeblisketSession':new(get({This, pageContext}))),
            (get({This, '$class'})):getFormData(This),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Started", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                false -> ok
            end,
            case (get({This, command}) =/= undefined) of
                true ->
                case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'CHANGEPASSWORD'})) =:= 0) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Change Password", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                        false -> ok
                    end,
                    case (not (get({This, '$class'})):changePassword(This)) of
                        true ->
                        (fun(Target_N79592) -> (get({Target_N79592, '$class'})):print(Target_N79592, "Password Change Attempt Failed.<p>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                        throw({'$return', get({'FileAuthenticationTag', 'EVAL_BODY_INCLUDE'})});
                        false ->
                        (fun(Target_N79538) -> (get({Target_N79538, '$class'})):print(Target_N79538, "Password Changed Successfully.<p>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                        throw({'$return', get({'FileAuthenticationTag', 'SKIP_BODY'})})
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
                            (fun(Target_N76169) -> (get({Target_N76169, '$class'})):print(Target_N76169, "Please login again.<p>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
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
                            (fun(Target_N78281) -> (get({Target_N78281, '$class'})):print(Target_N78281, (get({This, '$class'})):validRole(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                            case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                                true ->
                                throw({'$return', get({'FileAuthenticationTag', 'EVAL_BODY_INCLUDE'})});
                                false ->
                                throw({'$return', get({'FileAuthenticationTag', 'SKIP_BODY'})})
                            end;
                            false ->
                            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                                true ->
                                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Role is not valid - Processing new login", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                                false -> ok
                            end,
                            (fun(Target_N77896) -> (get({Target_N77896, '$class'})):print(Target_N77896, (get({This, '$class'})):invalidRole(This)) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
                            case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                                true ->
                                throw({'$return', get({'FileAuthenticationTag', 'SKIP_BODY'})});
                                false ->
                                throw({'$return', get({'FileAuthenticationTag', 'EVAL_BODY_INCLUDE'})})
                            end
                        end;
                        false ->
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Invalid Login", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                            false -> ok
                        end,
                        case ((((get({This, userName}) =/= undefined) andalso ((get({get({This, userName}), '$class'})):compareTo(get({This, userName}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})) =/= 0)) andalso (get({This, password}) =/= undefined)) andalso ((get({get({This, password}), '$class'})):compareTo(get({This, password}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})) =/= 0)) of
                            true ->
                            (fun(Target_N77380) -> (get({Target_N77380, '$class'})):print(Target_N77380, "Sorry your username and/or password is invalid.<p>") end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end
                    end,
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                        true ->
                        StringBuffer = 'StringMaker':new(),
                        (get({StringBuffer, '$class'})):append(StringBuffer, "Major authentication error - userName: "),
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, userName})),
                        (get({StringBuffer, '$class'})):append(StringBuffer, " Password: "),
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, password})),
                        (get({StringBuffer, '$class'})):append(StringBuffer, " Command: "),
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, command})),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                        false -> ok
                    end,
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'PROCESSBODYIFAUTHENTICATED'})) =:= 0) of
                        true ->
                        throw({'$return', get({'TagSupport', 'SKIP_BODY'})});
                        false ->
                        throw({'$return', get({'TagSupport', 'EVAL_BODY_INCLUDE'})})
                    end
                end
                end;
                false -> ok
            end,
            get({'FileAuthenticationTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'FileAuthenticationTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

