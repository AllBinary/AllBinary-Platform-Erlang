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
% package org.allbinary.logic.communication.smtp.email
% import org.allbinary.business.user.UserInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler
% import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.info.AdminEmailInfo
% import org.allbinary.logic.communication.smtp.info.BasicEmailInfo
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('NewPasswordEmail').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, abeClientInformation}, undefined),
    put({This, userInterface}, undefined),
    put({This, newPassword}, undefined),
    ok.


new(AbeClientInformation, UserInterface, NewPassword) when (is_list(NewPassword) orelse NewPassword =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, UserInterface, NewPassword),
    This.

init(This, AbeClientInformation, UserInterface, NewPassword) when (is_list(NewPassword) orelse NewPassword =:= undefined) ->
    init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        put({This, userInterface}, UserInterface),
        put({This, newPassword}, NewPassword).

% throws Exception
process(This) ->
        (get({This, '$class'})):notifyStoreAdmin(This),
        (get({This, '$class'})):notifyUser(This).

% throws Exception
notifyStoreAdmin(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "notifyStoreAdmin", This, "notifyStoreAdmin");
                false -> ok
            end,
            EmailSubject = lists:concat(["New Password For User: ", (get({get({This, userInterface}), '$class'})):getUserName(get({This, userInterface}))]),
            EmailBody = lists:concat(["New Password: ", get({This, newPassword})]),
            BasicEmailInfo = 'AdminEmailInfo':new(EmailSubject, EmailBody),
            EmailInfo = 'EmailInfo':new(BasicEmailInfo),
            AdminUserEmailEventHandler = (fun(Target_N66926) -> (get({Target_N66926, '$class'})):getInstance(Target_N66926, get({This, abeClientInformation}), get({'UserEmailEventNameData', 'NEWPASSWORD'})) end)('AdminUserEmailEventHandlerSingletons':getInstance()),
            (get({AdminUserEmailEventHandler, '$class'})):receiveEmailInfo(AdminUserEmailEventHandler, get({'UserEmailEventNameData', 'NEWPASSWORD'}), EmailInfo)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "emailAdmin", E);
                false -> ok
            end
        end.

% throws Exception
notifyUser(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Email User", This, "notifyUser()");
                false -> ok
            end,
            Subject = "New Password",
            Body = lists:concat(["New Password: ", get({This, newPassword})]),
            BasicEmailInfo = 'AdminEmailInfo':new(Subject, Body),
            EmailInfo = 'EmailInfo':new(BasicEmailInfo),
            UserEmailEventHandler = (fun(Target_N67787) -> (get({Target_N67787, '$class'})):getInstance(Target_N67787, get({This, abeClientInformation}), get({'UserEmailEventNameData', 'NEWPASSWORD'}), get({This, userInterface})) end)('UserEmailEventHandlerSingletons':getInstance()),
            (get({UserEmailEventHandler, '$class'})):receiveEmailInfo(UserEmailEventHandler, get({'UserEmailEventNameData', 'NEWPASSWORD'}), EmailInfo)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "notifyUser", E);
                false -> ok
            end,
            erlang:error(E)
        end.

