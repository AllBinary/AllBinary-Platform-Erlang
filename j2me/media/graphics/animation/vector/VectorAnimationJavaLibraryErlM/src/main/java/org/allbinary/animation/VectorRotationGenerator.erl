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
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.pipeline.BasicGraphicsPipeline
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleFactory
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListS
% import org.allbinary.vector.VectorInfo

-module('VectorRotationGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'VectorRotationGenerator':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, vectorAnimationUtil}, 'VectorAnimationUtil':getInstance()),
    put({This, angleFactory}, 'AngleFactory':getInstance()),
    ok.


getInstance() ->
        get({'VectorRotationGenerator', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance(This, VectorRotationInfo) ->
        (get({This, '$class'})):getInstanceFrames(This, (get({VectorRotationInfo, '$class'})):getWidth(VectorRotationInfo), (get({VectorRotationInfo, '$class'})):getHeight(VectorRotationInfo), (get({VectorRotationInfo, '$class'})):getPoints(VectorRotationInfo), (get({VectorRotationInfo, '$class'})):getTotalFrames(VectorRotationInfo)).

getInstanceFrames(This, Width, Height, Points, Frames) when is_integer(Width), is_integer(Height), (is_tuple(Points) orelse Points =:= undefined), is_integer(Frames) ->
        try
            TotalAngle = get({get({This, angleFactory}), 'TOTAL_ANGLE'}),
            AngleIncrement = (TotalAngle div Frames),
            PointsBasicArrayList = 'BasicArrayListS':new((TotalAngle div AngleIncrement)),
            PointBasicArrayList = 'BasicArrayListS':new(array:size(Points)),
            PointFactory = 'PointFactory':getInstance(),
            Size = array:size(Points),
            lists:foreach(fun(Index) ->
                (get({PointBasicArrayList, '$class'})):add(PointBasicArrayList, (get({PointFactory, '$class'})):createXY(PointFactory, array:get(0, array:get(Index, Points)), array:get(1, array:get(Index, Points))))
            end, lists:seq(0, Size - 1)),
            put({local, index}, 0),
            (fun Loop() -> case (get({local, index}) < TotalAngle) of true ->
                (get({PointsBasicArrayList, '$class'})):add(PointsBasicArrayList, (get({This, '$class'})):getListAtAngle(This, Width, Height, PointBasicArrayList, (get({get({This, angleFactory}), '$class'})):getAt(get({This, angleFactory}), get({local, index})))),
                put({local, index}, (get({local, index}) + AngleIncrement)),
                Loop();
            false -> ok end end)(),
            NewPoints = (get({get({This, vectorAnimationUtil}), '$class'})):toAnimationArrayFromListOfPointListWithPointsPerFrame(get({This, vectorAnimationUtil}), PointsBasicArrayList, (get({PointBasicArrayList, '$class'})):size(PointBasicArrayList)),
            NewPoints
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E),
            get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY_ARRAY'})
        end.

% throws Exception
getListAtAngle(This, Width, Height, PointBasicArrayList, Angle) when is_integer(Width), is_integer(Height) ->
        GraphicsPipe = 'BasicGraphicsPipeline':new(PointBasicArrayList),
        (get({GraphicsPipe, '$class'})):createMatrix(GraphicsPipe),
        (get({GraphicsPipe, '$class'})):translate(GraphicsPipe, (-((Width bsr 1))), (-((Height bsr 1)))),
        (get({GraphicsPipe, '$class'})):rotateToAngle(GraphicsPipe, Angle),
        (get({GraphicsPipe, '$class'})):translate(GraphicsPipe, ((Width bsr 1)), ((Height bsr 1))),
        (get({GraphicsPipe, '$class'})):getMatrix(GraphicsPipe).

