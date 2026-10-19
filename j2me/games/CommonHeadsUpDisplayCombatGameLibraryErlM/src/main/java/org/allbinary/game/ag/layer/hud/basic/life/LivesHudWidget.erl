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
% package org.allbinary.game.ag.layer.hud.basic.life
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.game.ag.life.Life
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.paint.PaintableInterface

-module('LivesHudWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaintableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, lifeInterface}, undefined),
    put({This, xArray}, undefined),
    put({This, animationInterface}, undefined),
    ok.


new(AnimationInterface, LifeInterface, Location, Direction) when is_integer(Location), is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterface, LifeInterface, Location, Direction),
    This.

init(This, AnimationInterface, LifeInterface, Location, Direction) when is_integer(Location), is_integer(Direction) ->
        'BasicHud':init(This, Location, Direction, 2, get({'BasicColorFactory':getInstance(), 'WHITE'})),
        init_fields(This),
        put({This, lifeInterface}, LifeInterface),
        Size = trunc((fun(Target_N66056) -> (get({Target_N66056, '$class'})):getMaxlives(Target_N66056) end)((get({This, '$class'})):getLifeInterface(This))),
        put({This, xArray}, array:new(Size, {default, 0})),
        put({This, animationInterface}, AnimationInterface),
        put({This, updateMaxWidth}, ((get({get({This, lifeInterface}), '$class'})):getMaxlives(get({This, lifeInterface})) * 16)),
        put({This, updateMaxHeight}, 16).

updateMeasurement(This, Graphics) ->
        'BasicHud':updateMeasurement(This, Graphics),
        MaxLives = trunc((fun(Target_N66375) -> (get({Target_N66375, '$class'})):getMaxlives(Target_N66375) end)((get({This, '$class'})):getLifeInterface(This))),
        lists:foreach(fun(Index) ->
            put({This, xArray}, array:set(Index, ((get({This, '$class'})):getX(This) + ((Index * 16))), get({This, xArray})))
        end, lists:seq(0, MaxLives - 1)).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        'BasicHud':onDisplayChangeEvent(This, DisplayChangeEvent),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

setX(This, X) when is_integer(X) ->
        'BasicHud':setX(This, X),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        put({local, index}, trunc((fun(Target_N66990) -> (get({Target_N66990, '$class'})):get(Target_N66990) end)((get({This, '$class'})):getLifeInterface(This)))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, array:get(get({local, index}), get({This, xArray})), (get({This, '$class'})):getY(This)),
            Loop();
        false -> ok end end)().

paintThreed(This, Graphics) ->
        ok.

getLifeInterface(This) ->
        get({This, lifeInterface}).

