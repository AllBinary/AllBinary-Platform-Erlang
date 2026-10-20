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
% package org.allbinary.vector

-module('PointsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PointsUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PointsUtil', instance}).

adjustXY(This, Points, X, Y) when (is_tuple(Points) orelse Points =:= undefined), is_integer(X), is_integer(Y) ->
        Size = array:size(Points),
        NewPoints = ok % Otherwise - newArray - 3
,
        lists:foreach(fun(Index) ->
            Size2 = array:size(array:get(Index, Points)),
            array:set(Index, array:new(Size2, {default, array:new(2, {default, 0})}), NewPoints),
            lists:foreach(fun(Index2) ->
                case (array:get(0, array:get(Index2, array:get(Index, Points))) =/= 1000) of
                    true ->
                    array:set(Index, array:set(Index2, array:set(0, (array:get(0, array:get(Index2, array:get(Index, Points))) + X), array:get(Index2, array:get(Index, NewPoints))), array:get(Index, NewPoints)), NewPoints),
                    array:set(Index, array:set(Index2, array:set(1, (array:get(1, array:get(Index2, array:get(Index, Points))) + Y), array:get(Index2, array:get(Index, NewPoints))), array:get(Index, NewPoints)), NewPoints);
                    false ->
                    array:set(Index, array:set(Index2, array:set(0, 1000, array:get(Index2, array:get(Index, NewPoints))), array:get(Index, NewPoints)), NewPoints),
                    array:set(Index, array:set(Index2, array:set(1, 1000, array:get(Index2, array:get(Index, NewPoints))), array:get(Index, NewPoints)), NewPoints)
                end
            end, lists:seq(0, Size2 - 1))
        end, lists:seq(0, Size - 1)),
        NewPoints.

adjust(This, Points, Both) when (is_tuple(Points) orelse Points =:= undefined), is_integer(Both) ->
        (get({This, '$class'})):adjust(This, Points, Both, Both).

adjust(This, Points, X, Y) when (is_tuple(Points) orelse Points =:= undefined), is_integer(X), is_integer(Y) ->
        NewPoints = array:new(array:size(Points), {default, array:new(2, {default, 0})}),
        lists:foreach(fun(Index2) ->
            case (array:get(0, array:get(Index2, Points)) =/= 1000) of
                true ->
                array:set(Index2, array:set(0, (array:get(0, array:get(Index2, Points)) + X), array:get(Index2, NewPoints)), NewPoints),
                array:set(Index2, array:set(1, (array:get(1, array:get(Index2, Points)) + Y), array:get(Index2, NewPoints)), NewPoints);
                false ->
                array:set(Index2, array:set(0, 1000, array:get(Index2, NewPoints)), NewPoints),
                array:set(Index2, array:set(1, 1000, array:get(Index2, NewPoints)), NewPoints)
            end
        end, lists:seq(0, array:size(Points) - 1)),
        NewPoints.

