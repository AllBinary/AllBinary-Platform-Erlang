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
% package org.allbinary.game.ag.ai.scroller
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.util.ABHashtable

-module('BasePatrolAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

static_init() ->
    put({?MODULE, 'MAX_DISTANCE'}, (fun(Target_N65892) -> (get({Target_N65892, '$class'})):getAt(Target_N65892, 2) end)('SmallIntegerSingletonFactory':getInstance())),
    put({?MODULE, 'DIRECTION_ARRAY'}, (fun(Target_N65961) -> (get({Target_N65961, '$class'})):getAt(Target_N65961, 3) end)('SmallIntegerSingletonFactory':getInstance())),
    put({?MODULE, 'FIRING_DISTANCE'}, (fun(Target_N66030) -> (get({Target_N66030, '$class'})):getAt(Target_N66030, 4) end)('SmallIntegerSingletonFactory':getInstance())),
    put({?MODULE, 'SPEED'}, (fun(Target_N66095) -> (get({Target_N66095, '$class'})):getAt(Target_N66095, 5) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, maxDistance}, undefined),
    put({This, currentDistance}, 0),
    put({This, xTotalDistance}, 0),
    put({This, lastKeyDirection}, get({'Canvas', 'RIGHT'})),
    put({This, keyDirection}, get({'Canvas', 'RIGHT'})),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, maxDistance}, (get({Hashtable, '$class'})):get(Hashtable, get({'BasePatrolAI', 'MAX_DISTANCE'}))),
        put({This, currentDistance}, (get({get({This, maxDistance}), '$class'})):intValue(get({This, maxDistance}))).

update(This) ->
        (get({This, '$class'})):updateTotalDistance(This),
        (get({This, '$class'})):changeDirectionIfReachedPacingAreaMax(This).

updateTotalDistance(This) ->
        VelocityInterfaceCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        VelocityProperties = (get({VelocityInterfaceCompositeInterface, '$class'})):getVelocityProperties(VelocityInterfaceCompositeInterface),
        put({This, xTotalDistance}, (get({This, xTotalDistance}) + (fun(Target_N66760) -> (get({Target_N66760, '$class'})):getScaled(Target_N66760) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties)))).

changeDirectionIfReachedPacingAreaMax(This) ->
        MathUtil = 'MathUtil':getInstance(),
        TotalDistance = (get({MathUtil, '$class'})):abs(MathUtil, get({This, xTotalDistance})),
        case (TotalDistance > get({This, currentDistance})) of
            true ->
            (get({This, '$class'})):nextDirection(This);
            false -> ok
        end.

nextDirection(This) ->
        case (get({This, lastKeyDirection}) =:= get({'Canvas', 'LEFT'})) of
            true ->
            put({This, keyDirection}, get({'Canvas', 'RIGHT'})),
            put({This, lastKeyDirection}, get({This, keyDirection})),
            put({This, xTotalDistance}, 0);
            false ->
            case (get({This, lastKeyDirection}) =:= get({'Canvas', 'RIGHT'})) of
            true ->
            put({This, keyDirection}, get({'Canvas', 'LEFT'})),
            put({This, lastKeyDirection}, get({This, keyDirection})),
            put({This, xTotalDistance}, 0);
            false -> ok
        end
        end.

disable(This) ->
        ok.

