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
% import org.allbinary.AndroidUtil
% import org.allbinary.J2MEUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker

-module('SmallIntegerSingletonFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SmallIntegerSingletonFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NEGATIVE_MAX'}, 500),
    put({This, 'POSITIVE_MAX'}, 16#2D1),
    put({This, 'INTEGER_ARRAY'}, array:new((get({This, 'NEGATIVE_MAX'}) + get({This, 'POSITIVE_MAX'})), {default, undefined})),
    put({This, 'STRING_ARRAY'}, array:new((get({This, 'NEGATIVE_MAX'}) + get({This, 'POSITIVE_MAX'})), {default, undefined})),
    put({This, 'MIN'}, 0),
    put({This, lastMin}, 0),
    put({This, lastNegativeMin}, 0),
    ok.


getInstance() ->
        get({'SmallIntegerSingletonFactory', instance}).

getMin(This) ->
        MinAllowed = (get({This, '$class'})):getMinAllowed(This),
        case (get({This, 'MIN'}) =< MinAllowed) of
            true ->
            case 'J2MEUtil':isJ2ME() of
                true ->
                ok;
                false ->
                case 'AndroidUtil':isAndroid() of
                true ->
                put({local, logUtil}, 'LogUtil':getInstance()),
                (get({get({local, logUtil}), '$class'})):putF(get({local, logUtil}), (fun(Target_N66492) -> (get({Target_N66492, '$class'})):toString(Target_N66492) end)((fun(Target_N66499) -> (get({Target_N66499, '$class'})):appendint(Target_N66499, get({This, 'MIN'})) end)((fun(Target_N66506) -> (get({Target_N66506, '$class'})):append(Target_N66506, "Android InputFactory was initialized before GameMidlet: ") end)('StringMaker':new()))), This, "getMin"),
                (get({This, '$class'})):initWithRange(This, 16#291, 6);
                false ->
                put({local, logUtil}, 'LogUtil':getInstance()),
                (get({get({local, logUtil}), '$class'})):putF(get({local, logUtil}), (fun(Target_N66322) -> (get({Target_N66322, '$class'})):toString(Target_N66322) end)((fun(Target_N66329) -> (get({Target_N66329, '$class'})):appendint(Target_N66329, get({This, 'MIN'})) end)((fun(Target_N66336) -> (get({Target_N66336, '$class'})):append(Target_N66336, "InputFactory was initialized before GameMidlet or KeyFactoryInitializer - Currently this is occurs on JS build by TouchMotionGestureFactory constructor: ") end)('StringMaker':new()))), This, "getMin"),
                (get({This, '$class'})):initWithRange(This, 16#2D0, 6)
            end
            end;
            false -> ok
        end,
        case (get({This, 'MIN'}) =< MinAllowed) of
            true ->
            put({local, logUtil}, 'LogUtil':getInstance()),
            (get({get({local, logUtil}), '$class'})):put(get({local, logUtil}), "This means you loaded the InputFactory before determining the platform input size requirements.", This, "getMin", {'Exception'});
            false -> ok
        end,
        get({This, 'MIN'}).

getMinAllowed(This) ->
        try
        case 'J2MEUtil':isJ2ME() of
            true ->
            throw({'$return', 0});
            false ->
            case 'AndroidUtil':isAndroid() of
                true ->
                throw({'$return', 16#101});
                false ->
                throw({'$return', 23})
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

initWithRange(This, Value, NegativeValue) when is_integer(Value), is_integer(NegativeValue) ->
        lists:foreach(fun(Index) ->
            put({This, 'INTEGER_ARRAY'}, array:set((Index + get({This, 'NEGATIVE_MAX'})), Index, get({This, 'INTEGER_ARRAY'})))
        end, lists:seq((Value - 1), get({This, lastMin}), -1)),
        lists:foreach(fun(Index) ->
            put({This, 'INTEGER_ARRAY'}, array:set(Index, (-Index), get({This, 'INTEGER_ARRAY'})))
        end, lists:seq((NegativeValue - 1), get({This, lastNegativeMin}), -1)),
        case (get({This, lastMin}) < Value) of
            true ->
            put({This, lastMin}, Value),
            put({This, 'MIN'}, Value);
            false -> ok
        end,
        case (get({This, lastNegativeMin}) < NegativeValue) of
            true ->
            put({This, lastNegativeMin}, NegativeValue);
            false -> ok
        end.

init(This) ->
        case ((get({This, lastMin}) < get({This, 'POSITIVE_MAX'})) orelse (get({This, lastNegativeMin}) < get({This, 'NEGATIVE_MAX'}))) of
            true ->
            lists:foreach(fun(Index) ->
                put({This, 'INTEGER_ARRAY'}, array:set((Index + get({This, 'NEGATIVE_MAX'})), Index, get({This, 'INTEGER_ARRAY'})))
            end, lists:seq((get({This, 'POSITIVE_MAX'}) - 1), get({This, lastMin}), -1)),
            lists:foreach(fun(Index) ->
                put({This, 'INTEGER_ARRAY'}, array:set(Index, (-Index), get({This, 'INTEGER_ARRAY'})))
            end, lists:seq((get({This, 'NEGATIVE_MAX'}) - 1), get({This, lastNegativeMin}), -1)),
            put({This, lastMin}, get({This, 'POSITIVE_MAX'})),
            put({This, 'MIN'}, get({This, lastMin})),
            put({This, lastNegativeMin}, get({This, 'NEGATIVE_MAX'}));
            false -> ok
        end.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({This, '$class'})):initWithRange(This, 23, 0).

getAt(This, Index) when is_integer(Index) ->
        array:get((Index + get({This, 'NEGATIVE_MAX'})), get({This, 'INTEGER_ARRAY'})).

getAtNoThrow(This, Index) when is_integer(Index) ->
        try
        case ((Index + get({This, 'NEGATIVE_MAX'})) > (array:size(get({This, 'INTEGER_ARRAY'})) - 1)) of
            true ->
            throw({'$return', array:get(((-1) + get({This, 'NEGATIVE_MAX'})), get({This, 'INTEGER_ARRAY'}))});
            false -> ok
        end,
        array:get((Index + get({This, 'NEGATIVE_MAX'})), get({This, 'INTEGER_ARRAY'}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

createInstance(This, Index) when is_integer(Index) ->
        put({local, integer}, (get({This, '$class'})):getAt(This, Index)),
        case (get({local, integer}) =:= undefined) of
            true ->
            put({local, integer}, Index);
            false -> ok
        end,
        get({local, integer}).

getString(This, Index) when is_integer(Index) ->
        I = (Index + get({This, 'NEGATIVE_MAX'})),
        case (array:get(I, get({This, 'STRING_ARRAY'})) =:= undefined) of
            true ->
            put({This, 'STRING_ARRAY'}, array:set(I, (fun(Target_N68564) -> (get({Target_N68564, '$class'})):toString(Target_N68564) end)(array:get(I, get({This, 'INTEGER_ARRAY'}))), get({This, 'STRING_ARRAY'})));
            false -> ok
        end,
        array:get(I, get({This, 'STRING_ARRAY'})).

