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
% package org.allbinary.logic.communication.smtp
% import java.util.HashMap
% import javax.mail.internet.MimeMessage
% import org.allbinary.logic.communication.smtp.info.BasicEmailInfo
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicEmail').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements EmailInterface

init_fields(This) ->
    put({This, email}, undefined),
    ok.


new(EmailInfo, To) when (is_list(To) orelse To =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, EmailInfo, To),
    This.

'$init'(This, EmailInfo, To) when (is_list(To) orelse To =:= undefined) ->
    init_fields(This),
        BasicEmailInfo = (get({EmailInfo, '$class'})):getBasicEmailInfo(EmailInfo),
        put({This, email}, 'AbEmail':new((fun(Target_N65886) -> (get({Target_N65886, '$class'})):getSmtpServer(Target_N65886) end)((get({BasicEmailInfo, '$class'})):getEmailServerConfigurationInterface(BasicEmailInfo)), (fun(Target_N65910) -> (get({Target_N65910, '$class'})):getAccountName(Target_N65910) end)((get({BasicEmailInfo, '$class'})):getEmailServerConfigurationInterface(BasicEmailInfo)), To, (get({BasicEmailInfo, '$class'})):getSubject(BasicEmailInfo), (get({BasicEmailInfo, '$class'})):getTextBody(BasicEmailInfo), (get({EmailInfo, '$class'})):getHtmlAttachment(EmailInfo), (get({EmailInfo, '$class'})):getContentBase(EmailInfo))).

getEmail(This) ->
        (get({get({This, email}), '$class'})):getEmail(get({This, email})).

getMimeMessage(This) ->
        (get({get({This, email}), '$class'})):getMimeMessage(get({This, email})).

getDebugInfo(This) ->
        (get({get({This, email}), '$class'})):getDebugInfo(get({This, email})).

% throws Exception
log(This) ->
        (get({get({This, email}), '$class'})):log(get({This, email})).

% throws Exception
toHashMap(This) ->
        (get({get({This, email}), '$class'})):toHashMap(get({This, email})).

% throws Exception
toXmlNode(This, Document) ->
        (get({get({This, email}), '$class'})):toXmlNode(get({This, email}), Document).

% throws Exception
toXmlDoc(This) ->
        (get({get({This, email}), '$class'})):toXmlDoc(get({This, email})).

