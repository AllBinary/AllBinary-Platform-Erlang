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
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Command
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.layer.SWTUtil
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.graphics.form.CommandCurrentSelectionForm
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.audio.PrimaryPlayerQueueFactory
% import org.allbinary.media.audio.SelectSound
% import org.allbinary.thread.PrimaryThreadPool
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList

-module('CommandFormInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicMenuInputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, 'MOTION_GESTURE_SOURCE_ID'}, get({'GameKeyEventFactory':getInstance(), 'MOTION_GESTURE_SOURCE_ID'})),
    put({This, 'CLICK_DELAY'}, 150),
    put({This, clickTimeHelper}, 'TimeDelayHelper':new(get({This, 'CLICK_DELAY'}))),
    put({This, 'DOUBLE_CLICK_DELAY'}, 1200),
    put({This, doubleClickTimeHelper}, 'TimeDelayHelper':new(get({This, 'DOUBLE_CLICK_DELAY'}))),
    put({This, isSingleKeyProcessing}, (fun(Target_N66534) -> (get({Target_N66534, '$class'})):isSingleKeyProcessing(Target_N66534) end)('InputFeatureFactory':getInstance())),
    put({This, form}, undefined),
    put({This, hasPressed}, false),
    put({This, 'PROCESS_COMMAND'}, "processCommand"),
    put({This, 'NAME_LABEL'}, " ScrollSelectionForm: "),
    ok.


new(GameKeyEventList, PlayerInputId, GameCanvas, Form) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameKeyEventList, PlayerInputId, GameCanvas, Form),
    This.

init(This, GameKeyEventList, PlayerInputId, GameCanvas, Form) when is_integer(PlayerInputId) ->
        'BasicMenuInputProcessor':init(This, GameKeyEventList, PlayerInputId, GameCanvas),
        init_fields(This),
        put({This, form}, Form).

% throws Exception
processInput(This, Key) when is_integer(Key) ->
        try
        case ((((Key =:= get({'Canvas', 'LEFT'})) orelse (Key =:= get({'Canvas', 'RIGHT'}))) orelse (Key =:= get({'Canvas', 'UP'}))) orelse (Key =:= get({'Canvas', 'DOWN'}))) of
            true ->
            (fun(Target_N67070) -> (get({Target_N67070, '$class'})):add(Target_N67070, 'SelectSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
            (get({get({This, form}), '$class'})):processInputKey(get({This, form}), Key),
            throw({'$return', 1});
            false ->
            case (Key =:= get({'Canvas', 'FIRE'})) of
            true ->
            (fun(Target_N66988) -> (get({Target_N66988, '$class'})):add(Target_N66988, 'SelectSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
            throw({'$return', (get({This, '$class'})):processCommand(This)});
            false -> ok
        end
        end,
        0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

processCommand(This) ->
        try
        CommandCurrentSelectionForm = get({This, form}),
        Command = (get({CommandCurrentSelectionForm, '$class'})):getSelectedCommand(CommandCurrentSelectionForm),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({Command, '$class'})):toString(Command), This, get({This, 'PROCESS_COMMAND'})),
        Features = 'Features':getInstance(),
        OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
        case ((get({'SWTUtil', isSWT}) andalso (get({Features, '$class'})):isFeature(Features, get({OpenGLFeatureFactory, 'OPENGL'}))) andalso (Command =/= get({'GameCommandsFactory':getInstance(), 'EXIT_COMMAND'}))) of
            true ->
            (fun(Target_N67713) -> (get({Target_N67713, '$class'})):run(Target_N67713) end)('CommandRunnable':new(This, Command));
            false ->
            (fun(Target_N67649) -> (get({Target_N67649, '$class'})):runTask(Target_N67649, 'CommandRunnable':new(This, Command)) end)('PrimaryThreadPool':getInstance())
        end,
        case (Command =:= get({'GameCommandsFactory':getInstance(), 'QUIT_COMMAND'})) of
            true ->
            throw({'$return', (-1)});
            false ->
            throw({'$return', 1})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processInputList(This) ->
        try
        try
            MotionInputsIndex = (get({This, '$class'})):processMotionInputs(This),
            List = (get({This, '$class'})):getGameKeyEventList(This),
            Size = (get({List, '$class'})):size(List),
            put({local, key}, 0),
            put({local, gameKeyEvent}, undefined),
            lists:foreach(fun(Index) ->
                put({local, gameKeyEvent}, array:get(Index, get({List, objectArray}))),
                put({local, key}, (get({get({local, gameKeyEvent}), '$class'})):getKey(get({local, gameKeyEvent}))),
                case ((get({get({local, gameKeyEvent}), '$class'})):getSourceId(get({local, gameKeyEvent})) =/= get({This, 'MOTION_GESTURE_SOURCE_ID'})) of
                    true ->
                    case ((get({This, '$class'})):processInput(This, get({local, key})) =:= 1) of
                        true ->
                        throw('$break');
                        false -> ok
                    end;
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            (get({This, '$class'})):clear(This),
            case ((Size > 0) orelse (MotionInputsIndex >= 0)) of
                true ->
                throw({'$return', 1});
                false ->
                throw({'$return', (-1)})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'PROCESS_INPUT'}), E),
            (-1)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processMotionInputs(This) ->
        LastIndex = ((get({get({This, motionGestureEventList}), '$class'})):size(get({This, motionGestureEventList})) - 1),
        case (LastIndex >= 0) of
            true ->
            MotionGestureEvent = array:get(LastIndex, get({get({This, motionGestureEventList}), objectArray})),
            (get({This, '$class'})):processMotionInput(This, MotionGestureEvent);
            false -> ok
        end,
        (get({get({This, motionGestureEventList}), '$class'})):clear(get({This, motionGestureEventList})),
        LastIndex.

% throws Exception
processMotionInput(This, MotionGestureEvent) ->
        TouchMotionGestureFactory = 'TouchMotionGestureFactory':getInstance(),
        MotionGestureInput = (get({MotionGestureEvent, '$class'})):getMotionGesture(MotionGestureEvent),
        case (MotionGestureInput =:= get({TouchMotionGestureFactory, 'RELEASED'})) of
            true ->
            Point = (get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent),
            case (get({get({This, form}), '$class'})):isInForm(get({This, form}), Point) of
                true ->
                Index = (get({get({This, form}), '$class'})):getSelectedIndexForPoint(get({This, form}), Point),
                case (Index =/= (-1)) of
                    true ->
                    (fun(Target_N69268) -> (get({Target_N69268, '$class'})):add(Target_N69268, 'SelectSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
                    case (Index =:= (get({get({This, form}), '$class'})):getSelectedIndex(get({This, form}))) of
                        true ->
                        case (get({get({This, clickTimeHelper}), '$class'})):isTimeTNT(get({This, clickTimeHelper})) of
                            true ->
                            (get({This, '$class'})):processCommand(This);
                            false -> ok
                        end;
                        false ->
                        (get({get({This, form}), '$class'})):setSelectedIndex(get({This, form}), Index)
                    end;
                    false ->
                    ok
                end;
                false -> ok
            end,
            case get({This, hasPressed}) of
                true ->
                case (not (get({get({This, doubleClickTimeHelper}), '$class'})):isTimeTNT(get({This, doubleClickTimeHelper}))) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Double Press", This, get({get({This, gameInputStrings}), 'PROCESS_MOTION_INPUT'})),
                    (get({This, '$class'})):processCommand(This);
                    false -> ok
                end,
                put({get({This, doubleClickTimeHelper}), delay}, get({This, 'DOUBLE_CLICK_DELAY'})),
                (get({get({This, doubleClickTimeHelper}), '$class'})):setStartTimeTNT(get({This, doubleClickTimeHelper}));
                false -> ok
            end,
            put({This, hasPressed}, false);
            false ->
            case (MotionGestureInput =:= get({TouchMotionGestureFactory, 'PRESSED'})) of
            true ->
            put({get({This, doubleClickTimeHelper}), delay}, 0),
            put({This, hasPressed}, true);
            false -> ok
        end
        end.

toString(This) ->
        (fun(Target_N69772) -> (get({Target_N69772, '$class'})):toString(Target_N69772) end)((fun(Target_N69779) -> (get({Target_N69779, '$class'})):append(Target_N69779, (get({get({This, form}), '$class'})):toString(get({This, form}))) end)((fun(Target_N69786) -> (get({Target_N69786, '$class'})):append(Target_N69786, get({This, 'NAME_LABEL'})) end)((fun(Target_N69793) -> (get({Target_N69793, '$class'})):append(Target_N69793, 'BasicMenuInputProcessor':toString(This)) end)('StringMaker':new())))).

