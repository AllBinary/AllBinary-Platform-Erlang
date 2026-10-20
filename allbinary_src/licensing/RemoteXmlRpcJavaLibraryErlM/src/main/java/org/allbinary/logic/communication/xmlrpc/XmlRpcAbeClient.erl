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
% package org.allbinary.logic.communication.xmlrpc
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.apache.xmlrpc.NullXmlRpcHandler
% import org.apache.xmlrpc.XmlRpcClient
% import org.apache.xmlrpc.XmlRpcHandler

-module('XmlRpcAbeClient').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, isOnline}, true),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, remoteMethod}, undefined),
    put({This, clientInfo}, undefined),
    put({This, client}, get({'NullXmlRpcHandler', 'NULL_XML_RPC_HANDLER'})),
    put({This, server}, 0),
    put({This, start}, 0),
    put({This, maxServers}, 0),
    put({This, isDone}, false),
    put({This, 'START_SERVER'}, "Start With Server #"),
    put({This, 'TRYING'}, "Trying Server #"),
    put({This, 'SEP'}, get({'CommonLabels':getInstance(), 'COLON_SEP'})),
    put({This, 'CLIENT_INFO'}, "Client Info: \n"),
    put({This, 'RESULT'}, (get({'CommonLabels':getInstance(), 'RESULT_'}) + get({'CommonSeps':getInstance(), 'NEW_LINE'}))),
    put({This, 'INVALID'}, "License data is Invalid Trying Other Servers"),
    put({This, 'EXCEPTION_IN_CLIENT'}, "Exception in client"),
    put({This, 'SERVER_REPORTED_ERROR'}, "Server reported error"),
    put({This, 'UNKNOWN_ERROR'}, "Unknown License Retrieval Failure"),
    put({This, 'TRYING_OTHER_SERVERS'}, "IOException Trying Other Servers"),
    put({This, 'HOST_NOT_RESOLVED_MSG'}, "Not Trying Again Since Host Unresolved"),
    put({This, 'HOST_NOT_RESOLVED'}, "Host is unresolved"),
    put({This, myRandomFactory}, 'MyRandomFactory':getInstance()),
    ok.


new(ClientInfo, RemoteMethod) when (is_list(RemoteMethod) orelse RemoteMethod =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ClientInfo, RemoteMethod),
    This.

'$init'(This, ClientInfo, RemoteMethod) when (is_list(RemoteMethod) orelse RemoteMethod =:= undefined) ->
    init_fields(This),
        put({This, remoteMethod}, RemoteMethod),
        put({This, clientInfo}, ClientInfo),
        case ((get({ClientInfo, '$class'})):getNumberOfLicenseServers(ClientInfo) > 1) of
            true ->
            put({This, maxServers}, ((get({ClientInfo, '$class'})):getNumberOfLicenseServers(ClientInfo) - 2)),
            put({This, start}, ((get({get({This, myRandomFactory}), '$class'})):getAbsoluteNextInt(get({This, myRandomFactory}), get({This, maxServers})) + 1));
            false ->
            case ((get({ClientInfo, '$class'})):getNumberOfLicenseServers(ClientInfo) =:= 1) of
            true ->
            put({This, maxServers}, 0),
            put({This, start}, 0);
            false -> ok
        end
        end,
        put({This, isDone}, false),
        put({This, server}, get({This, start})),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'START_SERVER'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getServer(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({ClientInfo, '$class'})):getLicenseServer(ClientInfo, (get({This, '$class'})):getServer(This))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

% throws Exception
get(This, AnyType) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This),
        get({'NullUtil':getInstance(), 'NULL_OBJECT'}).

% throws Exception
tryAnother(This, AnyType) ->
        try
        case ((get({This, '$class'})):getServer(This) < (get({This, '$class'})):getMaxServers(This)) of
            true ->
            (get({This, '$class'})):setServer(This, ((get({This, '$class'})):getServer(This) + 1));
            false ->
            (get({This, '$class'})):setServer(This, 0)
        end,
        case (((get({This, '$class'})):getServer(This) =/= (get({This, '$class'})):getStart(This)) andalso (not (get({This, '$class'})):isIsDone(This))) of
            true ->
            throw({'$return', (get({This, '$class'})):get(This, AnyType)});
            false ->
            (get({This, '$class'})):setIsDone(This, true)
        end,
        erlang:error({'Exception', "Tried All Servers But Still Failed"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getClientInfo(This) ->
        get({This, clientInfo}).

getClient(This) ->
        get({This, client}).

setClient(This, Client) ->
        put({This, client}, Client).

getServer(This) ->
        get({This, server}).

setServer(This, Server) when is_integer(Server) ->
        put({This, server}, Server).

getStart(This) ->
        get({This, start}).

setStart(This, Start) when is_integer(Start) ->
        put({This, start}, Start).

getMaxServers(This) ->
        get({This, maxServers}).

setMaxServers(This, MaxServers) when is_integer(MaxServers) ->
        put({This, maxServers}, MaxServers).

isIsDone(This) ->
        get({This, isDone}).

setIsDone(This, IsDone) when is_boolean(IsDone) ->
        put({This, isDone}, IsDone).

getRemoteMethod(This) ->
        get({This, remoteMethod}).

