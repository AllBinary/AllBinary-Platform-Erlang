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
% import org.allbinary.ai.ArtificialIntelligenceInterface
% import org.allbinary.bounds.TopULayerBounds
% import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.physics.velocity.VelocityInterface
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.util.ABHashtable

-module('TopUBoundBounceAIFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ArtificialIntelligenceInterfaceFactoryInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
getInstance(This, Hashtable, OwnerLayerInterface, GameInput) ->
        VelocityInterfaceCompositeInterface = OwnerLayerInterface,
        VelocityInterface = (get({VelocityInterfaceCompositeInterface, '$class'})):getVelocityProperties(VelocityInterfaceCompositeInterface),
        MaxDistancePerTick = (((get({VelocityInterface, '$class'})):getMaxForwardVelocity(VelocityInterface) bsr (fun(Target_N66099) -> (get({Target_N66099, '$class'})):getScaledFactor(Target_N66099) end)((get({VelocityInterface, '$class'})):getVelocityXBasicDecimalP(VelocityInterface)))),
        HalfWidth = ((((get({OwnerLayerInterface, '$class'})):getWidth(OwnerLayerInterface) * 2) + MaxDistancePerTick) + 1),
        HalfHeight = ((((get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface) * 2) + MaxDistancePerTick) + 1),
        Point = (fun(Target_N66317) -> (get({Target_N66317, '$class'})):createXY(Target_N66317, HalfWidth, (HalfHeight + 60)) end)('PointFactory':getInstance()),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        Rectangle = 'Rectangle':new(Point, ((((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - HalfWidth) - (get({Point, '$class'})):getX(Point))), ((((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) - HalfHeight) - (get({Point, '$class'})):getY(Point)))),
        'BoundBounceAI':new(OwnerLayerInterface, GameInput, 'TopULayerBounds':new(Rectangle), 'ReverseVelocityBoundsVisitor':new(OwnerLayerInterface)).

