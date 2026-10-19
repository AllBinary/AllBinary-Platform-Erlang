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
% package org.allbinary.logic.communication.smtp.event
% import java.util.EventObject
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.allbinary.logic.string.StringMaker

-module('EmailEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('EventObject', Function, Arguments).

init_fields(This) ->
    put({This, emailInfo}, undefined),
    put({This, userEmailEventNameData}, undefined),
    put({This, attempts}, 0),
    ok.


new(EmailEventHandler, UserEmailEventNameData, EmailInfo, Attempts) when is_integer(Attempts) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, EmailEventHandler, UserEmailEventNameData, EmailInfo, Attempts),
    This.

init(This, EmailEventHandler, UserEmailEventNameData, EmailInfo, Attempts) when is_integer(Attempts) ->
        'EventObject':init(This, EmailEventHandler),
        init_fields(This),
        put({This, userEmailEventNameData}, UserEmailEventNameData),
        put({This, emailInfo}, EmailInfo).

getEmailInfo(This) ->
        get({This, emailInfo}).

getAttempts(This) ->
        get({This, attempts}).

setAttempts(This, Attempts) when is_integer(Attempts) ->
        put({This, attempts}, Attempts).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "EmailEvent Log: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Event Name: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, userEmailEventNameData}), '$class'})):toString(get({This, userEmailEventNameData}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66266) -> (get({Target_N66266, '$class'})):toString(Target_N66266) end)((get({This, '$class'})):getEmailInfo(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nNumber of Attempts: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getAttempts(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

