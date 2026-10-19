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
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('ScrollOverAtHalfAI').
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
        X = (get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface),
        Y = (get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface),
        HalfWidth = (get({OwnerLayerInterface, '$class'})):getHalfWidth(OwnerLayerInterface),
        HalfHeight = (get({OwnerLayerInterface, '$class'})):getHalfHeight(OwnerLayerInterface),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        case (X > ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - HalfWidth)) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, (HalfWidth + 1), Y, (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface));
            false -> ok
        end,
        case (Y > ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) - HalfHeight)) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, X, (HalfHeight + 1), (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface));
            false -> ok
        end,
        case (X < (-HalfWidth)) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - HalfWidth), Y, (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface));
            false -> ok
        end,
        case (Y < (-HalfHeight)) of
            true ->
            (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, X, ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) - HalfHeight), (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface));
            false -> ok
        end.

