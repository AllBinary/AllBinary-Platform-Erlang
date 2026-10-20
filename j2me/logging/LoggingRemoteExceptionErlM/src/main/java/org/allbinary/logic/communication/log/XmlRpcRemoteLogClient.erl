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
% package org.allbinary.logic.communication.log
% import java.io.IOException
% import org.apache.xmlrpc.XmlRpcClient
% import org.apache.xmlrpc.XmlRpcException
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient
% import org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.ABHashtable

-module('XmlRpcRemoteLogClient').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('XmlRpcAbeClient', Function, Arguments).

init_fields(This) ->
    put({This, noCrypt}, 'NoCrypt':new()),
    ok.


new(ClientInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ClientInfo),
    This.

'$init'(This, ClientInfo) ->
        'XmlRpcAbeClient':'$init'(This, ClientInfo, "SSLLogServ.logUtil"),
        init_fields(This).

% throws Exception
get(This, AnyType) ->
        try
        try
            Param = 'BasicArrayListD':new(),
            put({local, serverUrl}, (fun(Target_N66103) -> (get({Target_N66103, '$class'})):getLicenseServer(Target_N66103, (get({This, '$class'})):getServer(This)) end)((get({This, '$class'})):getClientInfo(This))),
            Index = (get({get({local, serverUrl}), '$class'})):lastIndexOf(get({local, serverUrl}), "/"),
            put({local, serverUrl}, lists:concat([string:slice(get({local, serverUrl}), 0, ((Index + 1)) - (0)), "logservssl.php"])),
            XmlRpcClient = 'XmlRpcClient':new(get({local, serverUrl})),
            (get({This, '$class'})):setClient(This, XmlRpcClient),
            (get({XmlRpcClient, '$class'})):setBasicAuthentication(XmlRpcClient, undefined, undefined),
            Hashtable = AnyType,
            (get({Param, '$class'})):add(Param, Hashtable),
            Result = (get({XmlRpcClient, '$class'})):execute(XmlRpcClient, (get({This, '$class'})):getRemoteMethod(This), Param, get({This, noCrypt})),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([(get({'CommonLabels':getInstance(), 'RESULT_'}) + get({'CommonSeps':getInstance(), 'NEW_LINE'})), (get({Result, '$class'})):toString(Result)]))]),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~ts~n", [allbinary_java:to_string("IOException Trying Other Servers")]),
            case (not (fun(Target_N66760) -> (get({Target_N66760, '$class'})):startsWith(Target_N66760, get({'XmlRpcRemoteLogClient', 'HOST_NOT_RESOLVED'})) end)(allbinary_java:to_string(E))) of
                true ->
                throw({'$return', (get({This, '$class'})):tryAnother(This, AnyType)});
                false ->
                erlang:error({'Exception', get({'XmlRpcRemoteLogClient', 'HOST_NOT_RESOLVED_MSG'})})
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

