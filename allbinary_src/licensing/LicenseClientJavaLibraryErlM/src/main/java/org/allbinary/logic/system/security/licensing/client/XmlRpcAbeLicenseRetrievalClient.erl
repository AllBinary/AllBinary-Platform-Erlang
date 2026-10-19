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
% package org.allbinary.logic.system.security.licensing.client
% import java.io.IOException
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.init.crypt.jcehelper.CryptInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient
% import org.allbinary.logic.java.exception.ExceptionUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.AbeClientLicense
% import org.allbinary.logic.system.security.licensing.AbeLicenseInterface
% import org.allbinary.string.CommonLabels
% import org.allbinary.util.ABHashtable
% import org.apache.xmlrpc.XmlRpcClient
% import org.apache.xmlrpc.XmlRpcException

-module('XmlRpcAbeLicenseRetrievalClient').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('XmlRpcAbeClient', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(ClientInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ClientInfo),
    This.

init(This, ClientInfo) ->
        'XmlRpcAbeClient':init(This, ClientInfo, "LicServ.getLicense"),
        init_fields(This).

% throws Exception
get(This, AnyType, CryptInterface) ->
        try
        try
            Server = (fun(Target_N66215) -> (get({Target_N66215, '$class'})):getLicenseServer(Target_N66215, (get({This, '$class'})):getServer(This)) end)((get({This, '$class'})):getClientInfo(This)),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'XmlRpcAbeLicenseRetrievalClient', 'TRYING'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getServer(This))),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'SEP'),
            (get({StringBuffer, '$class'})):append(StringBuffer, Server),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'CommonLabels':getInstance(), 'START_LABEL'}), (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, get({get({This, commonStrings}), 'GET'})),
            Param = 'BasicArrayListD':new(),
            XmlRpcClient = 'XmlRpcClient':new(Server),
            (get({This, '$class'})):setClient(This, XmlRpcClient),
            (get({XmlRpcClient, '$class'})):setBasicAuthentication(XmlRpcClient, undefined, undefined),
            Hashtable = (fun(Target_N66711) -> (get({Target_N66711, '$class'})):toHashtable(Target_N66711) end)((get({This, '$class'})):getClientInfo(This)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'XmlRpcAbeLicenseRetrievalClient', 'CLIENT_INFO'}), (get({Hashtable, '$class'})):toString(Hashtable)]), This, get({get({This, commonStrings}), 'GET'})),
            (get({Param, '$class'})):add(Param, Hashtable),
            Result = (get({XmlRpcClient, '$class'})):execute(XmlRpcClient, (get({This, '$class'})):getRemoteMethod(This), Param, CryptInterface),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'XmlRpcAbeLicenseRetrievalClient', 'RESULT'}), (get({Result, '$class'})):toString(Result)]), This, get({get({This, commonStrings}), 'GET'})),
            ResultHashtable = Result,
            case (not 'AbeClientLicense':hasRequiredKeys(ResultHashtable)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({'XmlRpcAbeLicenseRetrievalClient', 'INVALID'}), This, get({get({This, commonStrings}), 'GET'})),
                throw({'$return', (get({This, '$class'})):tryAnother(This, AnyType)});
                false -> ok
            end,
            AbeLicenseInterface = 'AbeClientLicense':new(ResultHashtable),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({get({This, commonStrings}), 'END'}), (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, get({get({This, commonStrings}), 'GET'})),
            put({This, isOnline}, true),
            AbeLicenseInterface
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({'XmlRpcAbeLicenseRetrievalClient', 'EXCEPTION_IN_CLIENT'}), This, get({get({This, commonStrings}), 'GET'}), E),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'XmlRpcAbeLicenseRetrievalClient', 'TRYING_OTHER_SERVERS'}) + (fun(Target_N67576) -> (get({Target_N67576, '$class'})):getStackTrace(Target_N67576, E) end)('ExceptionUtil':getInstance())), This, get({get({This, commonStrings}), 'GET'})),
            case (not (fun(Target_N67648) -> (get({Target_N67648, '$class'})):startsWith(Target_N67648, get({'XmlRpcAbeLicenseRetrievalClient', 'HOST_NOT_RESOLVED'})) end)(allbinary_java:to_string(E))) of
                true ->
                throw({'$return', (get({This, '$class'})):tryAnother(This, AnyType)});
                false ->
                put({This, isOnline}, false),
                erlang:error({'Exception', get({'XmlRpcAbeLicenseRetrievalClient', 'HOST_NOT_RESOLVED_MSG'})})
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

