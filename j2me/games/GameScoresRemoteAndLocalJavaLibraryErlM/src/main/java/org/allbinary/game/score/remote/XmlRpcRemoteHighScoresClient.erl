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
% package org.allbinary.game.score.remote
% import java.io.IOException
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.init.crypt.jcehelper.CryptInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient
% import org.allbinary.logic.java.exception.ExceptionUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.util.ABHashtable
% import org.apache.xmlrpc.XmlRpcClient
% import org.apache.xmlrpc.XmlRpcException

-module('XmlRpcRemoteHighScoresClient').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('XmlRpcAbeClient', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, page}, undefined),
    ok.


new(ClientInfo, Page, RemoteMethod) when (is_list(Page) orelse Page =:= undefined), (is_list(RemoteMethod) orelse RemoteMethod =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ClientInfo, Page, RemoteMethod),
    This.

init(This, ClientInfo, Page, RemoteMethod) when (is_list(Page) orelse Page =:= undefined), (is_list(RemoteMethod) orelse RemoteMethod =:= undefined) ->
        'XmlRpcAbeClient':init(This, ClientInfo, RemoteMethod),
        init_fields(This),
        put({This, page}, Page),
        (get({This, '$class'})):setServer(This, 0).

% throws Exception
get(This, AnyType, CryptInterface) ->
        try
        try
            Param = 'BasicArrayListD':new(),
            put({local, serverUrl}, (fun(Target_N66254) -> (get({Target_N66254, '$class'})):getLicenseServer(Target_N66254, (get({This, '$class'})):getServer(This)) end)((get({This, '$class'})):getClientInfo(This))),
            Index = (get({get({local, serverUrl}), '$class'})):lastIndexOf(get({local, serverUrl}), $/),
            put({local, serverUrl}, lists:concat([string:slice(get({local, serverUrl}), 0, ((Index + 1)) - (0)), get({This, page})])),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'XmlRpcRemoteHighScoresClient', 'TRYING'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getServer(This))),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'SEP'),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({local, serverUrl})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'GET'})),
            XmlRpcClient = 'XmlRpcClient':new(get({local, serverUrl})),
            (get({This, '$class'})):setClient(This, XmlRpcClient),
            (get({XmlRpcClient, '$class'})):setBasicAuthentication(XmlRpcClient, undefined, undefined),
            Hashtable = AnyType,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'XmlRpcRemoteHighScoresClient', 'CLIENT_INFO'}), (get({Hashtable, '$class'})):toString(Hashtable)]), This, get({get({This, commonStrings}), 'GET'})),
            (get({Param, '$class'})):add(Param, Hashtable),
            Result = (get({XmlRpcClient, '$class'})):execute(XmlRpcClient, (get({This, '$class'})):getRemoteMethod(This), Param, CryptInterface),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'XmlRpcRemoteHighScoresClient', 'RESULT'}), (get({Result, '$class'})):toString(Result)]), This, get({get({This, commonStrings}), 'GET'})),
            put({This, isOnline}, true),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({'XmlRpcRemoteHighScoresClient', 'TRYING_OTHER_SERVERS'}) + (fun(Target_N67212) -> (get({Target_N67212, '$class'})):getStackTrace(Target_N67212, E) end)('ExceptionUtil':getInstance())), This, get({get({This, commonStrings}), 'GET'}), E),
            case (not (fun(Target_N67292) -> (get({Target_N67292, '$class'})):startsWith(Target_N67292, get({'XmlRpcRemoteHighScoresClient', 'HOST_NOT_RESOLVED'})) end)(allbinary_java:to_string(E))) of
                true ->
                throw({'$return', (get({This, '$class'})):tryAnother(This, AnyType)});
                false ->
                erlang:error({'Exception', get({'XmlRpcRemoteHighScoresClient', 'HOST_NOT_RESOLVED_MSG'})})
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

