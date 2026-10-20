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
% package org.allbinary.input
% import org.allbinary.android.input.motion.AnalogLocationInputProcessor
% import org.allbinary.game.input.GameInputProcessor
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.analog.AnalogLocationInput
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.graphics.CustomGPoint
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('DirectionalAnalogLocationInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameKeyEventSourceInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AnalogLocationInputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, inputProcessorArray}, undefined),
    put({This, gameKeyFactory}, 'GameKeyFactory':getInstance()),
    put({This, leftGameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    put({This, rightGameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    put({This, upGameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    put({This, downGameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    put({This, leftTriggerGameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    put({This, rightTriggerGameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    ok.


new(InputProcessorArray) when (is_tuple(InputProcessorArray) orelse InputProcessorArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputProcessorArray),
    This.

'$init'(This, InputProcessorArray) when (is_tuple(InputProcessorArray) orelse InputProcessorArray =:= undefined) ->
    'AnalogLocationInputProcessor':'$init'(This),
    init_fields(This),
        put({This, inputProcessorArray}, InputProcessorArray),
        try
            put({This, leftGameKeyEvent}, (fun(Target_N66417) -> (get({Target_N66417, '$class'})):getInstanceForInput(Target_N66417, This, get({get({This, gameKeyFactory}), 'LEFT'})) end)('GameKeyEventFactory':getInstance())),
            put({This, rightGameKeyEvent}, (fun(Target_N66486) -> (get({Target_N66486, '$class'})):getInstanceForInput(Target_N66486, This, get({get({This, gameKeyFactory}), 'RIGHT'})) end)('GameKeyEventFactory':getInstance())),
            put({This, upGameKeyEvent}, (fun(Target_N66555) -> (get({Target_N66555, '$class'})):getInstanceForInput(Target_N66555, This, get({get({This, gameKeyFactory}), 'UP'})) end)('GameKeyEventFactory':getInstance())),
            put({This, downGameKeyEvent}, (fun(Target_N66624) -> (get({Target_N66624, '$class'})):getInstanceForInput(Target_N66624, This, get({get({This, gameKeyFactory}), 'DOWN'})) end)('GameKeyEventFactory':getInstance())),
            put({This, leftTriggerGameKeyEvent}, (fun(Target_N66693) -> (get({Target_N66693, '$class'})):getInstanceForInput(Target_N66693, This, get({get({This, gameKeyFactory}), 'KEY_NUM0'})) end)('GameKeyEventFactory':getInstance())),
            put({This, rightTriggerGameKeyEvent}, (fun(Target_N66762) -> (get({Target_N66762, '$class'})):getInstanceForInput(Target_N66762, This, get({get({This, gameKeyFactory}), 'KEY_NUM5'})) end)('GameKeyEventFactory':getInstance()))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end.

process(This, AllbinaryLayerManager, AnalogLocationInput) ->
        try
            put({local, customGPoint}, undefined),
            put({local, customGPoint}, (get({AnalogLocationInput, '$class'})):getCustomGPoint(AnalogLocationInput)),
            X = (get({get({local, customGPoint}), '$class'})):getX(get({local, customGPoint})),
            Y = (get({get({local, customGPoint}), '$class'})):getY(get({local, customGPoint})),
            LeftTrigger = (get({AnalogLocationInput, '$class'})):getLeftTrigger(AnalogLocationInput),
            RightTrigger = (get({AnalogLocationInput, '$class'})):getRightTrigger(AnalogLocationInput),
            case (X < 0) of
                true ->
                (fun(Target_N67369) -> (get({Target_N67369, '$class'})):processAnalog(Target_N67369, AllbinaryLayerManager, get({This, leftGameKeyEvent}), X) end)(array:get((get({get({This, leftGameKeyEvent}), '$class'})):getKey(get({This, leftGameKeyEvent})), get({This, inputProcessorArray})));
                false ->
                case (X > 0) of
                true ->
                (fun(Target_N67285) -> (get({Target_N67285, '$class'})):processAnalog(Target_N67285, AllbinaryLayerManager, get({This, rightGameKeyEvent}), X) end)(array:get((get({get({This, rightGameKeyEvent}), '$class'})):getKey(get({This, rightGameKeyEvent})), get({This, inputProcessorArray})));
                false -> ok
            end
            end,
            case (Y < 0) of
                true ->
                (fun(Target_N67577) -> (get({Target_N67577, '$class'})):processAnalog(Target_N67577, AllbinaryLayerManager, get({This, downGameKeyEvent}), Y) end)(array:get((get({get({This, downGameKeyEvent}), '$class'})):getKey(get({This, downGameKeyEvent})), get({This, inputProcessorArray})));
                false ->
                case (Y > 0) of
                true ->
                (fun(Target_N67493) -> (get({Target_N67493, '$class'})):processAnalog(Target_N67493, AllbinaryLayerManager, get({This, upGameKeyEvent}), Y) end)(array:get((get({get({This, upGameKeyEvent}), '$class'})):getKey(get({This, upGameKeyEvent})), get({This, inputProcessorArray})));
                false -> ok
            end
            end,
            case (LeftTrigger > 0) of
                true ->
                (fun(Target_N67681) -> (get({Target_N67681, '$class'})):processAnalog(Target_N67681, AllbinaryLayerManager, get({This, leftTriggerGameKeyEvent}), LeftTrigger) end)(array:get((get({get({This, leftTriggerGameKeyEvent}), '$class'})):getKey(get({This, leftTriggerGameKeyEvent})), get({This, inputProcessorArray})));
                false -> ok
            end,
            case (RightTrigger > 0) of
                true ->
                (fun(Target_N67789) -> (get({Target_N67789, '$class'})):processAnalog(Target_N67789, AllbinaryLayerManager, get({This, rightTriggerGameKeyEvent}), RightTrigger) end)(array:get((get({get({This, rightTriggerGameKeyEvent}), '$class'})):getKey(get({This, rightTriggerGameKeyEvent})), get({This, inputProcessorArray})));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to process analog input", This, get({CommonStrings, 'PROCESS'}), E)
        end.

getSourceId(This) ->
        0.

