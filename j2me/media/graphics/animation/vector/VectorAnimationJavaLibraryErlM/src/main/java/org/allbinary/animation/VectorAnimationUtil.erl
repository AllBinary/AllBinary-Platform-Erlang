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
% package org.allbinary.animation
% import org.allbinary.graphics.GPoint
% import org.allbinary.util.BasicArrayList

-module('VectorAnimationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'VectorAnimationUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'VectorAnimationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

toAnimationArrayFromListOfPointListWithPointsPerFrame(This, Vector, PointsPerFrame) when is_integer(PointsPerFrame) ->
        Size = (get({Vector, '$class'})):size(Vector),
        Points = ok % Otherwise - newArray - 3
,
        put({local, nextBasicArrayList}, undefined),
        put({local, framePoints}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextBasicArrayList}, array:get(Index, get({Vector, objectArray}))),
            put({local, framePoints}, (get({This, '$class'})):toFrameArrayFromPointBasicArrayList(This, get({local, nextBasicArrayList}))),
            lists:foreach(fun(PointIndex) ->
                array:set(Index, array:set(PointIndex, array:set(0, array:get(0, array:get(PointIndex, get({local, framePoints}))), array:get(PointIndex, array:get(Index, Points))), array:get(Index, Points)), Points),
                array:set(Index, array:set(PointIndex, array:set(1, array:get(1, array:get(PointIndex, get({local, framePoints}))), array:get(PointIndex, array:get(Index, Points))), array:get(Index, Points)), Points)
            end, lists:seq(0, array:size(get({local, framePoints})) - 1))
        end, lists:seq(0, Size - 1)),
        Points.

toAnimationArrayFromListOfPointList(This, Vector) ->
        Size = (get({Vector, '$class'})):size(Vector),
        Points = ok % Otherwise - newArray - 3
,
        put({local, nextBasicArrayList}, undefined),
        put({local, framePoints}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextBasicArrayList}, array:get(Index, get({Vector, objectArray}))),
            put({local, framePoints}, (get({This, '$class'})):toFrameArrayFromPointBasicArrayList(This, get({local, nextBasicArrayList}))),
            array:set(Index, array:new(array:size(get({local, framePoints})), {default, array:new(2, {default, 0})}), Points),
            lists:foreach(fun(PointIndex) ->
                array:set(Index, array:set(PointIndex, array:set(0, array:get(0, array:get(PointIndex, get({local, framePoints}))), array:get(PointIndex, array:get(Index, Points))), array:get(Index, Points)), Points),
                array:set(Index, array:set(PointIndex, array:set(1, array:get(1, array:get(PointIndex, get({local, framePoints}))), array:get(PointIndex, array:get(Index, Points))), array:get(Index, Points)), Points)
            end, lists:seq(0, array:size(get({local, framePoints})) - 1))
        end, lists:seq(0, Size - 1)),
        Points.

toFrameArrayFromPointBasicArrayList(This, List) ->
        Points = array:new((get({List, '$class'})):size(List), {default, array:new(2, {default, 0})}),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            NextPoint = array:get(Index, get({List, objectArray})),
            array:set(Index, array:set(0, (get({NextPoint, '$class'})):getX(NextPoint), array:get(Index, Points)), Points),
            array:set(Index, array:set(1, (get({NextPoint, '$class'})):getY(NextPoint), array:get(Index, Points)), Points)
        end, lists:seq(0, Size - 1)),
        Points.

