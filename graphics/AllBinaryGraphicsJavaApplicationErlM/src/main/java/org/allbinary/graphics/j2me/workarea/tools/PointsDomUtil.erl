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
% package org.allbinary.graphics.j2me.workarea.tools
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom
% import org.allbinary.math.PositionStrings
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Node

-module('PointsDomUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PointsDomUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'LINES'}, "lines"),
    put({This, 'POINTONE'}, "pointOne"),
    put({This, 'POINTTWO'}, "pointTwo"),
    put({This, 'ROTATEDPOINTONE'}, "rotatedPointOne"),
    put({This, 'ROTATEDPOINTTWO'}, "rotatedPointTwo"),
    put({This, 'LINE'}, "line"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'PointsDomUtil', instance}).

% throws Exception
toDom(This, CanvasDom, PointVector) ->
        TempPointVector = (fun(Target_N66164) -> (get({Target_N66164, '$class'})):doTransforms(Target_N66164, PointVector, (get({CanvasDom, '$class'})):getAngle(CanvasDom), (fun(Target_N66228) -> (get({Target_N66228, '$class'})):createXY(Target_N66228, (fun(Target_N66253) -> (get({Target_N66253, '$class'})):getWidth(Target_N66253) end)((get({CanvasDom, '$class'})):getDimension(CanvasDom)), (fun(Target_N66277) -> (get({Target_N66277, '$class'})):getHeight(Target_N66277) end)((get({CanvasDom, '$class'})):getDimension(CanvasDom))) end)('PointFactory':getInstance())) end)('PointsUtil':getInstance()),
        Document = 'WorkAreaJPanel':getDocument(),
        LinesNode = (get({Document, '$class'})):createElement(Document, get({This, 'LINES'})),
        Size2 = (get({TempPointVector, '$class'})):size(TempPointVector),
        Size = (get({PointVector, '$class'})):size(PointVector),
        put({local, firstPoint}, undefined),
        put({local, rotatedFirstPoint}, undefined),
        put({local, index}, 0),
        case ((get({local, index}) < Size) andalso (get({local, index}) < Size2)) of
            true ->
            put({local, rotatedFirstPoint}, (get({TempPointVector, '$class'})):get(TempPointVector, get({local, index}))),
            put({local, firstPoint}, (get({PointVector, '$class'})):get(PointVector, get({local, index}))),
            put({local, index}, get({local, index}) + 1);
            false -> ok
        end,
        (fun Loop() -> case ((get({local, index}) < Size) andalso (get({local, index}) < Size2)) of true ->
            LineNode = (get({Document, '$class'})):createElement(Document, get({This, 'LINE'})),
            RotatedSecondPoint = (get({TempPointVector, '$class'})):get(TempPointVector, get({local, index})),
            SecondPoint = (get({PointVector, '$class'})):get(PointVector, get({local, index})),
            PointOneNode = (get({This, '$class'})):getPointNode(This, get({local, firstPoint}), get({This, 'POINTONE'})),
            PointTwoNode = (get({This, '$class'})):getPointNode(This, SecondPoint, get({This, 'POINTTWO'})),
            RotatedPointOneNode = (get({This, '$class'})):getPointNode(This, get({local, rotatedFirstPoint}), get({This, 'ROTATEDPOINTONE'})),
            RotatedPointTwoNode = (get({This, '$class'})):getPointNode(This, RotatedSecondPoint, get({This, 'ROTATEDPOINTTWO'})),
            (get({LineNode, '$class'})):appendChild(LineNode, PointOneNode),
            (get({LineNode, '$class'})):appendChild(LineNode, PointTwoNode),
            (get({LineNode, '$class'})):appendChild(LineNode, RotatedPointOneNode),
            (get({LineNode, '$class'})):appendChild(LineNode, RotatedPointTwoNode),
            put({local, firstPoint}, SecondPoint),
            put({local, rotatedFirstPoint}, RotatedSecondPoint),
            (get({LinesNode, '$class'})):appendChild(LinesNode, LineNode),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        LinesNode.

getPointNode(This, Point, PointName) when (is_list(PointName) orelse PointName =:= undefined) ->
        Document = 'WorkAreaJPanel':getDocument(),
        PointNode = (get({Document, '$class'})):createElement(Document, PointName),
        XNode = (get({Document, '$class'})):createElement(Document, get({'PositionStrings':getInstance(), 'X'})),
        XTextNode = (get({Document, '$class'})):createTextNode(Document, allbinary_java:to_string((get({Point, '$class'})):getX(Point))),
        (get({XNode, '$class'})):appendChild(XNode, XTextNode),
        YNode = (get({Document, '$class'})):createElement(Document, get({'PositionStrings':getInstance(), 'Y'})),
        YTextNode = (get({Document, '$class'})):createTextNode(Document, allbinary_java:to_string((get({Point, '$class'})):getY(Point))),
        (get({YNode, '$class'})):appendChild(YNode, YTextNode),
        (get({PointNode, '$class'})):appendChild(PointNode, XNode),
        (get({PointNode, '$class'})):appendChild(PointNode, YNode),
        PointNode.

