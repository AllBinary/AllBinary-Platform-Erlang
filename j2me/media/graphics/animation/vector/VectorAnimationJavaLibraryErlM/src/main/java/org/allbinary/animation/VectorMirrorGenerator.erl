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
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListS

-module('VectorMirrorGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'VectorMirrorGenerator':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, vectorAnimationUtil}, 'VectorAnimationUtil':getInstance()),
    ok.


getInstance() ->
        get({'VectorMirrorGenerator', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance(This, Points, Width) when (is_tuple(Points) orelse Points =:= undefined), is_integer(Width) ->
        try
            PointFactory = 'PointFactory':getInstance(),
            put({local, pointBasicArrayList}, undefined),
            put({local, nextPoints}, undefined),
            put({local, size2}, 0),
            Size = array:size(Points),
            PointsBasicArrayList = 'BasicArrayListS':new(Size),
            lists:foreach(fun(Frame) ->
                put({local, nextPoints}, array:get(Frame, Points)),
                put({local, size2}, array:size(get({local, nextPoints}))),
                put({local, pointBasicArrayList}, 'BasicArrayListS':new(get({local, size2}))),
                lists:foreach(fun(Index) ->
                    (get({get({local, pointBasicArrayList}), '$class'})):add(get({local, pointBasicArrayList}), (get({PointFactory, '$class'})):createXY(PointFactory, array:get(0, array:get(Index, get({local, nextPoints}))), array:get(1, array:get(Index, get({local, nextPoints})))))
                end, lists:seq(0, get({local, size2}) - 1)),
                (get({PointsBasicArrayList, '$class'})):add(PointsBasicArrayList, get({local, pointBasicArrayList}))
            end, lists:seq(0, Size - 1)),
            lists:foreach(fun(Index) ->
                (get({PointsBasicArrayList, '$class'})):add(PointsBasicArrayList, (get({This, '$class'})):getInstance(This, array:get(Index, get({PointsBasicArrayList, objectArray})), Width))
            end, lists:seq(0, array:size(Points) - 1)),
            NewPoints = (get({get({This, vectorAnimationUtil}), '$class'})):toAnimationArrayFromListOfPointList(get({This, vectorAnimationUtil}), PointsBasicArrayList),
            NewPoints
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E),
            get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY_ARRAY'})
        end;
% throws Exception
getInstance(This, PointBasicArrayList, Width) when is_integer(Width) ->
        GraphicsPipe = 'BasicGraphicsPipeline':new(PointBasicArrayList),
        (get({GraphicsPipe, '$class'})):createMatrix(GraphicsPipe),
        (get({GraphicsPipe, '$class'})):mirror(GraphicsPipe, Width),
        (get({GraphicsPipe, '$class'})):getMatrix(GraphicsPipe).


