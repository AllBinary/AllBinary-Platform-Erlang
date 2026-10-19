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
% package org.allbinary.math
% import org.allbinary.graphics.GPoint
% import org.allbinary.util.BasicArrayList

-module('RectangleCollisionPointUtil').
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

allPointsInside(RectX1, RectY1, RectX2, RectY2, List) when is_integer(RectX1), is_integer(RectY1), is_integer(RectX2), is_integer(RectY2) ->
        try
        RectangleCollisionUtil = 'RectangleCollisionUtil':getInstance(),
        put({local, point}, undefined),
        put({local, index}, (get({List, '$class'})):size(List)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, point}, array:get(get({local, index}), get({List, objectArray}))),
            case (not (get({RectangleCollisionUtil, '$class'})):isInside(RectangleCollisionUtil, RectX1, RectY1, RectX2, RectY2, (get({get({local, point}), '$class'})):getX(get({local, point})), (get({get({local, point}), '$class'})):getY(get({local, point})))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

allPointsInsideCell(RectX1, RectY1, RectX2, RectY2, List, XCellSize, YCellSize) when is_integer(RectX1), is_integer(RectY1), is_integer(RectX2), is_integer(RectY2), is_integer(XCellSize), is_integer(YCellSize) ->
        try
        RectangleCollisionUtil = 'RectangleCollisionUtil':getInstance(),
        put({local, point}, undefined),
        put({local, index}, (get({List, '$class'})):size(List)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, point}, array:get(get({local, index}), get({List, objectArray}))),
            case (not (get({RectangleCollisionUtil, '$class'})):isInside(RectangleCollisionUtil, RectX1, RectY1, RectX2, RectY2, ((get({get({local, point}), '$class'})):getX(get({local, point})) * XCellSize), ((get({get({local, point}), '$class'})):getY(get({local, point})) * YCellSize))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

