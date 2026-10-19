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
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('StopAtEdgeAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    ok.


new(OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OwnerLayerInterface, GameInput),
    This.

init(This, OwnerLayerInterface, GameInput) ->
        'BasicAI':init(This, OwnerLayerInterface, GameInput).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        VelocityInterfaceCompositeInterface = (OwnerLayerInterface),
        VelocityProperties = (get({VelocityInterfaceCompositeInterface, '$class'})):getVelocityProperties(VelocityInterfaceCompositeInterface),
        X = (get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface),
        Y = (get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface),
        X2 = (get({OwnerLayerInterface, '$class'})):getX2(OwnerLayerInterface),
        Y2 = (get({OwnerLayerInterface, '$class'})):getY2(OwnerLayerInterface),
        Width = (get({OwnerLayerInterface, '$class'})):getWidth(OwnerLayerInterface),
        Height = (get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        case ((X2 + (fun(Target_N66412) -> (get({Target_N66412, '$class'})):getScaled(Target_N66412) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties))) > (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo)) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - Width), Y, (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface)),
            (fun(Target_N66538) -> (get({Target_N66538, '$class'})):setint(Target_N66538, 0) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties));
            false -> ok
        end,
        case ((Y2 + (fun(Target_N66596) -> (get({Target_N66596, '$class'})):getScaled(Target_N66596) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties))) > (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo)) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, X, ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) - Height), (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface)),
            (fun(Target_N66726) -> (get({Target_N66726, '$class'})):setint(Target_N66726, 0) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties));
            false -> ok
        end,
        case ((X + (fun(Target_N66780) -> (get({Target_N66780, '$class'})):getScaled(Target_N66780) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties))) < 0) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, 0, Y, (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface)),
            (fun(Target_N66869) -> (get({Target_N66869, '$class'})):setint(Target_N66869, 0) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties));
            false -> ok
        end,
        case ((Y + (fun(Target_N66923) -> (get({Target_N66923, '$class'})):getScaled(Target_N66923) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties))) < 0) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, X, 0, (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface)),
            (fun(Target_N67012) -> (get({Target_N67012, '$class'})):setint(Target_N67012, 0) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties));
            false -> ok
        end.

