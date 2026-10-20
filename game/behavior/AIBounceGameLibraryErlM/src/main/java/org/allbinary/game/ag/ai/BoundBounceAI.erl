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
% package org.allbinary.game.ag.ai
% import javax.microedition.lcdui.Graphics
% import org.allbinary.bounds.BoundsVisitorInterface
% import org.allbinary.bounds.LayerBounds
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('BoundBounceAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, currentRelativeAngle}, 0),
    put({This, layerBounds}, undefined),
    put({This, boundsVisitorInterface}, undefined),
    ok.


new(OwnerLayerInterface, GameInput, LayerBounds, BoundsVisitorInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerLayerInterface, GameInput, LayerBounds, BoundsVisitorInterface),
    This.

'$init'(This, OwnerLayerInterface, GameInput, LayerBounds, BoundsVisitorInterface) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, layerBounds}, LayerBounds),
        put({This, boundsVisitorInterface}, BoundsVisitorInterface).

paint(This, Graphics) ->
        Rectange = (get({get({This, layerBounds}), '$class'})):getRectangleP(get({This, layerBounds})),
        (get({Graphics, '$class'})):drawRect(Graphics, (fun(Target_N66168) -> (get({Target_N66168, '$class'})):getX(Target_N66168) end)((get({Rectange, '$class'})):getPoint(Rectange)), (fun(Target_N66192) -> (get({Target_N66192, '$class'})):getY(Target_N66192) end)((get({Rectange, '$class'})):getPoint(Rectange)), (get({Rectange, '$class'})):getWidth(Rectange), (get({Rectange, '$class'})):getHeight(Rectange)).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        (get({get({This, layerBounds}), '$class'})):visit(get({This, layerBounds}), get({This, boundsVisitorInterface})).

