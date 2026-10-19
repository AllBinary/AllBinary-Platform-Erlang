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
% package org.allbinary.graphics.pipeline
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.math.Angle
% import org.allbinary.math.NoDecimalTrigTable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicGraphicsPipeline').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, pointBasicArrayList}, undefined),
    put({This, noDecimalTrigTable}, 'NoDecimalTrigTable':getInstance()),
    ok.


new(Points) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Points),
    This.

init(This, Points) ->
    init_fields(This),
        put({This, pointBasicArrayList}, Points).

setInitMatrix(This, Points) ->
        put({This, pointBasicArrayList}, Points).

createMatrix(This) ->
        ok.

% throws Exception
translate(This, X, Y) when is_integer(X), is_integer(Y) ->
        NewBasicArrayList = 'BasicArrayListD':new(),
        Size = (get({get({This, pointBasicArrayList}), '$class'})):size(get({This, pointBasicArrayList})),
        PointFactory = 'PointFactory':getInstance(),
        put({local, secondPoint}, undefined),
        lists:foreach(fun(Index) ->
            put({local, secondPoint}, array:get(Index, get({get({This, pointBasicArrayList}), objectArray}))),
            case ((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) =/= 1000) of
                true ->
                (get({NewBasicArrayList, '$class'})):add(NewBasicArrayList, (get({PointFactory, '$class'})):createXY(PointFactory, ((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) + X), ((get({get({local, secondPoint}), '$class'})):getY(get({local, secondPoint})) + Y)));
                false ->
                (get({NewBasicArrayList, '$class'})):add(NewBasicArrayList, get({local, secondPoint}))
            end
        end, lists:seq(0, Size - 1)),
        put({This, pointBasicArrayList}, NewBasicArrayList).

% throws Exception
rotateToAngle(This, Angle) ->
        (get({This, '$class'})):rotate(This, trunc((get({Angle, '$class'})):getValue(Angle))).

% throws Exception
rotate(This, Angle) when is_integer(Angle) ->
        NewBasicArrayList = 'BasicArrayListD':new(),
        put({local, secondPoint}, undefined),
        put({local, y}, 0),
        put({local, secondX}, 0),
        put({local, secondY}, 0),
        put({local, point}, undefined),
        PointFactory = 'PointFactory':getInstance(),
        Size = (get({get({This, pointBasicArrayList}), '$class'})):size(get({This, pointBasicArrayList})),
        put({local, sin}, 0),
        put({local, cos}, 0),
        lists:foreach(fun(Index) ->
            put({local, secondPoint}, array:get(Index, get({get({This, pointBasicArrayList}), objectArray}))),
            case ((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) =/= 1000) of
                true ->
                put({local, sin}, (get({get({This, noDecimalTrigTable}), '$class'})):sin(get({This, noDecimalTrigTable}), Angle)),
                put({local, cos}, (get({get({This, noDecimalTrigTable}), '$class'})):cos(get({This, noDecimalTrigTable}), Angle)),
                put({local, y}, ((get({get({local, secondPoint}), '$class'})):getY(get({local, secondPoint})) * get({local, sin}))),
                put({local, secondX}, ((((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) * get({local, cos}))) - get({local, y}))),
                put({local, secondY}, ((((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) * get({local, sin}))) + (((get({get({local, secondPoint}), '$class'})):getY(get({local, secondPoint})) * get({local, cos}))))),
                put({local, point}, (get({PointFactory, '$class'})):createXY(PointFactory, (get({local, secondX}) div 10000), (get({local, secondY}) div 10000))),
                (get({NewBasicArrayList, '$class'})):add(NewBasicArrayList, get({local, point}));
                false ->
                (get({NewBasicArrayList, '$class'})):add(NewBasicArrayList, get({local, secondPoint}))
            end
        end, lists:seq(0, Size - 1)),
        put({This, pointBasicArrayList}, NewBasicArrayList).

% throws Exception
mirror(This, Width) when is_integer(Width) ->
        PointFactory = 'PointFactory':getInstance(),
        HalfWidth = ((Width bsr 1)),
        NewBasicArrayList = 'BasicArrayListD':new(),
        put({local, secondPoint}, undefined),
        put({local, newX}, 0),
        put({local, point}, undefined),
        Size = (get({get({This, pointBasicArrayList}), '$class'})):size(get({This, pointBasicArrayList})),
        lists:foreach(fun(Index) ->
            put({local, secondPoint}, array:get(Index, get({get({This, pointBasicArrayList}), objectArray}))),
            case ((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) =/= 1000) of
                true ->
                put({local, newX}, 0),
                case ((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) > HalfWidth) of
                    true ->
                    put({local, newX}, (HalfWidth - (((get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint})) - HalfWidth))));
                    false ->
                    put({local, newX}, (HalfWidth + ((HalfWidth - (get({get({local, secondPoint}), '$class'})):getX(get({local, secondPoint}))))))
                end,
                put({local, point}, (get({PointFactory, '$class'})):createXY(PointFactory, get({local, newX}), (get({get({local, secondPoint}), '$class'})):getY(get({local, secondPoint})))),
                (get({NewBasicArrayList, '$class'})):add(NewBasicArrayList, get({local, point}));
                false ->
                (get({NewBasicArrayList, '$class'})):add(NewBasicArrayList, get({local, secondPoint}))
            end
        end, lists:seq(0, Size - 1)),
        put({This, pointBasicArrayList}, NewBasicArrayList).

getMatrix(This) ->
        get({This, pointBasicArrayList}).

