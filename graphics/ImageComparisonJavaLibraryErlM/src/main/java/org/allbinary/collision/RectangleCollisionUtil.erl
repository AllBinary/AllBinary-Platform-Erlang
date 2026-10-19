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
% package org.allbinary.collision
% import java.awt
% import org.allbinary.graphics.GPoint

-module('RectangleCollisionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isCollision(Rectangle, Point) ->
        try
        case (((((get({Point, '$class'})):getX(Point) > ((trunc(get({Rectangle, x})) + (get({Rectangle, '$class'})):getWidth(Rectangle)))) orelse ((get({Point, '$class'})):getY(Point) > ((trunc(get({Rectangle, y})) + (get({Rectangle, '$class'})):getHeight(Rectangle))))) orelse ((get({Point, '$class'})):getX(Point) < get({Rectangle, x}))) orelse ((get({Point, '$class'})):getY(Point) < get({Rectangle, y}))) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
isCollision(Rectangle1, Rectangle2) ->
        'RectangleCollisionUtil':isCollision(get({Rectangle1, x}), get({Rectangle1, y}), (get({Rectangle1, x}) + get({Rectangle1, width})), (get({Rectangle1, y}) + get({Rectangle1, height})), get({Rectangle2, x}), get({Rectangle2, y}), (get({Rectangle2, x}) + get({Rectangle2, width})), (get({Rectangle2, y}) + get({Rectangle2, height}))).


isCollision(RectX1, RectY1, RectX2, RectY2, Rect2X1, Rect2Y1, Rect2X2, Rect2Y2) when is_integer(RectX1), is_integer(RectY1), is_integer(RectX2), is_integer(RectY2), is_integer(Rect2X1), is_integer(Rect2Y1), is_integer(Rect2X2), is_integer(Rect2Y2) ->
        try
        case ((((Rect2X1 >= RectX2) orelse (Rect2Y1 >= RectY2)) orelse (Rect2X2 =< RectX1)) orelse (Rect2Y2 =< RectY1)) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

