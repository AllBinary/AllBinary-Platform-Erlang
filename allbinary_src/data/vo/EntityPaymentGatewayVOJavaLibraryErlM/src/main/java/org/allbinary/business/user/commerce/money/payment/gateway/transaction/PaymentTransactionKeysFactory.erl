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

-module('PaymentTransactionKeysFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PaymentTransactionKeysFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'TRXTYPE'}, 'PaymentTransactionKeys':new("TRXTYPE")),
    put({This, 'TENDER'}, 'PaymentTransactionKeys':new("TENDER")),
    put({This, 'ACCT'}, 'PaymentTransactionKeys':new("ACCT")),
    put({This, 'EXPDATE'}, 'PaymentTransactionKeys':new("EXPDATE")),
    put({This, 'AMT'}, 'PaymentTransactionKeys':new("AMT")),
    put({This, 'AUTHCODE'}, 'PaymentTransactionKeys':new("AUTHCODE")),
    put({This, 'MICR'}, 'PaymentTransactionKeys':new("MICR")),
    put({This, 'CHECKNUM'}, 'PaymentTransactionKeys':new("CHECKNUM")),
    put({This, 'NAME'}, 'PaymentTransactionKeys':new("NAME")),
    put({This, 'STREET'}, 'PaymentTransactionKeys':new("STREET")),
    put({This, 'CITY'}, 'PaymentTransactionKeys':new("CITY")),
    put({This, 'STATE'}, 'PaymentTransactionKeys':new("STATE")),
    put({This, 'ZIP'}, 'PaymentTransactionKeys':new("ZIP")),
    put({This, 'DL'}, 'PaymentTransactionKeys':new("DL")),
    put({This, 'EMAIL'}, 'PaymentTransactionKeys':new("EMAIL")),
    put({This, 'COMMENT1'}, 'PaymentTransactionKeys':new("COMMENT1")),
    put({This, 'COMMENT2'}, 'PaymentTransactionKeys':new("COMMENT2")),
    put({This, 'ORIGID'}, 'PaymentTransactionKeys':new("ORIGID")),
    put({This, 'PONUM'}, 'PaymentTransactionKeys':new("PONUM")),
    put({This, 'DESC'}, 'PaymentTransactionKeys':new("PaymentTransactionDESC")),
    put({This, 'DESC1TO4'}, 'PaymentTransactionKeys':new("DESC1TO4")),
    put({This, 'INVNUM'}, 'PaymentTransactionKeys':new("INVNUM")),
    put({This, 'SHIPTOZIP'}, 'PaymentTransactionKeys':new("SHIPTOZIP")),
    put({This, 'SWIPE'}, 'PaymentTransactionKeys':new("SWIPE")),
    put({This, 'TAXAMT'}, 'PaymentTransactionKeys':new("TAXAMT")),
    put({This, 'COMMCARD'}, 'PaymentTransactionKeys':new("COMMCARD")),
    put({This, 'DUTYAMT'}, 'PaymentTransactionKeys':new("DUTYAMT")),
    put({This, 'FRIEGHTAMT'}, 'PaymentTransactionKeys':new("FRIEGHTAMT")),
    put({This, 'ORDERDATE'}, 'PaymentTransactionKeys':new("ORDERDATE")),
    put({This, 'TAXEXEMPT'}, 'PaymentTransactionKeys':new("TAXEXEMPT")),
    put({This, 'COUNTRYCODE'}, 'PaymentTransactionKeys':new("COUNTRYCODE")),
    put({This, 'CUSTCODE'}, 'PaymentTransactionKeys':new("CUSTCODE")),
    put({This, 'CVV2'}, 'PaymentTransactionKeys':new("CVV2")),
    put({This, 'ABA'}, 'PaymentTransactionKeys':new("ABA")),
    put({This, 'ACCTTYPE'}, 'PaymentTransactionKeys':new("ACCTTYPE")),
    put({This, 'DISCOUNT'}, 'PaymentTransactionKeys':new("DISCOUNT")),
    put({This, 'FIRSTNAME'}, 'PaymentTransactionKeys':new("FIRSTNAME")),
    put({This, 'LASTNAME'}, 'PaymentTransactionKeys':new("LASNAME")),
    put({This, 'SHIPFROMZIP'}, 'PaymentTransactionKeys':new("SHIPFROMZIP")),
    put({This, 'PRENOTE'}, 'PaymentTransactionKeys':new("PRENOTE")),
    put({This, 'CHKTYPE'}, 'PaymentTransactionKeys':new("CHKTYPE")),
    put({This, 'DOB'}, 'PaymentTransactionKeys':new("DOB")),
    put({This, 'PHONENUM'}, 'PaymentTransactionKeys':new("PHONENUM")),
    put({This, 'SS'}, 'PaymentTransactionKeys':new("SS")),
    put({This, 'COMPANYNAME'}, 'PaymentTransactionKeys':new("COMPANYNAME")),
    put({This, 'COUNTRY'}, 'PaymentTransactionKeys':new("COUNTRY")),
    put({This, 'FREIGHTAMT'}, 'PaymentTransactionKeys':new("FREIGHTAMT")),
    put({This, 'SHIPTOCITY'}, 'PaymentTransactionKeys':new("SHIPTOCITY")),
    put({This, 'SHIPTOFIRSTNAME'}, 'PaymentTransactionKeys':new("SHIPTOFIRSTNAME")),
    put({This, 'SHIPTOLASTNAME'}, 'PaymentTransactionKeys':new("SHIPTOLASTNAME")),
    put({This, 'SHIPTOSTATE'}, 'PaymentTransactionKeys':new("SHIPTOSTATE")),
    put({This, 'SHIPTOSTREET'}, 'PaymentTransactionKeys':new("SHIPTOSTREET")),
    put({This, 'SPECIAL1'}, 'PaymentTransactionKeys':new("SPECIAL1")),
    put({This, 'SPECIAL2'}, 'PaymentTransactionKeys':new("SPECIAL2")),
    put({This, 'SPECIAL3'}, 'PaymentTransactionKeys':new("SPECIAL3")),
    put({This, 'PARTNER'}, 'PaymentTransactionKeys':new("PARTNER")),
    put({This, 'VENDOR'}, 'PaymentTransactionKeys':new("VENDOR")),
    put({This, 'USER'}, 'PaymentTransactionKeys':new("USER")),
    put({This, 'PWD'}, 'PaymentTransactionKeys':new("PWD")),
    put({This, 'CHKNUM'}, 'PaymentTransactionKeys':new("CHKNUM")),
    put({This, 'AVSADDR'}, 'PaymentTransactionKeys':new("AVSADDR")),
    put({This, 'AVSZIP'}, 'PaymentTransactionKeys':new("AVSZIP")),
    put({This, 'PNREF'}, 'PaymentTransactionKeys':new("PNREF")),
    put({This, 'RESPMSG'}, 'PaymentTransactionKeys':new("RESPMSG")),
    put({This, 'RESULT'}, 'PaymentTransactionKeys':new("RESULT")),
    put({This, 'ORIGRESULT'}, 'PaymentTransactionKeys':new("ORIGRESULT")),
    put({This, 'STATUS'}, 'PaymentTransactionKeys':new("STATUS")),
    put({This, 'FRAUDCODE'}, 'PaymentTransactionKeys':new("FRAUDCODE")),
    put({This, 'FRAUDMSG'}, 'PaymentTransactionKeys':new("FRAUDMSG")),
    put({This, 'ERRCODE'}, 'PaymentTransactionKeys':new("ERRCODE")),
    put({This, 'SCORE'}, 'PaymentTransactionKeys':new("SCORE")),
    put({This, 'REASON1'}, 'PaymentTransactionKeys':new("REASON1")),
    put({This, 'REASON2'}, 'PaymentTransactionKeys':new("REASON2")),
    put({This, 'REASON3'}, 'PaymentTransactionKeys':new("REASON3")),
    put({This, 'EXCEPTION1'}, 'PaymentTransactionKeys':new("EXCEPTION1")),
    put({This, 'EXCEPTION2'}, 'PaymentTransactionKeys':new("EXCEPTION2")),
    put({This, 'EXCEPTION3'}, 'PaymentTransactionKeys':new("EXCEPTION3")),
    put({This, 'EXCEPTION4'}, 'PaymentTransactionKeys':new("EXCEPTION4")),
    put({This, 'EXCEPTION5'}, 'PaymentTransactionKeys':new("EXCEPTION5")),
    put({This, 'EXCEPTION6'}, 'PaymentTransactionKeys':new("EXCEPTION6")),
    put({This, 'EXCEPTION7'}, 'PaymentTransactionKeys':new("EXCEPTION7")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PaymentTransactionKeysFactory', instance}).

