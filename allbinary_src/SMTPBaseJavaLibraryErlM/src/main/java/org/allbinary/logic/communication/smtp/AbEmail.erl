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
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('AbEmail').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements EmailInterface

init_fields(This) ->
    put({This, email}, undefined),
    ok.


new(Server, From, To, Subject, TextBody, HtmlAttachment, ContentBase) when (is_list(Server) orelse Server =:= undefined), (is_list(From) orelse From =:= undefined), (is_list(To) orelse To =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined), (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Server, From, To, Subject, TextBody, HtmlAttachment, ContentBase),
    This.

'$init'(This, Server, From, To, Subject, TextBody, HtmlAttachment, ContentBase) when (is_list(Server) orelse Server =:= undefined), (is_list(From) orelse From =:= undefined), (is_list(To) orelse To =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined), (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
            true ->
            put({This, email}, 'Email':new(From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase, true));
            false ->
            put({This, email}, 'Email':new(From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase))
        end.

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

getEmail(This) ->
        get({This, email}).

% throws Exception
toXmlDoc(This) ->
        (get({get({This, email}), '$class'})):toXmlDoc(get({This, email})).

