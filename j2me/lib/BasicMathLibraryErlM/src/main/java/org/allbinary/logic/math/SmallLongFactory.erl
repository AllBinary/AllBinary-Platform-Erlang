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

-module('SmallLongFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SmallLongFactory':new()),
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
        get({'SmallLongFactory', instance}).

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
        case (array:get(0, get({This, 'INTEGER_ARRAY'})) =:= undefined) of
            true ->
            case ((get({This, lastMin}) < get({This, 'POSITIVE_MAX'})) orelse (get({This, lastNegativeMin}) < get({This, 'NEGATIVE_MAX'}))) of
                true ->
                lists:foreach(fun(Index) ->
                    put({This, 'INTEGER_ARRAY'}, array:set((Index + get({This, 'NEGATIVE_MAX'})), Index, get({This, 'INTEGER_ARRAY'})))
                end, lists:seq((get({This, 'POSITIVE_MAX'}) - 1), get({This, lastMin}), -1)),
                lists:foreach(fun(Index) ->
                    put({This, 'INTEGER_ARRAY'}, array:set(Index, (-Index), get({This, 'INTEGER_ARRAY'})))
                end, lists:seq((get({This, 'NEGATIVE_MAX'}) - 1), get({This, lastNegativeMin}), -1)),
                put({This, lastMin}, get({This, 'POSITIVE_MAX'})),
                put({This, lastNegativeMin}, get({This, 'NEGATIVE_MAX'}));
                false -> ok
            end;
            false -> ok
        end.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstanceNoThrow(This, Index) when is_integer(Index) ->
        try
        case ((Index + get({This, 'NEGATIVE_MAX'})) > (array:size(get({This, 'INTEGER_ARRAY'})) - 1)) of
            true ->
            throw({'$return', array:get(((-1) + get({This, 'NEGATIVE_MAX'})), get({This, 'INTEGER_ARRAY'}))});
            false -> ok
        end,
        array:get(((Index) + get({This, 'NEGATIVE_MAX'})), get({This, 'INTEGER_ARRAY'}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getString(This, Index) when is_integer(Index) ->
        I = (Index + get({This, 'NEGATIVE_MAX'})),
        case (array:get(I, get({This, 'STRING_ARRAY'})) =:= undefined) of
            true ->
            put({This, 'STRING_ARRAY'}, array:set(I, (fun(Target_N67421) -> (get({Target_N67421, '$class'})):toString(Target_N67421) end)(array:get(I, get({This, 'INTEGER_ARRAY'}))), get({This, 'STRING_ARRAY'})));
            false -> ok
        end,
        array:get(I, get({This, 'STRING_ARRAY'})).

