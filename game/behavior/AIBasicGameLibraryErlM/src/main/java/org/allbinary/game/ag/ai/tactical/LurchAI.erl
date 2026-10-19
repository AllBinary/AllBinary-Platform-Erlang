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
% package org.allbinary.game.ag.ai.tactical
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('LurchAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, currentRelativeAngle}, 0),
    put({This, currentSpeed}, 0),
    ok.


new(OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OwnerLayerInterface, GameInput),
    This.

init(This, OwnerLayerInterface, GameInput) ->
        'BasicAI':init(This, OwnerLayerInterface, GameInput),
        init_fields(This).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        case (get({This, currentSpeed}) =:= (-1)) of
            true ->
            put({This, currentSpeed}, 5);
            false ->
            put({This, currentSpeed}, (-1))
        end,
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({local, x}, (get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface)),
        case (((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) - get({This, currentSpeed})) =< 0) of
            true ->
            (get({This, '$class'})):reverse(This),
            (get({This, '$class'})):drop(This);
            false -> ok
        end,
        case (((get({OwnerLayerInterface, '$class'})):getX2(OwnerLayerInterface) + get({This, currentSpeed})) > (fun(Target_N66218) -> (get({Target_N66218, '$class'})):getLastWidth(Target_N66218) end)('DisplayInfoSingleton':getInstance())) of
            true ->
            (get({This, '$class'})):reverse(This),
            (get({This, '$class'})):accelerate(This),
            (get({This, '$class'})):drop(This);
            false -> ok
        end,
        case (get({This, currentRelativeAngle}) =:= 0) of
            true ->
            put({local, x}, (get({local, x}) + get({This, currentSpeed})));
            false ->
            case (get({This, currentRelativeAngle}) =:= 180) of
            true ->
            put({local, x}, (get({local, x}) - get({This, currentSpeed})));
            false -> ok
        end
        end,
        (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, get({local, x}), (get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface), (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface)),
        case (get({This, currentRelativeAngle}) =:= 0) of
            true ->
            'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_NUM0'}));
            false ->
            case (get({This, currentRelativeAngle}) =:= 180) of
            true ->
            'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_POUND'}));
            false -> ok
        end
        end.

reverse(This) ->
        case (get({This, currentRelativeAngle}) =:= 180) of
            true ->
            put({This, currentRelativeAngle}, 0);
            false ->
            case (get({This, currentRelativeAngle}) =:= 0) of
            true ->
            put({This, currentRelativeAngle}, 180);
            false -> ok
        end
        end.

accelerate(This) ->
        case (get({This, currentSpeed}) < 20) of
            true ->
            put({This, currentSpeed}, get({This, currentSpeed}) + 1);
            false -> ok
        end.

drop(This) ->
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({local, y}, (get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface)),
        case (((get({OwnerLayerInterface, '$class'})):getY2(OwnerLayerInterface) + (get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface)) > (fun(Target_N67006) -> (get({Target_N67006, '$class'})):getLastHeight(Target_N67006) end)('DisplayInfoSingleton':getInstance())) of
            true ->
            put({local, y}, 0);
            false ->
            put({local, y}, (get({local, y}) + ((get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface) + 1)))
        end,
        (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, (get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface), get({local, y}), (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface)).

