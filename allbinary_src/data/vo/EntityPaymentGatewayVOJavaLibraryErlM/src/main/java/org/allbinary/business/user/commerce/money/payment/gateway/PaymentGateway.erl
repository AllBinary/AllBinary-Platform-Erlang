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
% package org.allbinary.business.user.commerce.money.payment.gateway
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.control.crypt.SuperCrypt
% import org.allbinary.logic.string.StringUtil

-module('PaymentGateway').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaymentGatewayInterface

init_fields(This) ->
    put({This, storeName}, undefined),
    put({This, name}, undefined),
    put({This, enable}, undefined),
    put({This, paymentMethod}, undefined),
    put({This, mode}, undefined),
    put({This, testProtocol}, undefined),
    put({This, testServer}, undefined),
    put({This, testPort}, undefined),
    put({This, testPath}, undefined),
    put({This, serverProtocol}, undefined),
    put({This, server}, undefined),
    put({This, serverPort}, undefined),
    put({This, serverPath}, undefined),
    put({This, timeout}, undefined),
    put({This, userName}, undefined),
    put({This, password}, undefined),
    put({This, proxyProtocol}, undefined),
    put({This, proxyServer}, undefined),
    put({This, proxyPort}, undefined),
    put({This, proxyPath}, undefined),
    put({This, proxyUserName}, undefined),
    put({This, proxyPassword}, undefined),
    put({This, proxyTimeout}, undefined),
    put({This, special1}, undefined),
    put({This, special2}, undefined),
    put({This, special3}, undefined),
    put({This, special4}, undefined),
    put({This, special5}, undefined),
    put({This, special6}, undefined),
    put({This, special7}, undefined),
    put({This, special8}, undefined),
    put({This, special9}, undefined),
    put({This, lastModified}, undefined),
    put({This, timeEntered}, undefined),
    ok.


new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, HashMap) ->
    init_fields(This),
        (get({This, '$class'})):getFormData(This, HashMap).

getFormData(This, HashMap) ->
        StringUtil = 'StringUtil':getInstance(),
        Empty = get({StringUtil, 'EMPTY_STRING'}),
        put({This, storeName}, (get({HashMap, '$class'})):get(HashMap, (fun(Target_N67150) -> (get({Target_N67150, '$class'})):toString(Target_N67150) end)(get({'StoreFrontData':getInstance(), 'NAME'})))),
        put({This, name}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})))),
        put({This, enable}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, (fun(Target_N67333) -> (get({Target_N67333, '$class'})):toString(Target_N67333) end)(get({'EntryData':getInstance(), 'ENABLE'}))))),
        put({This, paymentMethod}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentData', 'METHOD'}), '$class'})):toString(get({'PaymentData', 'METHOD'}))))),
        put({This, mode}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'MODE'}), '$class'})):toString(get({'PaymentGatewayData', 'MODE'}))))),
        put({This, testProtocol}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'TESTPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPROTOCOL'}))))),
        put({This, testServer}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'TESTSERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTSERVER'}))))),
        put({This, testPort}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'TESTPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPORT'}))))),
        put({This, testPath}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'TESTPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPATH'})))),
        case (get({This, testPath}) =:= undefined) of
            true ->
            put({This, testPath}, Empty);
            false -> ok
        end,
        put({This, serverProtocol}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SERVERPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPROTOCOL'})))),
        case (get({This, serverProtocol}) =:= undefined) of
            true ->
            put({This, serverProtocol}, Empty);
            false -> ok
        end,
        put({This, server}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVER'})))),
        case (get({This, server}) =:= undefined) of
            true ->
            put({This, server}, Empty);
            false -> ok
        end,
        put({This, serverPort}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SERVERPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPORT'})))),
        case (get({This, serverPort}) =:= undefined) of
            true ->
            put({This, serverPort}, Empty);
            false -> ok
        end,
        put({This, serverPath}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SERVERPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPATH'})))),
        case (get({This, serverPath}) =:= undefined) of
            true ->
            put({This, serverPath}, Empty);
            false -> ok
        end,
        put({This, userName}, (get({HashMap, '$class'})):get(HashMap, (get({get({'UserData', 'USERNAME'}), '$class'})):toString(get({'UserData', 'USERNAME'})))),
        case (get({This, userName}) =:= undefined) of
            true ->
            put({This, userName}, Empty);
            false -> ok
        end,
        put({This, password}, (get({HashMap, '$class'})):get(HashMap, (get({get({'UserData', 'PASSWORD'}), '$class'})):toString(get({'UserData', 'PASSWORD'})))),
        case (get({This, password}) =:= undefined) of
            true ->
            put({This, password}, Empty);
            false -> ok
        end,
        put({This, timeout}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'TIMEOUT'}), '$class'})):toString(get({'PaymentGatewayData', 'TIMEOUT'})))),
        case (get({This, timeout}) =:= undefined) of
            true ->
            put({This, timeout}, Empty);
            false -> ok
        end,
        put({This, proxyProtocol}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'PROXYPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPROTOCOL'})))),
        case (get({This, proxyProtocol}) =:= undefined) of
            true ->
            put({This, proxyProtocol}, Empty);
            false -> ok
        end,
        put({This, proxyServer}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'PROXYSERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYSERVER'})))),
        case (get({This, proxyServer}) =:= undefined) of
            true ->
            put({This, proxyServer}, Empty);
            false -> ok
        end,
        put({This, proxyPort}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'PROXYPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPORT'})))),
        case (get({This, proxyPort}) =:= undefined) of
            true ->
            put({This, proxyPort}, Empty);
            false -> ok
        end,
        put({This, proxyPath}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'PROXYPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPATH'})))),
        case (get({This, proxyPath}) =:= undefined) of
            true ->
            put({This, proxyPath}, Empty);
            false -> ok
        end,
        put({This, proxyUserName}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'PROXYUSERNAME'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYUSERNAME'})))),
        case (get({This, proxyUserName}) =:= undefined) of
            true ->
            put({This, proxyUserName}, Empty);
            false -> ok
        end,
        put({This, proxyPassword}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'PROXYPASSWORD'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPASSWORD'})))),
        case (get({This, proxyPassword}) =:= undefined) of
            true ->
            put({This, proxyPassword}, Empty);
            false -> ok
        end,
        put({This, proxyTimeout}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'PROXYTIMEOUT'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYTIMEOUT'})))),
        case (get({This, proxyTimeout}) =:= undefined) of
            true ->
            put({This, proxyTimeout}, Empty);
            false -> ok
        end,
        put({This, special1}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL1'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL1'})))),
        case (get({This, special1}) =:= undefined) of
            true ->
            put({This, special1}, Empty);
            false -> ok
        end,
        put({This, special2}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL2'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL2'})))),
        case (get({This, special2}) =:= undefined) of
            true ->
            put({This, special2}, Empty);
            false -> ok
        end,
        put({This, special3}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL3'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL3'})))),
        case (get({This, special3}) =:= undefined) of
            true ->
            put({This, special3}, Empty);
            false -> ok
        end,
        put({This, special4}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL4'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL4'})))),
        case (get({This, special4}) =:= undefined) of
            true ->
            put({This, special4}, Empty);
            false -> ok
        end,
        put({This, special5}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL5'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL5'})))),
        case (get({This, special5}) =:= undefined) of
            true ->
            put({This, special5}, Empty);
            false -> ok
        end,
        put({This, special6}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL6'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL6'})))),
        case (get({This, special6}) =:= undefined) of
            true ->
            put({This, special6}, Empty);
            false -> ok
        end,
        put({This, special7}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL7'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL7'})))),
        case (get({This, special7}) =:= undefined) of
            true ->
            put({This, special7}, Empty);
            false -> ok
        end,
        put({This, special8}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL8'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL8'})))),
        case (get({This, special8}) =:= undefined) of
            true ->
            put({This, special8}, Empty);
            false -> ok
        end,
        put({This, special9}, (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'SPECIAL9'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL9'})))),
        case (get({This, special9}) =:= undefined) of
            true ->
            put({This, special9}, Empty);
            false -> ok
        end,
        put({This, lastModified}, (get({HashMap, '$class'})):get(HashMap, (fun(Target_N70916) -> (get({Target_N70916, '$class'})):toString(Target_N70916) end)(get({'EntryData':getInstance(), 'LASTMODIFIED'})))),
        case (get({This, lastModified}) =:= undefined) of
            true ->
            put({This, lastModified}, Empty);
            false -> ok
        end,
        put({This, timeEntered}, (get({HashMap, '$class'})):get(HashMap, (fun(Target_N71050) -> (get({Target_N71050, '$class'})):toString(Target_N71050) end)(get({'EntryData':getInstance(), 'TIMECREATED'})))),
        case (get({This, timeEntered}) =:= undefined) of
            true ->
            put({This, timeEntered}, Empty);
            false -> ok
        end.

getStoreName(This) ->
        get({This, storeName}).

getName(This) ->
        get({This, name}).

getEnable(This) ->
        get({This, enable}).

getPaymentMethod(This) ->
        get({This, paymentMethod}).

getMode(This) ->
        get({This, mode}).

getTestProtocol(This) ->
        get({This, testProtocol}).

getTestServer(This) ->
        get({This, testServer}).

getTestPort(This) ->
        get({This, testPort}).

getTestPath(This) ->
        get({This, testPath}).

getServerProtocol(This) ->
        get({This, serverProtocol}).

getServer(This) ->
        get({This, server}).

getServerPort(This) ->
        get({This, serverPort}).

getServerPath(This) ->
        get({This, serverPath}).

getUserName(This) ->
        get({This, userName}).

getPassword(This) ->
        get({This, password}).

getProxyProtocol(This) ->
        get({This, proxyProtocol}).

getProxyServer(This) ->
        get({This, proxyServer}).

getProxyPath(This) ->
        get({This, proxyPath}).

getProxyPort(This) ->
        get({This, proxyPort}).

getProxyUserName(This) ->
        get({This, proxyUserName}).

getProxyPassword(This) ->
        get({This, proxyPassword}).

getTimeout(This) ->
        get({This, timeout}).

getProxyTimeout(This) ->
        get({This, proxyTimeout}).

getSpecial1(This) ->
        get({This, special1}).

getSpecial2(This) ->
        get({This, special2}).

getSpecial3(This) ->
        get({This, special3}).

getSpecial4(This) ->
        get({This, special4}).

getSpecial5(This) ->
        get({This, special5}).

getSpecial6(This) ->
        get({This, special6}).

getSpecial7(This) ->
        get({This, special7}).

getSpecial8(This) ->
        get({This, special8}).

getSpecial9(This) ->
        get({This, special9}).

getLastModified(This) ->
        get({This, lastModified}).

getTimeEntered(This) ->
        get({This, timeEntered}).

setEnable(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, enable}, Value).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

setPaymentMethod(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, paymentMethod}, Value).

setMode(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, mode}, Value).

setTestProtocol(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testProtocol}, Value).

setTestServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testServer}, Value).

setTestPort(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testPort}, Value).

setTestPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testPath}, Value).

setServerProtocol(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, serverProtocol}, Value).

setServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, server}, Value).

setServerPort(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, serverPort}, Value).

setServerPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, serverPath}, Value).

setTimeout(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, timeout}, Value).

setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userName}, Value).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, password}, Value).

setProxyProtocol(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, proxyProtocol}, Value).

setProxyServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, proxyServer}, Value).

setProxyPort(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, proxyPort}, Value).

setProxyPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, proxyPath}, Value).

setProxyUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, proxyUserName}, Value).

setProxyPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, proxyPassword}, Value).

setProxyTimeout(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, proxyTimeout}, Value).

setSpecial1(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special1}, Value).

setSpecial2(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special2}, Value).

setSpecial3(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special3}, Value).

setSpecial4(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special4}, Value).

setSpecial5(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special5}, Value).

setSpecial6(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special6}, Value).

setSpecial7(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special7}, Value).

setSpecial8(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special8}, Value).

setSpecial9(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special9}, Value).

setLastModified(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, lastModified}, Value).

setTimeEntered(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, timeEntered}, Value).

% throws Exception
toHashMap(This) ->
        (get({This, '$class'})):toHashMap(This, true).

% throws Exception
toHashMap(This, IsEncrypted) when is_boolean(IsEncrypted) ->
        PaymentGatewayHashMap = (fun(Target_N75285) -> (get({Target_N75285, '$class'})):createHashMap(Target_N75285) end)('StdUtil':getInstance()),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, get({'EntryData':getInstance(), 'ENABLE'}), get({This, enable})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (fun(Target_N75403) -> (get({Target_N75403, '$class'})):toString(Target_N75403) end)(get({'StoreFrontData':getInstance(), 'NAME'})), get({This, storeName})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), (get({This, '$class'})):getName(This)),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentData', 'METHOD'}), '$class'})):toString(get({'PaymentData', 'METHOD'})), get({This, paymentMethod})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'MODE'}), '$class'})):toString(get({'PaymentGatewayData', 'MODE'})), get({This, mode})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'TESTPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPROTOCOL'})), get({This, testProtocol})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'TESTSERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTSERVER'})), get({This, testServer})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'TESTPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPORT'})), get({This, testPort})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'TESTPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPATH'})), get({This, testPath})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SERVERPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPROTOCOL'})), get({This, serverProtocol})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVER'})), get({This, server})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SERVERPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPORT'})), get({This, serverPort})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SERVERPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPATH'})), get({This, serverPath})),
        case IsEncrypted of
            true ->
            put({local, superCrypt}, 'SuperCrypt':new(get({'PaymentGatewayData', 'CRYPTNUM'}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'UserData', 'USERNAME'}), '$class'})):toString(get({'UserData', 'USERNAME'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, userName}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'UserData', 'PASSWORD'}), '$class'})):toString(get({'UserData', 'PASSWORD'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, password})));
            false ->
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'UserData', 'USERNAME'}), '$class'})):toString(get({'UserData', 'USERNAME'})), get({This, userName})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'UserData', 'PASSWORD'}), '$class'})):toString(get({'UserData', 'PASSWORD'})), get({This, password}))
        end,
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'TIMEOUT'}), '$class'})):toString(get({'PaymentGatewayData', 'TIMEOUT'})), get({This, timeout})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'PROXYPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPROTOCOL'})), get({This, proxyProtocol})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'PROXYSERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYSERVER'})), get({This, proxyServer})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'PROXYPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPORT'})), get({This, proxyPort})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'PROXYPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPATH'})), get({This, proxyPath})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'PROXYUSERNAME'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYUSERNAME'})), get({This, proxyUserName})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'PROXYPASSWORD'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPASSWORD'})), get({This, proxyPassword})),
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'PROXYTIMEOUT'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYTIMEOUT'})), get({This, proxyTimeout})),
        case IsEncrypted of
            true ->
            put({local, superCrypt}, 'SuperCrypt':new(get({'PaymentGatewayData', 'CRYPTNUM'}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL1'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL1'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special1}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL2'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL2'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special2}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL3'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL3'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special3}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL4'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL4'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special4}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL5'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL5'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special5}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL6'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL6'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special6}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL7'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL7'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special7}))),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL8'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL8'})), (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special8})));
            false ->
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL1'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL1'})), get({This, special1})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL2'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL2'})), get({This, special2})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL3'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL3'})), get({This, special3})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL4'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL4'})), get({This, special4})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL5'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL5'})), get({This, special5})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL6'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL6'})), get({This, special6})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL7'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL7'})), get({This, special7})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL8'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL8'})), get({This, special8})),
            (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (get({get({'PaymentGatewayData', 'SPECIAL9'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL9'})), get({This, special9}))
        end,
        (get({PaymentGatewayHashMap, '$class'})):put(PaymentGatewayHashMap, (fun(Target_N78151) -> (get({Target_N78151, '$class'})):toString(Target_N78151) end)(get({'EntryData':getInstance(), 'LASTMODIFIED'})), get({This, lastModified})),
        PaymentGatewayHashMap.

toVector(This) ->
        (get({This, '$class'})):toVector(This, true).

toVector(This, IsEncrypted) when is_boolean(IsEncrypted) ->
        UpdateVector = 'BasicArrayListD':new(),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, enable})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, storeName})),
        (get({UpdateVector, '$class'})):add(UpdateVector, (get({This, '$class'})):getName(This)),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, paymentMethod})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, mode})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, testProtocol})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, testServer})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, testPort})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, testPath})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, serverProtocol})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, server})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, serverPort})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, serverPath})),
        case IsEncrypted of
            true ->
            put({local, superCrypt}, 'SuperCrypt':new(get({'PaymentGatewayData', 'CRYPTNUM'}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, userName}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, password})));
            false ->
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, userName})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, password}))
        end,
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, timeout})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, proxyProtocol})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, proxyServer})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, proxyPort})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, proxyPath})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, proxyUserName})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, proxyPassword})),
        (get({UpdateVector, '$class'})):add(UpdateVector, get({This, proxyTimeout})),
        case IsEncrypted of
            true ->
            put({local, superCrypt}, 'SuperCrypt':new(get({'PaymentGatewayData', 'CRYPTNUM'}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special1}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special2}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special3}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special4}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special5}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special6}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special7}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special8}))),
            (get({UpdateVector, '$class'})):add(UpdateVector, (get({get({local, superCrypt}), '$class'})):encrypt(get({local, superCrypt}), get({This, special9})));
            false ->
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special1})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special2})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special3})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special4})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special5})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special6})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special7})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special8})),
            (get({UpdateVector, '$class'})):add(UpdateVector, get({This, special9}))
        end,
        UpdateVector.

% throws Exception
getKey(This) ->
        'PaymentGatewayPrimaryKey':new((get({This, '$class'})):getStoreName(This), (get({This, '$class'})):getName(This)).

