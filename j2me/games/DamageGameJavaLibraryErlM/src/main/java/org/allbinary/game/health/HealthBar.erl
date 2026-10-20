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
% package org.allbinary.game.health
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.layer.AllBinaryLayer

-module('HealthBar').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HealthListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, animationInterface}, undefined),
    put({This, healthInterface}, undefined),
    put({This, allbinaryLayer}, undefined),
    ok.


new(LayerInterface, HealthInterface, AnimationInterface, Direction) when is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LayerInterface, HealthInterface, AnimationInterface, Direction),
    This.

'$init'(This, LayerInterface, HealthInterface, AnimationInterface, Direction) when is_integer(Direction) ->
    'Paintable':'$init'(This),
    init_fields(This),
        put({This, allbinaryLayer}, LayerInterface),
        put({This, animationInterface}, AnimationInterface),
        put({This, healthInterface}, HealthInterface),
        (get({get({This, healthInterface}), '$class'})):addListener(get({This, healthInterface}), This),
        (get({This, '$class'})):onHealthChange(This).

onHealthChange(This) ->
        (get({get({This, animationInterface}), '$class'})):onHealthChange(get({This, animationInterface}), (((get({get({This, healthInterface}), '$class'})):getHealth(get({This, healthInterface})) * (get({get({This, allbinaryLayer}), '$class'})):getWidth(get({This, allbinaryLayer}))) / (get({get({This, healthInterface}), '$class'})):getMaxHealth(get({This, healthInterface})))).

paint(This, Graphics) ->
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, 0, 0).

paintThreed(This, Graphics) ->
        (get({get({This, animationInterface}), '$class'})):paintThreedXYZ(get({This, animationInterface}), Graphics, 0, 0, 0).

