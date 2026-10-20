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
% package org.allbinary.business.user.commerce.money.payment
% import java.util.HashMap
% import javax.servlet.ServletRequest
% import org.allbinary.business.entry.EntryData
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.control.crypt.SuperCrypt
% import org.allbinary.logic.string.StringUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('Payment').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaymentInterface
% implements DomNodeInterface

init_fields(This) ->
    put({This, name}, undefined),
    put({This, expiration}, undefined),
    put({This, encryption}, undefined),
    put({This, number}, undefined),
    put({This, id}, undefined),
    put({This, type}, undefined),
    put({This, tenderType}, undefined),
    put({This, transactionType}, undefined),
    put({This, aba}, undefined),
    put({This, account}, undefined),
    put({This, accountType}, undefined),
    put({This, authorizationCode}, undefined),
    put({This, checkNumber}, undefined),
    put({This, checkType}, undefined),
    put({This, driversLicense}, undefined),
    put({This, magneticInkCheckReader}, undefined),
    put({This, isDefault}, false),
    ok.


new(Payment) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Payment),
    This;
new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Request),
    This.

'$init'(This, Payment) ->
    init_fields(This),
        put({This, name}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'NAME'}))),
        put({This, type}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'TYPE'}))),
        put({This, expiration}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'EXPIRATION'}))),
        put({This, encryption}, (get({Payment, '$class'})):get(Payment, get({'EntryData':getInstance(), 'ENCRYPTION'}))),
        put({This, number}, (fun(Target_N66712) -> (get({Target_N66712, '$class'})):decrypt(Target_N66712, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'NUMBER'}))) end)('SuperCrypt':new((get({get({This, encryption}), '$class'})):intValue(get({This, encryption}))))),
        put({This, id}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'ID'}))),
        Def = (get({Payment, '$class'})):get(Payment, get({'EntryData':getInstance(), 'DEFAULT'})),
        case ((Def =/= undefined) andalso ((get({Def, '$class'})):compareTo(Def, get({'EntryData':getInstance(), 'DEFAULT'})) =:= 0)) of
            true ->
            put({This, isDefault}, true);
            false ->
            put({This, isDefault}, false)
        end,
        put({This, tenderType}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'TENDERTYPE'}))),
        put({This, transactionType}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'TRANSACTIONTYPE'}))),
        put({This, aba}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'ABA'}))),
        put({This, account}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'ACCOUNT'}))),
        put({This, accountType}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'ACCOUNTTYPE'}))),
        put({This, authorizationCode}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'AUTHORIZATIONCODE'}))),
        put({This, checkNumber}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'CHECKNUMBER'}))),
        put({This, checkType}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'CHECKTYPE'}))),
        put({This, driversLicense}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'DRIVERSLICENSE'}))),
        put({This, magneticInkCheckReader}, (get({Payment, '$class'})):get(Payment, get({'PaymentData', 'MAGNETICINKCHECKREADER'})));
'$init'(This, Request) ->
    init_fields(This),
        put({This, name}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'NAME'}))),
        put({This, type}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'TYPE'}))),
        put({This, expiration}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'EXPIRATION'}))),
        put({This, number}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'NUMBER'}))),
        put({This, tenderType}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'TENDERTYPE'}))),
        put({This, transactionType}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'TRANSACTIONTYPE'}))),
        put({This, aba}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'ABA'}))),
        put({This, account}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'ACCOUNT'}))),
        put({This, accountType}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'ACCOUNTTYPE'}))),
        put({This, authorizationCode}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'AUTHORIZATIONCODE'}))),
        put({This, checkNumber}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'CHECKNUMBER'}))),
        put({This, checkType}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'CHECKTYPE'}))),
        put({This, driversLicense}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'DRIVERSLICENSE'}))),
        put({This, magneticInkCheckReader}, (get({Request, '$class'})):getParameter(Request, get({'PaymentData', 'MAGNETICINKCHECKREADER'}))).


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

isValid(This) ->
        try
        StringUtil = 'StringUtil':getInstance(),
        AFalse = false,
        case ((get({This, name}) =:= undefined) orelse ((get({get({This, name}), '$class'})):compareTo(get({This, name}), get({StringUtil, 'EMPTY_STRING'})) =:= 0)) of
            true ->
            throw({'$return', AFalse});
            false -> ok
        end,
        case ((get({This, type}) =:= undefined) orelse ((get({get({This, type}), '$class'})):compareTo(get({This, type}), get({StringUtil, 'EMPTY_STRING'})) =:= 0)) of
            true ->
            throw({'$return', AFalse});
            false -> ok
        end,
        case ((get({This, expiration}) =:= undefined) orelse ((get({get({This, expiration}), '$class'})):compareTo(get({This, expiration}), get({StringUtil, 'EMPTY_STRING'})) =:= 0)) of
            true ->
            throw({'$return', AFalse});
            false -> ok
        end,
        case ((get({This, number}) =:= undefined) orelse ((get({get({This, number}), '$class'})):compareTo(get({This, number}), get({StringUtil, 'EMPTY_STRING'})) =:= 0)) of
            true ->
            throw({'$return', AFalse});
            false -> ok
        end,
        case (string:length(get({This, number})) > get({get({get({get({get({get({get({get({get({'org', allbinary}), business}), user}), commerce}), money}), payment}), types}), 'CreditCardType'}), 'MAXLEN'})) of
            true ->
            throw({'$return', AFalse});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setTenderType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, tenderType}, Value).

setTransactionType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, transactionType}, Value).

setAuthorizationCode(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, authorizationCode}, Value).

setCheckType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, checkType}, Value).

setCheckNumber(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, checkNumber}, Value).

setDriversLicense(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, driversLicense}, Value).

setMagneticInkCheckReader(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, magneticInkCheckReader}, Value).

setAba(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, aba}, Value).

setAccountType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, accountType}, Value).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

setType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, type}, Value).

setExpiration(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, expiration}, Value).

setNumber(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, number}, Value).

getId(This) ->
        get({This, id}).

getName(This) ->
        get({This, name}).

getType(This) ->
        get({This, type}).

getExpiration(This) ->
        get({This, expiration}).

getEncryption(This) ->
        get({This, encryption}).

getNumber(This) ->
        get({This, number}).

getTenderType(This) ->
        get({This, tenderType}).

getTransactionType(This) ->
        get({This, transactionType}).

getAba(This) ->
        get({This, aba}).

getAccount(This) ->
        get({This, account}).

getAccountType(This) ->
        get({This, accountType}).

getAuthorizationCode(This) ->
        get({This, authorizationCode}).

getCheckNumber(This) ->
        get({This, checkNumber}).

getCheckType(This) ->
        get({This, checkType}).

getDriversLicense(This) ->
        get({This, driversLicense}).

getMagneticInkCheckReader(This) ->
        get({This, magneticInkCheckReader}).

getLastFour(This) ->
        try
        case ((string:length(get({This, number})) > get({'PaymentData', 'MIN'})) andalso (string:length(get({This, number})) =< get({'PaymentData', 'MAX'}))) of
            true ->
            throw({'$return', string:slice(get({This, number}), (string:length(get({This, number})) - 4))});
            false ->
            throw({'$return', "Invalid #"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDefault(This) ->
        get({This, isDefault}).

toHashMap(This) ->
        HashMap = (fun(Target_N71230) -> (get({Target_N71230, '$class'})):createHashMap(Target_N71230) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'NAME'}), get({This, name})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'TYPE'}), get({This, type})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'EXPIRATION'}), get({This, expiration})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'NUMBER'}), (get({This, '$class'})):getLastFour(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'TENDERTYPE'}), get({This, tenderType})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'TRANSACTIONTYPE'}), get({This, transactionType})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'ABA'}), get({This, aba})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'ACCOUNT'}), get({This, account})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'ACCOUNTTYPE'}), get({This, accountType})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'AUTHORIZATIONCODE'}), get({This, authorizationCode})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'CHECKNUMBER'}), get({This, checkNumber})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'DRIVERSLICENSE'}), get({This, driversLicense})),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'MAGNETICINKCHECKREADER'}), get({This, magneticInkCheckReader})),
        case get({This, isDefault}) of
            true ->
            (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'DEFAULT'}), get({'EntryData':getInstance(), 'DEFAULT'}));
            false ->
            (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'DEFAULT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
        end,
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({This, '$class'})):toHashMap(This),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'PaymentData', 'PAYMENT'}), HashMap),
        Node.

toXmlDoc(This) ->
        undefined.

view(This) ->
        undefined.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

validationInfo(This) ->
        undefined.

