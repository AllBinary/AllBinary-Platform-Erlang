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
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

-module('RectangleCollisionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'RectangleCollisionUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'RectangleCollisionUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

isCollision(This, RectX1, RectY1, RectX2, RectY2, Rect2X1, Rect2Y1, Rect2X2, Rect2Y2) when is_integer(RectX1), is_integer(RectY1), is_integer(RectX2), is_integer(RectY2), is_integer(Rect2X1), is_integer(Rect2Y1), is_integer(Rect2X2), is_integer(Rect2Y2) ->
        try
        case ((((Rect2X1 >= RectX2) orelse (Rect2Y1 >= RectY2)) orelse (Rect2X2 =< RectX1)) orelse (Rect2Y2 =< RectY1)) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isInside(This, RectX1, RectY1, RectX2, RectY2, X, Y) when is_integer(RectX1), is_integer(RectY1), is_integer(RectX2), is_integer(RectY2), is_integer(X), is_integer(Y) ->
        try
        case ((((X >= RectX2) orelse (Y >= RectY2)) orelse (X =< RectX1)) orelse (Y =< RectY1)) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

