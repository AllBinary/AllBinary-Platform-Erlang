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
% package org.allbinary.business.user.commerce.money.payment.gateway.transaction
% import java.util.HashMap
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.tokens.Tokenizer
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('TransactionResult').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransactionResultInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, keyValuePairs}, undefined),
    put({This, result}, undefined),
    ok.


new(Result) when (is_list(Result) orelse Result =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Result),
    This;
new(KeyValuePairs) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, KeyValuePairs),
    This.

'$init'(This, Result) when (is_list(Result) orelse Result =:= undefined) ->
    init_fields(This),
        try
            put({This, result}, Result),
            Tokenizer = 'Tokenizer':new(get({'CommonSeps':getInstance(), 'AMPERSAND'})),
            Tokens = (get({Tokenizer, '$class'})):getTokensFromString(Tokenizer, Result, 'BasicArrayListD':new()),
            Tokenizer2 = 'Tokenizer':new(get({'CommonSeps':getInstance(), 'EQUALS'})),
            Hashtable = (get({Tokenizer2, '$class'})):getTokens(Tokenizer2, Tokens),
            (get({get({This, keyValuePairs}), '$class'})):putAll(get({This, keyValuePairs}), Hashtable)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ExceptionMessage = "TransactionResult Constructor Failed",
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), ExceptionMessage, This, get({get({This, commonStrings}), 'CONSTRUCTOR'}))
        end;
'$init'(This, KeyValuePairs) ->
    init_fields(This),
        put({local, keyValuePairs}, KeyValuePairs),
        put({local, keyValuePairs}, get({local, keyValuePairs})),
        put({This, result}, "Needs to have the hashmap converted to string for other constructor").


toString(This) ->
        get({This, result}).

toHashMap(This) ->
        get({This, keyValuePairs}).

getAllPossibleKeys(This) ->
        PaymentTransactionKeysFactory = 'PaymentTransactionKeysFactory':getInstance(),
        VerisignResponseKeys = 'BasicArrayListD':new(),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'RESULT'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'RESULT'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'PNREF'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'PNREF'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'RESPMSG'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'RESPMSG'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'AUTHCODE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'AUTHCODE'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'AVSADDR'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'AVSADDR'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'AVSZIP'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'AVSZIP'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'ORIGRESULT'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'ORIGRESULT'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'STATUS'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'STATUS'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'FRAUDCODE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'FRAUDCODE'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'FRAUDMSG'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'FRAUDMSG'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'ERRCODE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'ERRCODE'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'SCORE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'SCORE'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'REASON1'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'REASON1'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'REASON2'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'REASON2'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'REASON3'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'REASON3'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION1'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION1'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION2'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION2'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION3'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION3'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION4'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION4'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION5'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION5'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION6'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION6'}))),
        (get({VerisignResponseKeys, '$class'})):add(VerisignResponseKeys, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION7'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION7'}))),
        VerisignResponseKeys.

getValues(This) ->
        KeyVector = (get({This, '$class'})):getAllPossibleKeys(This),
        ValueVector = 'BasicArrayListD':new(),
        Size = (get({KeyVector, '$class'})):size(KeyVector),
        lists:foreach(fun(I) ->
            Key = (get({KeyVector, '$class'})):get(KeyVector, I),
            case (get({get({This, keyValuePairs}), '$class'})):containsKey(get({This, keyValuePairs}), Key) of
                true ->
                (get({ValueVector, '$class'})):add(ValueVector, (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), Key));
                false ->
                StringUtil = 'StringUtil':getInstance(),
                (get({ValueVector, '$class'})):add(ValueVector, get({StringUtil, 'EMPTY_STRING'}))
            end
        end, lists:seq(0, Size - 1)),
        ValueVector.

getPnRef(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N68408) -> (get({Target_N68408, '$class'})):toString(Target_N68408) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'PNREF'}))).

getRespMsg(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N68508) -> (get({Target_N68508, '$class'})):toString(Target_N68508) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'RESPMSG'}))).

getResult(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N68608) -> (get({Target_N68608, '$class'})):toString(Target_N68608) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'RESULT'}))).

getScore(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N68708) -> (get({Target_N68708, '$class'})):toString(Target_N68708) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'SCORE'}))).

getStatus(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N68808) -> (get({Target_N68808, '$class'})):toString(Target_N68808) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'STATUS'}))).

getFraudCode(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N68908) -> (get({Target_N68908, '$class'})):toString(Target_N68908) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'FRAUDCODE'}))).

getFraudMsg(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69008) -> (get({Target_N69008, '$class'})):toString(Target_N69008) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'FRAUDMSG'}))).

getOrigResult(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69108) -> (get({Target_N69108, '$class'})):toString(Target_N69108) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'ORIGRESULT'}))).

getAvsAddr(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69208) -> (get({Target_N69208, '$class'})):toString(Target_N69208) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'AVSADDR'}))).

getAvsZip(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69308) -> (get({Target_N69308, '$class'})):toString(Target_N69308) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'AVSZIP'}))).

getErrCode(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69408) -> (get({Target_N69408, '$class'})):toString(Target_N69408) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'ERRCODE'}))).

getException1(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69508) -> (get({Target_N69508, '$class'})):toString(Target_N69508) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'EXCEPTION1'}))).

getException2(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69608) -> (get({Target_N69608, '$class'})):toString(Target_N69608) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'EXCEPTION2'}))).

getException3(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69708) -> (get({Target_N69708, '$class'})):toString(Target_N69708) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'EXCEPTION3'}))).

getException4(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69808) -> (get({Target_N69808, '$class'})):toString(Target_N69808) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'EXCEPTION4'}))).

getException5(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N69908) -> (get({Target_N69908, '$class'})):toString(Target_N69908) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'EXCEPTION5'}))).

getException6(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N70008) -> (get({Target_N70008, '$class'})):toString(Target_N70008) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'EXCEPTION6'}))).

getException7(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N70108) -> (get({Target_N70108, '$class'})):toString(Target_N70108) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'EXCEPTION7'}))).

getReason1(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N70208) -> (get({Target_N70208, '$class'})):toString(Target_N70208) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'REASON1'}))).

getReason2(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N70308) -> (get({Target_N70308, '$class'})):toString(Target_N70308) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'REASON2'}))).

getReason3(This) ->
        (get({get({This, keyValuePairs}), '$class'})):get(get({This, keyValuePairs}), (fun(Target_N70408) -> (get({Target_N70408, '$class'})):toString(Target_N70408) end)(get({'PaymentTransactionKeysFactory':getInstance(), 'REASON3'}))).

