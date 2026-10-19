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
% package org.allbinary.game.displayable.canvas
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList

-module('ImmediateCommandFormInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CommandFormInputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, timeHelper}, 'TimeDelayHelper':new(25)),
    put({This, gameCommandCanvas}, undefined),
    ok.


new(GameKeyEventList, PlayerInputId, GameCommandCanvas, Form) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameKeyEventList, PlayerInputId, GameCommandCanvas, Form),
    This.

init(This, GameKeyEventList, PlayerInputId, GameCommandCanvas, Form) when is_integer(PlayerInputId) ->
        'CommandFormInputProcessor':init(This, GameKeyEventList, PlayerInputId, GameCommandCanvas, Form),
        init_fields(This),
        put({This, gameCommandCanvas}, GameCommandCanvas).

onPressGameKeyEvent(This, GameKeyEvent) ->
        try
            'CommandFormInputProcessor':onPressGameKeyEvent(This, GameKeyEvent),
            case (get({get({This, timeHelper}), '$class'})):isTimeTNT(get({This, timeHelper})) of
                true ->
                (get({This, '$class'})):processInputList(This),
                (get({get({get({This, gameCommandCanvas}), repaintBehavior}), '$class'})):onChangeRepaint(get({get({This, gameCommandCanvas}), repaintBehavior}), (get({This, '$class'})):getCanvas(This));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'ON_PRESS_GAME_KEY'}), E)
        end.

onDownGameKeyEvent(This, GameKeyEvent) ->
        try
            'CommandFormInputProcessor':onDownGameKeyEvent(This, GameKeyEvent),
            case (get({get({This, timeHelper}), '$class'})):isTimeTNT(get({This, timeHelper})) of
                true ->
                (get({This, '$class'})):processInputList(This),
                (get({get({get({This, gameCommandCanvas}), repaintBehavior}), '$class'})):onChangeRepaint(get({get({This, gameCommandCanvas}), repaintBehavior}), (get({This, '$class'})):getCanvas(This));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'ON_DOWN_GAME_KEY'}), E)
        end.

onUpGameKeyEvent(This, GameKeyEvent) ->
        try
            'CommandFormInputProcessor':onUpGameKeyEvent(This, GameKeyEvent),
            case (get({get({This, timeHelper}), '$class'})):isTimeTNT(get({This, timeHelper})) of
                true ->
                (get({This, '$class'})):processInputList(This),
                (get({get({get({This, gameCommandCanvas}), repaintBehavior}), '$class'})):onChangeRepaint(get({get({This, gameCommandCanvas}), repaintBehavior}), (get({This, '$class'})):getCanvas(This));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'ON_UP_GAME_KEY'}), E)
        end.

onMotionGestureEvent(This, MotionGestureEvent) ->
        try
            'CommandFormInputProcessor':onMotionGestureEvent(This, MotionGestureEvent),
            case (get({get({This, timeHelper}), '$class'})):isTimeTNT(get({This, timeHelper})) of
                true ->
                (get({This, '$class'})):processInputList(This),
                (get({get({get({This, gameCommandCanvas}), repaintBehavior}), '$class'})):onChangeRepaint(get({get({This, gameCommandCanvas}), repaintBehavior}), (get({This, '$class'})):getCanvas(This));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onMotionGestureEvent", E)
        end.

