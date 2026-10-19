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
% package org.allbinary.logic.communication.smtp.event.modules.log
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.event.EmailEvent
% import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface

-module('LogUserEmailEventListenerModule').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UserEmailEventListenerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
onEmailSendRequest(This, UserEmailInfoEvent) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            Message = lists:concat(["Logging EmailEvent - Temporary Listener for debugging.\n\n", (get({UserEmailInfoEvent, '$class'})):toString(UserEmailInfoEvent)]),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Message, This, "onEmailSendRequest");
            false -> ok
        end.

