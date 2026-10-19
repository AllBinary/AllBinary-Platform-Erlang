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
% package org.allbinary.animation.vector
% import java.util.HashMap
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface
% import org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem
% import org.allbinary.graphics.j2me.workarea.tools.Points
% import org.allbinary.graphics.pipeline.BasicGraphicsPipeline
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('VectorCenterGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, minX}, get({'Integer', 'MAX_VALUE'})),
    put({This, minY}, get({'Integer', 'MAX_VALUE'})),
    put({This, maxX}, get({'Integer', 'MIN_VALUE'})),
    put({This, maxY}, get({'Integer', 'MIN_VALUE'})),
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, width}, 0),
    put({This, height}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
calculate(This, HashMap) ->
        GraphicItemArray = (fun(Target_N66314) -> (get({Target_N66314, '$class'})):toArray(Target_N66314) end)((get({HashMap, '$class'})):keySet(HashMap)),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            Item = (get({HashMap, '$class'})):get(HashMap, array:get(Index, GraphicItemArray)),
            case ((get({Item, '$class'})):getName(Item) =:= 'LinesGraphicItem':getStaticName()) of
                true ->
                (get({This, '$class'})):getInstance(This, (fun(Target_N66551) -> (get({Target_N66551, '$class'})):getPoints(Target_N66551) end)((get({Item, '$class'})):getPointsInterface(Item)));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["minX: ", get({This, minX})]), " minY: "]), get({This, minY})]), " maxX: "]), get({This, maxX})]), " maxY: "]), get({This, maxY})]), This, get({get({This, commonStrings}), 'GET_INSTANCE'})),
        (get({This, '$class'})):setWidth(This, (get({This, maxX}) - get({This, minX}))),
        (get({This, '$class'})):setHeight(This, (get({This, maxY}) - get({This, minY}))),
        put({local, max}, (get({This, '$class'})):getWidth(This)),
        case ((get({This, '$class'})):getHeight(This) > get({local, max})) of
            true ->
            put({local, max}, (get({This, '$class'})):getHeight(This));
            false -> ok
        end,
        Middle = (get({local, max}) div 2),
        CommonLabels = 'CommonLabels':getInstance(),
        S = (fun(Target_N67086) -> (get({Target_N67086, '$class'})):toString(Target_N67086) end)((fun(Target_N67093) -> (get({Target_N67093, '$class'})):appendint(Target_N67093, Middle) end)((fun(Target_N67100) -> (get({Target_N67100, '$class'})):append(Target_N67100, " middle: ") end)((fun(Target_N67107) -> (get({Target_N67107, '$class'})):appendint(Target_N67107, get({local, max})) end)((fun(Target_N67114) -> (get({Target_N67114, '$class'})):append(Target_N67114, " max: ") end)((fun(Target_N67121) -> (get({Target_N67121, '$class'})):appendint(Target_N67121, (get({This, '$class'})):getHeight(This)) end)((fun(Target_N67128) -> (get({Target_N67128, '$class'})):append(Target_N67128, get({CommonLabels, 'HEIGHT_LABEL'})) end)((fun(Target_N67135) -> (get({Target_N67135, '$class'})):appendint(Target_N67135, (get({This, '$class'})):getWidth(This)) end)((fun(Target_N67142) -> (get({Target_N67142, '$class'})):append(Target_N67142, get({CommonLabels, 'WIDTH_LABEL'})) end)('StringMaker':new()))))))))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), S, This, get({get({This, commonStrings}), 'GET_INSTANCE'})),
        CurrentMiddleX = (get({This, minX}) + ((get({This, '$class'})):getWidth(This) div 2)),
        CurrentMiddleY = (get({This, minY}) + ((get({This, '$class'})):getHeight(This) div 2)),
        put({This, dx}, (Middle - CurrentMiddleX)),
        put({This, dy}, (Middle - CurrentMiddleY)).

% throws Exception
transform(This, HashMap) ->
        (get({This, '$class'})):calculate(This, HashMap),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67643) -> (get({Target_N67643, '$class'})):toString(Target_N67643) end)((fun(Target_N67650) -> (get({Target_N67650, '$class'})):appendint(Target_N67650, get({This, dy})) end)((fun(Target_N67657) -> (get({Target_N67657, '$class'})):append(Target_N67657, " dy: ") end)((fun(Target_N67664) -> (get({Target_N67664, '$class'})):appendint(Target_N67664, get({This, dx})) end)((fun(Target_N67671) -> (get({Target_N67671, '$class'})):append(Target_N67671, " dx: ") end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'GET_INSTANCE'})),
        GraphicItemArray = (fun(Target_N67780) -> (get({Target_N67780, '$class'})):toArray(Target_N67780) end)((get({HashMap, '$class'})):keySet(HashMap)),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            Item = (get({HashMap, '$class'})):get(HashMap, array:get(Index, GraphicItemArray)),
            List = 'VectorCenterGenerator':translate((fun(Target_N67985) -> (get({Target_N67985, '$class'})):getPoints(Target_N67985) end)((get({Item, '$class'})):getPointsInterface(Item)), get({This, dx}), get({This, dy})),
            NewPoints = 'Points':new(),
            (get({NewPoints, '$class'})):addPoints(NewPoints, List),
            (get({Item, '$class'})):setPointsInterface(Item, NewPoints)
        end, lists:seq(0, Size - 1)).

% throws Exception
getInstance(This, PointVector) ->
        try
            Size = (get({PointVector, '$class'})):size(PointVector),
            lists:foreach(fun(Index) ->
                Point = (get({PointVector, '$class'})):get(PointVector, Index),
                case ((get({Point, '$class'})):getX(Point) < get({This, minX})) of
                    true ->
                    put({This, minX}, (get({Point, '$class'})):getX(Point));
                    false -> ok
                end,
                case ((get({Point, '$class'})):getX(Point) > get({This, maxX})) of
                    true ->
                    put({This, maxX}, (get({Point, '$class'})):getX(Point));
                    false -> ok
                end,
                case ((get({Point, '$class'})):getY(Point) < get({This, minY})) of
                    true ->
                    put({This, minY}, (get({Point, '$class'})):getY(Point));
                    false -> ok
                end,
                case ((get({Point, '$class'})):getY(Point) > get({This, maxY})) of
                    true ->
                    put({This, maxY}, (get({Point, '$class'})):getY(Point));
                    false -> ok
                end
            end, lists:seq(0, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'GET_INSTANCE'}), E),
            erlang:error(E)
        end.

% throws Exception
translate(List, X, Y) when is_integer(X), is_integer(Y) ->
        GraphicsPipe = 'BasicGraphicsPipeline':new(List),
        (get({GraphicsPipe, '$class'})):createMatrix(GraphicsPipe),
        (get({GraphicsPipe, '$class'})):translate(GraphicsPipe, X, Y),
        (get({GraphicsPipe, '$class'})):getMatrix(GraphicsPipe).

getWidth(This) ->
        get({This, width}).

setWidth(This, Width) when is_integer(Width) ->
        put({This, width}, Width).

getHeight(This) ->
        get({This, height}).

setHeight(This, Height) when is_integer(Height) ->
        put({This, height}, Height).

