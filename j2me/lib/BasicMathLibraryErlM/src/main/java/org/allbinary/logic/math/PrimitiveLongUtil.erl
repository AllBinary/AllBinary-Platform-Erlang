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
% package org.allbinary.logic.math
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('PrimitiveLongUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, powerOfTen}, 0),
    put({This, maxValue}, 0),
    put({This, maxDigits}, 0),
    put({This, charArray}, undefined),
    put({This, currentTotalDigits}, 0),
    put({This, primitiveLongSingleton}, 'PrimitiveLongSingleton':getInstance()),
    ok.


createPowerOfTen(PowerOfTen) when is_integer(PowerOfTen) ->
        PrimitiveLongUtil = 'PrimitiveLongUtil':new(PowerOfTen, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
        case ((PowerOfTen rem 10) =/= 0) of
            true ->
            LogUtil = 'LogUtil':getInstance(),
            CommonStrings = 'CommonStrings':getInstance(),
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), PrimitiveLongUtil, get({CommonStrings, 'CONSTRUCTOR'}), {'Exception', "Max must be power of 10"});
            false -> ok
        end,
        PrimitiveLongUtil.

new(PowerOfTen, Unused) when is_integer(PowerOfTen) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PowerOfTen, Unused),
    This.

'$init'(This, PowerOfTen, Unused) when is_integer(PowerOfTen) ->
    init_fields(This),
        put({This, maxDigits}, (fun(Target_N66299) -> (get({Target_N66299, '$class'})):getTotalDigits(Target_N66299, PowerOfTen) end)('MathUtil':getInstance())),
        put({This, powerOfTen}, PowerOfTen),
        put({This, maxValue}, (((PowerOfTen * 10)) - 1)),
        put({This, charArray}, array:new(get({This, maxDigits}), {default, 0})).

getCharArray(This, Value) when is_integer(Value) ->
        try
        case (Value < 10) of
            true ->
            (get({This, '$class'})):setCurrentTotalDigits(This, 1),
            throw({'$return', array:get(Value, get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAYS'}))});
            false -> ok
        end,
        case (Value > get({This, maxValue})) of
            true ->
            (get({This, '$class'})):setCurrentTotalDigits(This, 3),
            throw({'$return', get({get({This, primitiveLongSingleton}), 'UNK'})});
            false -> ok
        end,
        put({local, index}, 0),
        put({local, 'div'}, get({This, powerOfTen})),
        put({local, lastValue}, 0),
        (fun Loop() -> case (get({local, 'div'}) >= 1) of true ->
            Digit = (((Value - get({local, lastValue}))) div get({local, 'div'})),
            case ((Digit >= 0) andalso (Digit < 10)) of
                true ->
                case ((Digit =:= 0) andalso (get({local, index}) =:= 0)) of
                    true ->
                    ok;
                    false ->
                    put({This, charArray}, array:set(allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1)), array:get(Digit, get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAY'})), get({This, charArray})))
                end,
                put({local, lastValue}, (get({local, lastValue}) + (Digit * get({local, 'div'}))));
                false -> ok
            end,
            put({local, 'div'}, (get({local, 'div'}) div 10)),
            Loop();
        false -> ok end end)(),
        (get({This, '$class'})):setCurrentTotalDigits(This, get({local, index})),
        get({This, charArray})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setCurrentTotalDigits(This, CurrentTotalDigits) when is_integer(CurrentTotalDigits) ->
        put({This, currentTotalDigits}, CurrentTotalDigits).

getCurrentTotalDigits(This) ->
        get({This, currentTotalDigits}).

getMaxDigits(This) ->
        get({This, maxDigits}).

