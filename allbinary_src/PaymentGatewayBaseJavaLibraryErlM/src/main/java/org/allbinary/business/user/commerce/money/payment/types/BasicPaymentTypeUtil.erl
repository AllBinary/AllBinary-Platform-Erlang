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
% package org.allbinary.business.user.commerce.money.payment.types
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil

-module('BasicPaymentTypeUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicPaymentTypeUtil':new()),
        ok,
    ok.

init_fields(This) ->
    put({This, paymentTypeVector}, 'BasicArrayListD':new()),
    ok.



getInstance() ->
        get({'BasicPaymentTypeUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

add(This, PaymentType) ->
        (get({get({This, paymentTypeVector}), '$class'})):add(get({This, paymentTypeVector}), PaymentType).

% throws Exception
get(This, PaymentTypeString) when (is_list(PaymentTypeString) orelse PaymentTypeString =:= undefined) ->
        try
        Size = (get({get({This, paymentTypeVector}), '$class'})):size(get({This, paymentTypeVector})),
        lists:foreach(fun(I) ->
            PaymentType = (get({get({This, paymentTypeVector}), '$class'})):get(get({This, paymentTypeVector}), I),
            case ((fun(Target_N66071) -> (get({Target_N66071, '$class'})):compareTo(Target_N66071, PaymentTypeString) end)((get({PaymentType, '$class'})):getName(PaymentType)) =:= 0) of
                true ->
                throw({'$return', PaymentType});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', lists:concat(["Unknown PaymentType: ", PaymentTypeString])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isContain(This, PaymentType) ->
        (get({get({This, paymentTypeVector}), '$class'})):contains(get({This, paymentTypeVector}), PaymentType).

difference(This, A_PaymentTypeVector) ->
        Diff = 'BasicArrayListD':new(),
        Size = (get({get({This, paymentTypeVector}), '$class'})):size(get({This, paymentTypeVector})),
        lists:foreach(fun(I) ->
            PaymentType = (get({get({This, paymentTypeVector}), '$class'})):get(get({This, paymentTypeVector}), I),
            case (not (get({A_PaymentTypeVector, '$class'})):contains(A_PaymentTypeVector, PaymentType)) of
                true ->
                (get({Diff, '$class'})):add(Diff, PaymentType);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Diff.

