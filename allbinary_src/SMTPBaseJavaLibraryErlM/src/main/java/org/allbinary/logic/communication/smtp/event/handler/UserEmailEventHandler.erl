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
% package org.allbinary.logic.communication.smtp.event.handler
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.smtp.event.EmailEvent
% import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.info.EmailInfo

-module('UserEmailEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, emailVector}, undefined),
    put({This, emailInfo}, undefined),
    put({This, userEmailEventNameData}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, emailVector}, 'BasicArrayListD':new()).

% throws Exception
receiveEmailInfo(This, UserEmailEventNameData, EmailInfo) ->
        put({This, userEmailEventNameData}, UserEmailEventNameData),
        put({This, emailInfo}, EmailInfo),
        (get({This, '$class'})):fireEmailEvent(This).

addListener(This, Vector) ->
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            UserEmailEventListenerInterface = (get({Vector, '$class'})):get(Vector, Index),
            (get({This, '$class'})):addListener(This, UserEmailEventListenerInterface)
        end, lists:seq(0, Size - 1));
addListener(This, EmailEventListenerInterface) ->
        (get({get({This, emailVector}), '$class'})):add(get({This, emailVector}), EmailEventListenerInterface).


removeListener(This, EmailEventListenerInterface) ->
        (get({get({This, emailVector}), '$class'})):remove(get({This, emailVector}), EmailEventListenerInterface).

% throws Exception
fireEmailEvent(This) ->
        EmailEvent = 'EmailEvent':new(This, get({This, userEmailEventNameData}), get({This, emailInfo}), 0),
        Size = (get({get({This, emailVector}), '$class'})):size(get({This, emailVector})),
        lists:foreach(fun(Index) ->
            EmailEventListenerInterface = (get({get({This, emailVector}), '$class'})):get(get({This, emailVector}), Index),
            (get({EmailEventListenerInterface, '$class'})):onEmailSendRequest(EmailEventListenerInterface, EmailEvent)
        end, lists:seq(0, Size - 1)).

