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
% package org.allbinary.game.layer
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.view.ViewPositionBase

-module('GameLayerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

isOnScreen(Layer) ->
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        ViewPosition = (get({Layer, '$class'})):getViewPosition(Layer),
        'GameLayerUtil':isInside((get({ViewPosition, '$class'})):getX(ViewPosition), (get({ViewPosition, '$class'})):getY(ViewPosition), (get({ViewPosition, '$class'})):getX2(ViewPosition), (get({ViewPosition, '$class'})):getY2(ViewPosition), 0, 0, (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo), (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo)).

isInside(RectX1, RectY1, RectX2, RectY2, Rect2X1, Rect2Y1, Rect2X2, Rect2Y2) when is_integer(RectX1), is_integer(RectY1), is_integer(RectX2), is_integer(RectY2), is_integer(Rect2X1), is_integer(Rect2Y1), is_integer(Rect2X2), is_integer(Rect2Y2) ->
        try
        case ((((RectX1 > Rect2X1) andalso (RectX2 < Rect2X2)) andalso (RectY1 > Rect2Y1)) andalso (RectY2 < Rect2Y2)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

