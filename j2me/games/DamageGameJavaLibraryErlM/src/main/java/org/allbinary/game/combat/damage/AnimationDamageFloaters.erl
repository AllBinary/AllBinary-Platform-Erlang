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
% package org.allbinary.game.combat.damage
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.CircularIndexUtil
% import org.allbinary.view.ViewPosition
% import org.allbinary.view.ViewPositionBase

-module('AnimationDamageFloaters').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DamageFloaters', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, layerInterface}, undefined),
    put({This, animationInterfaceArray}, undefined),
    put({This, circularIndexUtil}, undefined),
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(LayerInterface, AnimationInterfaceArray, Dx, Dy) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LayerInterface, AnimationInterfaceArray, Dx, Dy),
    This.

'$init'(This, LayerInterface, AnimationInterfaceArray, Dx, Dy) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined), is_integer(Dx), is_integer(Dy) ->
    'DamageFloaters':'$init'(This),
    init_fields(This),
        put({This, animationInterfaceArray}, AnimationInterfaceArray),
        lists:foreach(fun(Index) ->
            (fun(Target_N66091) -> (get({Target_N66091, '$class'})):setFrame(Target_N66091, ((fun(Target_N66127) -> (get({Target_N66127, '$class'})):getSize(Target_N66127) end)(array:get(Index, get({This, animationInterfaceArray}))) - 1)) end)(array:get(Index, get({This, animationInterfaceArray})))
        end, lists:seq((array:size(get({This, animationInterfaceArray})) - 1), 0, -1)),
        put({This, layerInterface}, LayerInterface),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(array:size(get({This, animationInterfaceArray})))),
        put({This, dx}, Dx),
        put({This, dy}, Dy).

add(This, Damage) when is_integer(Damage) ->
        I = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (fun(Target_N66533) -> (get({Target_N66533, '$class'})):setFrame(Target_N66533, 0) end)(array:get(I, get({This, animationInterfaceArray}))),
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

paint(This, Graphics) ->
        try
            ViewPosition = (get({get({This, layerInterface}), '$class'})):getViewPosition(get({This, layerInterface})),
            X = (get({ViewPosition, '$class'})):getX(ViewPosition),
            Y = (get({ViewPosition, '$class'})):getY(ViewPosition),
            lists:foreach(fun(Index) ->
                AnimationInterface = array:get(Index, get({This, animationInterfaceArray})),
                case ((get({AnimationInterface, '$class'})):getFrame(AnimationInterface) < ((get({AnimationInterface, '$class'})):getAnimationSize(AnimationInterface) - 1)) of
                    true ->
                    Delta = ((get({AnimationInterface, '$class'})):getFrame(AnimationInterface) * 20),
                    (get({AnimationInterface, '$class'})):paintXY(AnimationInterface, Graphics, (X + get({This, dx})), ((Y - Delta) + get({This, dy}))),
                    (get({AnimationInterface, '$class'})):nextFrame(AnimationInterface);
                    false -> ok
                end
            end, lists:seq(0, array:size(get({This, animationInterfaceArray})) - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            CanvasStrings = 'CanvasStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CanvasStrings, 'PAINT'}), E)
        end.

