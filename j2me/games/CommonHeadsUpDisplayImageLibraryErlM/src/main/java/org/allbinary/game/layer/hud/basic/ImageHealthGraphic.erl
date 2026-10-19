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
% package org.allbinary.game.layer.hud.basic
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationInterface
% import org.allbinary.game.health.HealthInterface
% import org.allbinary.graphics.Anchor
% import org.allbinary.image.ImageCacheFactory

-module('ImageHealthGraphic').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HealthGraphic', Function, Arguments).

init_fields(This) ->
    put({This, image}, undefined),
    ok.


new(AnimationInterface, HealthInterface, Location, Direction) when is_integer(Location), is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterface, HealthInterface, Location, Direction),
    This.

init(This, AnimationInterface, HealthInterface, Location, Direction) when is_integer(Location), is_integer(Direction) ->
        'HealthGraphic':init(This, AnimationInterface, HealthInterface, Location, Direction),
        init_fields(This),
        put({This, image}, array:new((get({get({This, healthInterface}), '$class'})):getMaxHealth(get({This, healthInterface})), {default, undefined})),
        ImageCacheFactory = 'ImageCacheFactory':getInstance(),
        lists:foreach(fun(NumOfHealth) ->
            put({This, image}, array:set(NumOfHealth, (get({ImageCacheFactory, '$class'})):get(ImageCacheFactory, This, (NumOfHealth + (1 * 10)), 10), get({This, image})))
        end, lists:seq(0, get({This, max}))),
        lists:foreach(fun(NumOfHealth) ->
            lists:foreach(fun(Index) ->
                (get({get({This, animationInterface}), '$class'})):paint(get({This, animationInterface}), (fun(Target_N66140) -> (get({Target_N66140, '$class'})):getGraphics(Target_N66140) end)(array:get(NumOfHealth, get({This, image}))), (NumOfHealth * 10), 0)
            end, lists:seq(0, NumOfHealth - 1))
        end, lists:seq(0, get({This, max}))).

paint(This, Graphics) ->
        (get({Graphics, '$class'})):drawImage(Graphics, array:get(get({This, max}), get({This, image})), get({This, x}), get({This, y}), get({'Anchor', 'TOP_LEFT'})).

