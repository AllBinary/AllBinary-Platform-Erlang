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
% package org.allbinary.game.ag.layer.hud.basic.health
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.game.health.Health
% import org.allbinary.game.health.HealthListenerInterface
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.NoTimeDelayHelper
% import org.allbinary.time.TimeDelayHelper

-module('HealthHudWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaintableInterface
% implements HealthListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, healthScale}, 0),
    put({This, animationInterface}, undefined),
    put({This, healthInterface}, undefined),
    put({This, max}, 0),
    put({This, xArray}, undefined),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    put({This, timeDelayHelper}, get({'NoTimeDelayHelper', 'SINGLETON'})),
    put({This, slowBeatTimeDelayHelper}, 'TimeDelayHelper':new(1280)),
    put({This, mediumBeatTimeDelayHelper}, 'TimeDelayHelper':new(640)),
    put({This, fastBeatTimeDelayHelper}, 'TimeDelayHelper':new(320)),
    ok.


new(AnimationInterface, HealthInterface, Location, Direction) when is_integer(Location), is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterface, HealthInterface, Location, Direction),
    This.

init(This, AnimationInterface, HealthInterface, Location, Direction) when is_integer(Location), is_integer(Direction) ->
        'BasicHud':init(This, Location, Direction, 2, get({'BasicColorFactory':getInstance(), 'WHITE'})),
        init_fields(This),
        put({This, animationInterface}, AnimationInterface),
        put({This, healthInterface}, HealthInterface),
        (get({get({This, healthInterface}), '$class'})):addListener(get({This, healthInterface}), This),
        put({This, healthScale}, ((((get({get({This, healthInterface}), '$class'})):getMaxHealth(get({This, healthInterface})) / 6)) + 1)),
        (get({This, '$class'})):onHealthChange(This),
        put({This, updateMaxWidth}, ((get({HealthInterface, '$class'})):getMaxHealth(HealthInterface) * 16)),
        put({This, updateMaxHeight}, 16),
        put({This, xArray}, array:new(30, {default, 0})),
        (get({This, '$class'})):update(This).

update(This) ->
        case (get({This, xArray}) =/= undefined) of
            true ->
            lists:foreach(fun(Index) ->
                put({This, xArray}, array:set(Index, ((get({This, '$class'})):getX(This) + ((Index * 16))), get({This, xArray})))
            end, lists:seq(0, array:size(get({This, xArray})) - 1));
            false -> ok
        end.

setX(This, X) when is_integer(X) ->
        'BasicHud':setX(This, X),
        (get({This, '$class'})):update(This).

onHealthChange(This) ->
        put({This, max}, (((get({get({This, healthInterface}), '$class'})):getHealth(get({This, healthInterface})) / get({This, healthScale})))),
        put({This, timeDelayHelper}, get({'NoTimeDelayHelper', 'SINGLETON'})),
        case ((get({This, max}) =< 1) andalso (get({get({This, healthInterface}), '$class'})):isAlive(get({This, healthInterface}))) of
            true ->
            put({This, max}, 1),
            case ((get({This, healthScale}) - (get({get({This, healthInterface}), '$class'})):getHealth(get({This, healthInterface}))) > (((get({This, healthScale}) * 2)) div 3)) of
                true ->
                put({This, timeDelayHelper}, get({This, slowBeatTimeDelayHelper}));
                false ->
                case ((get({This, healthScale}) - (get({get({This, healthInterface}), '$class'})):getHealth(get({This, healthInterface}))) > (get({This, healthScale}) div 3)) of
                true ->
                put({This, timeDelayHelper}, get({This, mediumBeatTimeDelayHelper}));
                false ->
                put({This, timeDelayHelper}, get({This, fastBeatTimeDelayHelper}))
            end
            end;
            false -> ok
        end.

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        lists:foreach(fun(Index) ->
            case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
                true ->
                (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, array:get(Index, get({This, xArray})), (get({This, '$class'})):getY(This));
                false -> ok
            end
        end, lists:seq(0, get({This, max}) - 1)).

paintThreed(This, Graphics) ->
        ok.

