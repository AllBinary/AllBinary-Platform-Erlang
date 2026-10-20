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
% package org.allbinary.logic.communication.smtp.info
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('BasicEmailInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, subject}, undefined),
    put({This, textBody}, undefined),
    put({This, emailServerConfigurationInterface}, undefined),
    ok.


new(Subject, TextBody) when (is_list(Subject) orelse Subject =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Subject, TextBody),
    This.

'$init'(This, Subject, TextBody) when (is_list(Subject) orelse Subject =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'CONSTRUCTOR'}));
            false -> ok
        end,
        put({This, subject}, Subject),
        put({This, textBody}, TextBody).

getSubject(This) ->
        get({This, subject}).

getTextBody(This) ->
        get({This, textBody}).

getEmailServerConfigurationInterface(This) ->
        get({This, emailServerConfigurationInterface}).

setEmailServerConfigurationInterface(This, EmailServerConfigurationInterface) ->
        put({This, emailServerConfigurationInterface}, EmailServerConfigurationInterface).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66575) -> (get({Target_N66575, '$class'})):toString(Target_N66575) end)((get({This, '$class'})):getEmailServerConfigurationInterface(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Subject: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getSubject(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nText Body: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTextBody(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

% throws Exception
init(This) ->
        erlang:error({'RuntimeException'}).

