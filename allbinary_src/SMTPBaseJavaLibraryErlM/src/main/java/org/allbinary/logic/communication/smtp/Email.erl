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
% import java.io.ByteArrayOutputStream
% import java.io.PrintStream
% import java.util.HashMap
% import java.util.Properties
% import javax.mail.Address
% import javax.mail.Authenticator
% import javax.mail.Message
% import javax.mail.MessagingException
% import javax.mail.Session
% import javax.mail.internet.InternetAddress
% import javax.mail.internet.InternetHeaders
% import javax.mail.internet.MimeBodyPart
% import javax.mail.internet.MimeMessage
% import javax.mail.internet.MimeMultipart
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('Email').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements EmailInterface

static_init() ->
    put({?MODULE, 'DEBUG'}, "mail.debug"),
    put({?MODULE, 'SMTP_HOST'}, "mail.smtp.host"),
    put({?MODULE, 'SMTP_PORT'}, "mail.smtp.port"),
    put({?MODULE, 'SMTP_USER'}, "mail.smtp.user"),
    put({?MODULE, 'SMTP_RETURN_ADDRESS'}, "mail.from"),
    put({?MODULE, 'SMTP_LOCAL_HOST'}, "mail.smtp.localhost"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, msg}, undefined),
    put({This, properties}, undefined),
    put({This, bs}, undefined),
    put({This, isDebug}, false),
    ok.


new(From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase) when (is_list(From) orelse From =:= undefined), (is_list(To) orelse To =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_list(Server) orelse Server =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined), (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase),
    This.

init(This, From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase) when (is_list(From) orelse From =:= undefined), (is_list(To) orelse To =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_list(Server) orelse Server =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined), (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
    init_fields(This),
        put({This, isDebug}, false),
        (get({This, '$class'})):init(This, From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase).

new(From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase, IsDebug) when (is_list(From) orelse From =:= undefined), (is_list(To) orelse To =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_list(Server) orelse Server =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined), (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined), is_boolean(IsDebug) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase, IsDebug),
    This.

init(This, From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase, IsDebug) when (is_list(From) orelse From =:= undefined), (is_list(To) orelse To =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_list(Server) orelse Server =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined), (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined), is_boolean(IsDebug) ->
    init_fields(This),
        put({This, isDebug}, IsDebug),
        (get({This, '$class'})):init(This, From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase).

% throws Exception
init(This, From, To, Subject, Server, TextBody, HtmlAttachment, ContentBase) when (is_list(From) orelse From =:= undefined), (is_list(To) orelse To =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_list(Server) orelse Server =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined), (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
        try
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            MimeBodyParts = array:new(case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, HtmlAttachment)) of true -> 2; false -> 1 end, {default, undefined}),
            array:set(0, 'MimeBodyPart':new(), MimeBodyParts),
            (fun(Target_N67323) -> (get({Target_N67323, '$class'})):setText(Target_N67323, TextBody) end)(array:get(0, MimeBodyParts)),
            case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, HtmlAttachment)) of
                true ->
                InternetHeaders = 'InternetHeaders':new(),
                (get({InternetHeaders, '$class'})):addHeader(InternetHeaders, "Content-Type", "text/html"),
                case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, ContentBase)) of
                    true ->
                    (get({InternetHeaders, '$class'})):addHeader(InternetHeaders, "Content-Base", ContentBase);
                    false -> ok
                end,
                array:set(1, 'MimeBodyPart':new(InternetHeaders, (get({HtmlAttachment, '$class'})):getBytes(HtmlAttachment)), MimeBodyParts);
                false -> ok
            end,
            (get({This, '$class'})):init(This, Server, undefined, array:from_list(['InternetAddress':new(From)]), array:from_list(['InternetAddress':new(To)]), undefined, undefined, Subject, MimeBodyParts)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "emailConstructor", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws MessagingException
init(This, Server, Authenticator, Addresses_from, Addresses_to, Addresses_cc, Addresses_bcc, Subject, MimeBodyParts) when (is_list(Server) orelse Server =:= undefined), (is_tuple(Addresses_from) orelse Addresses_from =:= undefined), (is_tuple(Addresses_to) orelse Addresses_to =:= undefined), (is_tuple(Addresses_cc) orelse Addresses_cc =:= undefined), (is_tuple(Addresses_bcc) orelse Addresses_bcc =:= undefined), (is_list(Subject) orelse Subject =:= undefined), (is_tuple(MimeBodyParts) orelse MimeBodyParts =:= undefined) ->
        put({This, properties}, 'Properties':new()),
        (get({get({This, properties}), '$class'})):put(get({This, properties}), get({'Email', 'SMTP_HOST'}), Server),
        try
            HostName = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
            case (fun(Target_N68436) -> (get({Target_N68436, '$class'})):isEmpty(Target_N68436, HostName) end)('StringValidationUtil':getInstance()) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Unable to get HostName so using fake", This, "init()");
                    false -> ok
                end,
                (get({get({This, properties}), '$class'})):put(get({This, properties}), get({'Email', 'SMTP_LOCAL_HOST'}), "FakeHostName");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Continuing on Exception: Unable to get HostName", This, "init()", E);
                false -> ok
            end,
            (get({get({This, properties}), '$class'})):put(get({This, properties}), get({'Email', 'SMTP_LOCAL_HOST'}), "FakeHostName")
        end,
        case get({This, isDebug}) of
            true ->
            (get({get({This, properties}), '$class'})):put(get({This, properties}), get({'Email', 'DEBUG'}), "true");
            false -> ok
        end,
        Session = 'Session':getInstance(get({This, properties}), Authenticator),
        case get({This, isDebug}) of
            true ->
            (get({Session, '$class'})):setDebug(Session, true),
            put({This, bs}, 'ByteArrayOutputStream':new()),
            PrintStream = 'PrintStream':new(get({This, bs})),
            (get({Session, '$class'})):setDebugOut(Session, PrintStream);
            false -> ok
        end,
        put({This, msg}, 'MimeMessage':new(Session)),
        (get({get({This, msg}), '$class'})):addFrom(get({This, msg}), Addresses_from),
        (get({get({This, msg}), '$class'})):setRecipients(get({This, msg}), get({get({'Message', 'RecipientType'}), 'TO'}), Addresses_to),
        (get({get({This, msg}), '$class'})):setRecipients(get({This, msg}), get({get({'Message', 'RecipientType'}), 'CC'}), Addresses_cc),
        (get({get({This, msg}), '$class'})):setRecipients(get({This, msg}), get({get({'Message', 'RecipientType'}), 'BCC'}), Addresses_bcc),
        (get({get({This, msg}), '$class'})):setSubject(get({This, msg}), Subject),
        MimeMultipart = 'MimeMultipart':new(),
        lists:foreach(fun(I) ->
            (get({MimeMultipart, '$class'})):addBodyPart(MimeMultipart, array:get(I, MimeBodyParts))
        end, lists:seq(0, array:size(MimeBodyParts) - 1)),
        (get({get({This, msg}), '$class'})):setContent(get({This, msg}), MimeMultipart).

getMimeMessage(This) ->
        get({This, msg}).

getDebugInfo(This) ->
        try
        case get({This, isDebug}) of
            true ->
            throw({'$return', lists:concat(["More Logging Before This To Standard Out: ", allbinary_java:to_string((get({get({This, bs}), '$class'})):toString(get({This, bs})))])});
            false ->
            throw({'$return', "Debugging Is Off"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
log(This) ->
        lists:concat(["\nHashMap: ", (fun(Target_N70194) -> (get({Target_N70194, '$class'})):toString(Target_N70194) end)((get({This, '$class'})):toHashMap(This))]).

% throws Exception
toHashMap(This) ->
        try
            HashMap = (fun(Target_N70275) -> (get({Target_N70275, '$class'})):createHashMap(Target_N70275) end)('StdUtil':getInstance()),
            (get({HashMap, '$class'})):put(HashMap, get({'EmailData', 'SERVER'}), (get({get({This, properties}), '$class'})):get(get({This, properties}), get({'Email', 'SMTP_HOST'}))),
            put({local, addresses}, (get({get({This, msg}), '$class'})):getFrom(get({This, msg}))),
            case (get({local, addresses}) =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    (get({HashMap, '$class'})):put(HashMap, get({'EmailData', 'FROM'}), (fun(Target_N70523) -> (get({Target_N70523, '$class'})):toString(Target_N70523) end)(array:get(Index, get({local, addresses}))))
                end, lists:seq(0, array:size(get({local, addresses})) - 1));
                false -> ok
            end,
            put({local, addresses}, (get({get({This, msg}), '$class'})):getRecipients(get({This, msg}), get({get({'Message', 'RecipientType'}), 'TO'}))),
            case (get({local, addresses}) =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    (get({HashMap, '$class'})):put(HashMap, get({'EmailData', 'TO'}), (fun(Target_N70762) -> (get({Target_N70762, '$class'})):toString(Target_N70762) end)(array:get(Index, get({local, addresses}))))
                end, lists:seq(0, array:size(get({local, addresses})) - 1));
                false -> ok
            end,
            put({local, addresses}, (get({get({This, msg}), '$class'})):getRecipients(get({This, msg}), get({get({'Message', 'RecipientType'}), 'CC'}))),
            case (get({local, addresses}) =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    (get({HashMap, '$class'})):put(HashMap, get({'EmailData', 'CC'}), (fun(Target_N71001) -> (get({Target_N71001, '$class'})):toString(Target_N71001) end)(array:get(Index, get({local, addresses}))))
                end, lists:seq(0, array:size(get({local, addresses})) - 1));
                false -> ok
            end,
            put({local, addresses}, (get({get({This, msg}), '$class'})):getRecipients(get({This, msg}), get({get({'Message', 'RecipientType'}), 'BCC'}))),
            case (get({local, addresses}) =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    (get({HashMap, '$class'})):put(HashMap, get({'EmailData', 'BCC'}), (fun(Target_N71240) -> (get({Target_N71240, '$class'})):toString(Target_N71240) end)(array:get(Index, get({local, addresses}))))
                end, lists:seq(0, array:size(get({local, addresses})) - 1));
                false -> ok
            end,
            (get({HashMap, '$class'})):put(HashMap, get({'EmailData', 'SUBJECT'}), (get({get({This, msg}), '$class'})):getSubject(get({This, msg}))),
            MimeMultipart = (get({get({This, msg}), '$class'})):getContent(get({This, msg})),
            case (MimeMultipart =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    Content = (fun(Target_N71507) -> (get({Target_N71507, '$class'})):getContent(Target_N71507) end)((get({MimeMultipart, '$class'})):getBodyPart(MimeMultipart, Index)),
                    (get({HashMap, '$class'})):put(HashMap, get({'EmailData', 'CONTENT'}), Content)
                end, lists:seq(0, (get({MimeMultipart, '$class'})):getCount(MimeMultipart) - 1));
                false -> ok
            end,
            HashMap
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "toHashMap()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'EmailData', 'NAME'}), (get({This, '$class'})):toHashMap(This)),
        Node.

% throws Exception
toXmlDoc(This) ->
        erlang:error({'Exception', get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'})}).

