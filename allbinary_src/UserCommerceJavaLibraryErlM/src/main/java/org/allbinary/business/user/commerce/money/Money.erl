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
% package org.allbinary.business.user.commerce.money
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonPhoneStrings

-module('Money').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, units}, undefined),
    put({This, 'DEFAULT_CURRENCY'}, "USD"),
    ok.


new(UsDollarStr) when (is_list(UsDollarStr) orelse UsDollarStr =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UsDollarStr),
    This;
new(Units) when is_integer(Units) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Units),
    This;
new(Money) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Money),
    This.

init(This, UsDollarStr) when (is_list(UsDollarStr) orelse UsDollarStr =:= undefined) ->
    init_fields(This),
        case ((UsDollarStr =/= undefined) andalso (fun(Target_N66000) -> (get({Target_N66000, '$class'})):isNumber(Target_N66000, UsDollarStr) end)('StringValidationUtil':getInstance())) of
            true ->
            put({This, units}, (get({This, '$class'})):convertUsdToUnits(This, UsDollarStr));
            false -> ok
        end;
init(This, Units) when is_integer(Units) ->
    init_fields(This),
        put({This, units}, Units);
init(This, Money) ->
    init_fields(This),
        put({This, units}, (get({Money, '$class'})):getUnits(Money)).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, units}, 0).



isValid(This) ->
        try
        case (((get({This, units}) =/= undefined) andalso ((get({get({This, units}), '$class'})):longValue(get({This, units})) > 0)) andalso ((get({get({This, units}), '$class'})):longValue(get({This, units})) < get({'Long', 'MAX_VALUE'}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

add(This, UsDollarStr) when (is_list(UsDollarStr) orelse UsDollarStr =:= undefined) ->
        put({This, units}, ((get({get({This, units}), '$class'})):longValue(get({This, units})) + (get({This, '$class'})):convertUsdToUnits(This, UsDollarStr)));
add(This, MoreMoney) ->
        (get({This, '$class'})):add(This, (get({MoreMoney, '$class'})):toString(MoreMoney)).


subtract(This, UsDollarStr) when (is_list(UsDollarStr) orelse UsDollarStr =:= undefined) ->
        put({This, units}, ((get({get({This, units}), '$class'})):longValue(get({This, units})) - (get({This, '$class'})):convertUsdToUnits(This, UsDollarStr))).

multiply(This, Multiplier) when is_integer(Multiplier) ->
        put({This, units}, ((get({get({This, units}), '$class'})):longValue(get({This, units})) * Multiplier));
multiply(This, Multiplier) ->
        put({This, units}, (fun(Target_N66747) -> (get({Target_N66747, '$class'})):longValue(Target_N66747) end)(((get({get({This, units}), '$class'})):longValue(get({This, units})) * (get({Multiplier, '$class'})):floatValue(Multiplier)))).


convertUnitsTo(This, Currency) when (is_list(Currency) orelse Currency =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        case ((get({Currency, '$class'})):compareTo(Currency, get({This, 'DEFAULT_CURRENCY'})) =:= 0) of
            true ->
            Dollar = ((get({get({This, units}), '$class'})):longValue(get({This, units})) / 100),
            Cents = ((get({get({This, units}), '$class'})):longValue(get({This, units})) - ((Dollar * 100))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({Dollar, '$class'})):toString(Dollar)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
            case (Cents < 10) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonPhoneStrings':getInstance(), 'ZERO'}));
                false -> ok
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({Cents, '$class'})):toString(Cents));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

convertUsdToUnits(This, UsDollarStr) when (is_list(UsDollarStr) orelse UsDollarStr =:= undefined) ->
        put({local, localUnit}, 0),
        Index = allbinary_java:index_of(UsDollarStr, get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
        StringUtil = 'StringUtil':getInstance(),
        put({local, dollarStr}, get({StringUtil, 'EMPTY_STRING'})),
        put({local, centsStr}, get({StringUtil, 'EMPTY_STRING'})),
        case (Index < 1) of
            true ->
            put({local, dollarStr}, allbinary_java:to_string(UsDollarStr)),
            put({local, centsStr}, "00");
            false ->
            put({local, dollarStr}, allbinary_java:to_string(string:slice(UsDollarStr, 0, (Index) - (0)))),
            put({local, centsStr}, allbinary_java:to_string(string:slice(UsDollarStr, (Index + 1))))
        end,
        put({local, localUnit}, (fun(Target_N67961) -> (get({Target_N67961, '$class'})):longValue(Target_N67961) end)(((get({get({local, dollarStr}), '$class'})):longValue(get({local, dollarStr})) * 100))),
        put({local, localUnit}, (get({local, localUnit}) + (get({get({local, centsStr}), '$class'})):longValue(get({local, centsStr})))),
        get({local, localUnit}).

getUnits(This) ->
        (get({get({This, units}), '$class'})):longValue(get({This, units})).

getUnitsLong(This) ->
        get({This, units}).

toString(This) ->
        allbinary_java:to_string((get({This, '$class'})):convertUnitsTo(This, get({This, 'DEFAULT_CURRENCY'}))).

