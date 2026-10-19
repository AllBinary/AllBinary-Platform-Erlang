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
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.password.Password
% import org.allbinary.business.user.role.BasicUserRole
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.data.tables.user.UserEntityInterface
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionData
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.email.NewPasswordEmail
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory

-module('AuthenticationRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, request}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap, PageContext),
    This;
new(HashMap, HttpServletRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap, HttpServletRequest),
    This.

init(This, HashMap, PageContext) ->
    'TagHelper':init(This),
    init_fields(This),
        put({This, weblisketSession}, 'WeblisketSession':new(HashMap, PageContext)),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext));
init(This, HashMap, HttpServletRequest) ->
    'TagHelper':init(This),
    init_fields(This),
        put({This, weblisketSession}, 'WeblisketSession':new(HashMap, HttpServletRequest)),
        put({This, request}, HttpServletRequest).


% throws Exception
generateNewPassword(This) ->
        try
        case ((get({This, weblisketSession}) =/= undefined) andalso ((get({get({This, weblisketSession}), '$class'})):getId(get({This, weblisketSession})) =/= undefined)) of
            true ->
            StartIndex = (fun(Target_N66813) -> (get({Target_N66813, '$class'})):length(Target_N66813) end)((get({get({This, weblisketSession}), '$class'})):getId(get({This, weblisketSession}))),
            case (StartIndex >= 8) of
                true ->
                throw({'$return', (fun(Target_N66910) -> (get({Target_N66910, '$class'})):substring(Target_N66910, (StartIndex - 8)) end)((get({get({This, weblisketSession}), '$class'})):getId(get({This, weblisketSession})))});
                false ->
                erlang:error({'Exception', "Error Generating New Password"})
            end;
            false ->
            erlang:error({'Exception', "No Session Available For Generating New Password"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

newPassword(This) ->
        try
        try
            UserName = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEUSERNAME'})),
            Email = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'UserData', 'MAINEMAIL'})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Generating New Password For: ", UserName]), This, "newPassword()");
                false -> ok
            end,
            UserEntityInterface = 'UserEntityFactory':getInstance(),
            UserInterface = (get({UserEntityInterface, '$class'})):getUser(UserEntityInterface, UserName),
            case ((fun(Target_N67479) -> (get({Target_N67479, '$class'})):compareTo(Target_N67479, Email) end)((get({UserInterface, '$class'})):getMainEmail(UserInterface)) =/= 0) of
                true ->
                case (((get({UserInterface, '$class'})):getSecondaryEmail(UserInterface) =/= undefined) andalso ((fun(Target_N67559) -> (get({Target_N67559, '$class'})):compareTo(Target_N67559, Email) end)((get({UserInterface, '$class'})):getSecondaryEmail(UserInterface)) =/= 0)) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Requested Email Is Not In User Profile", This, "newPassword()");
                        false -> ok
                    end,
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end,
            NewPassword = (get({This, '$class'})):generateNewPassword(This),
            (get({UserInterface, '$class'})):setPassword(UserInterface, NewPassword),
            NewPasswordHashMap = (get({UserInterface, '$class'})):toPasswordHashMap(UserInterface),
            (fun(Target_N67961) -> (get({Target_N67961, '$class'})):update(Target_N67961, UserName, NewPasswordHashMap) end)('UserEntityFactory':getInstance()),
            (fun(Target_N68008) -> (get({Target_N68008, '$class'})):process(Target_N68008) end)('NewPasswordEmail':new(get({This, abeClientInformation}), UserInterface, NewPassword)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Generated New Password For: ", UserName]), This, "newPassword()");
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "newPassword()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

changePassword(This) ->
        try
        try
            UserName = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEUSERNAME'})),
            PasswordString = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEPASSWORD'})),
            NewPassword = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLENEWPASSWORD'})),
            NewReenteredPassword = (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEREENTERNEWPASSWORD'})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Changing Password For User: ", UserName]), This, "changePassword()");
                false -> ok
            end,
            Password = 'Password':new(NewPassword),
            case (not (fun(Target_N69178) -> (get({Target_N69178, '$class'})):booleanValue(Target_N69178) end)((get({Password, '$class'})):isValid(Password))) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New Password Is Not Valid", This, "changePassword()");
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            case ((get({NewPassword, '$class'})):compareTo(NewPassword, NewReenteredPassword) =/= 0) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New Password Fields Do Not Match", This, "changePassword()");
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            SessionPassword = (get({get({This, weblisketSession}), '$class'})):getPassword(get({This, weblisketSession})),
            UserEntityInterface = 'UserEntityFactory':getInstance(),
            UserInterface = (get({UserEntityInterface, '$class'})):getUser(UserEntityInterface, UserName),
            Login = (get({UserEntityInterface, '$class'})):login(UserEntityInterface, UserName, PasswordString),
            case ((get({Login, '$class'})):compareTo(Login, get({get({'AuthenticationRequestHelper', 'GLOBALS2'}), 'LOGINSUCCESS'})) =:= 0) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Authentication Successful", This, "changePassword()");
                    false -> ok
                end,
                NewPasswordHashMap = (get({Password, '$class'})):toHashMap(Password, undefined),
                (fun(Target_N70240) -> (get({Target_N70240, '$class'})):update(Target_N70240, UserName, NewPasswordHashMap) end)('UserEntityFactory':getInstance()),
                (fun(Target_N70287) -> (get({Target_N70287, '$class'})):process(Target_N70287) end)('NewPasswordEmail':new(get({This, abeClientInformation}), UserInterface, NewPassword)),
                throw({'$return', true});
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Authentication Failed", This, "changePassword()");
                false -> ok
            end,
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Authentication Failed", This, "changePassword()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isRoleValid(This, UserName, Password, Roles) when (is_list(UserName) orelse UserName =:= undefined), (is_list(Password) orelse Password =:= undefined) ->
        try
        try
            UserEntityInterface = 'UserEntityFactory':getInstance(),
            UserInterface = (get({UserEntityInterface, '$class'})):getUser(UserEntityInterface, UserName),
            case ((get({UserInterface, '$class'})):getRole(UserInterface) =:= undefined) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Role is null: ", (get({UserInterface, '$class'})):getRole(UserInterface)]), " Valid Roles: "]), (get({Roles, '$class'})):toString(Roles)]), This, "isRoleValid()");
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            BasicUserRoleArray = (get({Roles, '$class'})):toArray(Roles),
            Size = array:size(BasicUserRoleArray),
            lists:foreach(fun(Index) ->
                NextRole = array:get(Index, BasicUserRoleArray),
                case (fun(Target_N71492) -> (get({Target_N71492, '$class'})):equals(Target_N71492, NextRole) end)((fun(Target_N71499) -> (get({Target_N71499, '$class'})):getBasicUserRole(Target_N71499) end)((get({UserInterface, '$class'})):getRole(UserInterface))) of
                    true ->
                    (get({UserInterface, '$class'})):validateSession(UserInterface, get({This, weblisketSession})),
                    (get({get({This, request}), '$class'})):removeAttribute(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEUSERNAME'})),
                    (get({get({This, request}), '$class'})):removeAttribute(get({This, request}), get({'WeblisketSessionData', 'REMOVABLEPASSWORD'})),
                    throw({'$return', true});
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Role is not valid: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N72020) -> (get({Target_N72020, '$class'})):toString(Target_N72020) end)((get({UserInterface, '$class'})):getRole(UserInterface))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Valid Roles: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({Roles, '$class'})):toString(Roles)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "isRoleValid()");
                false -> ok
            end,
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "isRoleValid()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

