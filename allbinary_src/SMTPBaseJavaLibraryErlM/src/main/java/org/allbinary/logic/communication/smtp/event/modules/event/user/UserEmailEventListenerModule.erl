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
% package org.allbinary.logic.communication.smtp.event.modules.event.user
% import org.allbinary.business.user.UserInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.BasicEmail
% import org.allbinary.logic.communication.smtp.EmailInterface
% import org.allbinary.logic.communication.smtp.event.EmailEvent
% import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface
% import org.allbinary.logic.communication.smtp.queue.EmailQueueFactory

-module('UserEmailEventListenerModule').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UserEmailEventListenerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, userInterface}, undefined),
    ok.


new(UserInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UserInterface),
    This.

init(This, UserInterface) ->
    init_fields(This),
        put({This, userInterface}, UserInterface).

% throws Exception
onEmailSendFailure(This, EmailEvent) ->
        To = (get({get({This, userInterface}), '$class'})):getSecondaryEmail(get({This, userInterface})),
        Email = 'BasicEmail':new((get({EmailEvent, '$class'})):getEmailInfo(EmailEvent), To),
        (fun(Target_N66155) -> (get({Target_N66155, '$class'})):offer(Target_N66155, (get({Email, '$class'})):getEmail(Email)) end)('EmailQueueFactory':getInstance()).

% throws Exception
onEmailSendRequest(This, EmailEvent) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Add Email To Que For Sending: ", (get({EmailEvent, '$class'})):toString(EmailEvent)]), This, "onEmailSendRequest");
            false -> ok
        end,
        To = (get({get({This, userInterface}), '$class'})):getMainEmail(get({This, userInterface})),
        Email = 'BasicEmail':new((get({EmailEvent, '$class'})):getEmailInfo(EmailEvent), To),
        (fun(Target_N66618) -> (get({Target_N66618, '$class'})):offer(Target_N66618, (get({Email, '$class'})):getEmail(Email)) end)('EmailQueueFactory':getInstance()).

