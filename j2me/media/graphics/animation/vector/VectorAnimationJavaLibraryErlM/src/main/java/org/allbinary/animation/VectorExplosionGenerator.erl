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
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.pipeline.RandomRotationFactory
% import org.allbinary.graphics.pipeline.RandomTranslation
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListS

-module('VectorExplosionGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'VectorExplosionGenerator':new()),
    ok.

init_fields(This) ->
    put({This, 'RANDOM'}, 'VectorExplosionType':new()),
    put({This, 'ROTATION'}, 'VectorExplosionType':new()),
    put({This, vectorAnimationUtil}, 'VectorAnimationUtil':getInstance()),
    put({This, randomRotationFactory}, 'RandomRotationFactory':getInstance()),
    ok.


getInstance() ->
        get({'VectorExplosionGenerator', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
createList(This, List, HowMuch, Type) when is_integer(HowMuch) ->
        put({local, point}, undefined),
        Size = (get({List, '$class'})):size(List),
        Points = array:new(Size, {default, array:new(2, {default, 0})}),
        lists:foreach(fun(Index) ->
            put({local, point}, array:get(Index, get({List, objectArray}))),
            array:set(Index, array:set(0, (get({get({local, point}), '$class'})):getX(get({local, point})), array:get(Index, Points)), Points),
            array:set(Index, array:set(1, (get({get({local, point}), '$class'})):getY(get({local, point})), array:get(Index, Points)), Points)
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):createListFromPoints(This, List, Points, HowMuch, Type).

% throws Exception
getInstance(This, Points, HowMuch, Type) when (is_tuple(Points) orelse Points =:= undefined), is_integer(HowMuch) ->
        PointsBasicArrayList = (get({This, '$class'})):getInstanceStartFrame(This, Points, HowMuch, Type, true),
        TempBasicArrayList = array:get(0, get({PointsBasicArrayList, objectArray})),
        NewPoints = (get({get({This, vectorAnimationUtil}), '$class'})):toAnimationArrayFromListOfPointListWithPointsPerFrame(get({This, vectorAnimationUtil}), PointsBasicArrayList, (get({TempBasicArrayList, '$class'})):size(TempBasicArrayList)),
        NewPoints.

% throws Exception
getInstanceStartFrame(This, Points, HowMuch, Type, StartFrame) when (is_tuple(Points) orelse Points =:= undefined), is_integer(HowMuch), is_boolean(StartFrame) ->
        try
            PointsBasicArrayList = 'BasicArrayListS':new(HowMuch),
            (get({PointsBasicArrayList, '$class'})):add(PointsBasicArrayList, (get({This, '$class'})):createPointsBasicArrayList(This, Points)),
            put({local, frameIndex}, 0),
            put({local, tempBasicArrayList}, undefined),
            put({local, pointBasicArrayList}, undefined),
            (fun Loop() -> case (get({local, frameIndex}) < HowMuch) of true ->
                put({local, tempBasicArrayList}, array:get(get({local, frameIndex}), get({PointsBasicArrayList, objectArray}))),
                put({local, pointBasicArrayList}, (get({This, '$class'})):createListFromPoints(This, get({local, tempBasicArrayList}), Points, HowMuch, Type)),
                (get({PointsBasicArrayList, '$class'})):add(PointsBasicArrayList, get({local, pointBasicArrayList})),
                put({local, frameIndex}, get({local, frameIndex}) + 1),
                Loop();
            false -> ok end end)(),
            case (not StartFrame) of
                true ->
                (get({PointsBasicArrayList, '$class'})):removeAt(PointsBasicArrayList, 0);
                false -> ok
            end,
            PointsBasicArrayList
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
createListFromPoints(This, TempBasicArrayList, Points, HowMuch, Type) when (is_tuple(Points) orelse Points =:= undefined), is_integer(HowMuch) ->
        put({local, index}, 0),
        PointBasicArrayList = 'BasicArrayListD':new(),
        put({local, sectionBasicArrayList}, undefined),
        (fun Loop() -> case (get({local, index}) < array:size(Points)) of true ->
            put({local, sectionBasicArrayList}, 'BasicArrayListD':new()),
            (fun Loop() -> case (array:get(0, array:get(get({local, index}), Points)) =/= 1000) of true ->
                (get({get({local, sectionBasicArrayList}), '$class'})):add(get({local, sectionBasicArrayList}), array:get(get({local, index}), get({TempBasicArrayList, objectArray}))),
                put({local, index}, get({local, index}) + 1),
                case (get({local, index}) >= array:size(Points)) of
                    true ->
                    throw('$break');
                    false -> ok
                end,
                Loop();
            false -> ok end end)(),
            put({local, sectionBasicArrayList}, 'RandomTranslation':getInstance(get({local, sectionBasicArrayList}), HowMuch)),
            case (Type =:= get({This, 'ROTATION'})) of
                true ->
                put({local, sectionBasicArrayList}, (get({get({This, randomRotationFactory}), '$class'})):getInstanceList(get({This, randomRotationFactory}), get({local, sectionBasicArrayList}), HowMuch));
                false -> ok
            end,
            Size = (get({get({local, sectionBasicArrayList}), '$class'})):size(get({local, sectionBasicArrayList})),
            lists:foreach(fun(Index2) ->
                (get({PointBasicArrayList, '$class'})):add(PointBasicArrayList, array:get(Index2, get({get({local, sectionBasicArrayList}), objectArray})))
            end, lists:seq(0, Size - 1)),
            case (get({local, index}) >= array:size(Points)) of
                true ->
                throw('$break');
                false ->
                case (array:get(0, array:get(get({local, index}), Points)) =:= 1000) of
                true ->
                (get({PointBasicArrayList, '$class'})):add(PointBasicArrayList, array:get(get({local, index}), get({TempBasicArrayList, objectArray}))),
                put({local, index}, get({local, index}) + 1);
                false -> ok
            end
            end,
            Loop();
        false -> ok end end)(),
        PointBasicArrayList.

% throws Exception
createPointsBasicArrayList(This, Points) when (is_tuple(Points) orelse Points =:= undefined) ->
        case (array:size(Points) =:= 0) of
            true ->
            erlang:error({'Exception', "Not Points Provided"});
            false -> ok
        end,
        FirstPointBasicArrayList = 'BasicArrayListS':new(array:size(Points)),
        PointFactory = 'PointFactory':getInstance(),
        lists:foreach(fun(Index) ->
            (get({FirstPointBasicArrayList, '$class'})):add(FirstPointBasicArrayList, (get({PointFactory, '$class'})):createXY(PointFactory, array:get(0, array:get(Index, Points)), array:get(1, array:get(Index, Points))))
        end, lists:seq(0, array:size(Points) - 1)),
        FirstPointBasicArrayList.

