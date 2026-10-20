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
% package org.allbinary.media.image.comparison.motion
% import java.awt.Rectangle
% import java.awt.event.InputEvent
% import java.awt.event.KeyEvent
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.input.automation.robot.TempInputRobotNames
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable

-module('TestInputForMotionRectanglesResultsWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MotionRectanglesResultsListener

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, index}, 0),
    put({This, running}, false),
    put({This, motionRectanglesVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, motionRectanglesVector}, 'BasicArrayListD':new()).

getMotionRectanglesVector(This) ->
        get({This, motionRectanglesVector}).

onMotionRectanglesImageComparisonResultsEvent(This, MotionRectanglesImageComparisonResultsEvent) ->
        (fun(Target_N66302) -> (get({Target_N66302, '$class'})):add(Target_N66302, (get({MotionRectanglesImageComparisonResultsEvent, '$class'})):getMotionRectangles(MotionRectanglesImageComparisonResultsEvent)) end)((get({This, '$class'})):getMotionRectanglesVector(This)),
        (get({This, '$class'})):run(This).

onEvent(This, AllBinaryEventObject) ->
        (get({This, '$class'})):onMotionRectanglesImageComparisonResultsEvent(This, AllBinaryEventObject).

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
            MotionRectangles = (fun(Target_N66779) -> (get({Target_N66779, '$class'})):get(Target_N66779, 0) end)((get({This, '$class'})):getMotionRectanglesVector(This)),
            MotionRectangleVector = (get({MotionRectangles, '$class'})):getVector(MotionRectangles),
            case ((get({MotionRectangleVector, '$class'})):size(MotionRectangleVector) > 0) of
                true ->
                Rectangle = (get({MotionRectangleVector, '$class'})):get(MotionRectangleVector, 0),
                RobotHashtable = (fun(Target_N66993) -> (get({Target_N66993, '$class'})):get(Target_N66993) end)('InputRobotFactory':getInstance()),
                InputTypeNameArray = (fun(Target_N67070) -> (get({Target_N67070, '$class'})):toArray(Target_N67070) end)((get({RobotHashtable, '$class'})):keySet(RobotHashtable)),
                Size = array:size(InputTypeNameArray),
                lists:foreach(fun(Index) ->
                    InputTypeNameString = array:get(Index, InputTypeNameArray),
                    InputRobotInterface = (get({RobotHashtable, '$class'})):get(RobotHashtable, InputTypeNameString),
                    (get({InputRobotInterface, '$class'})):mouseMoveToTarget(InputRobotInterface, Rectangle),
                    case ((fun(Target_N67332) -> (get({Target_N67332, '$class'})):compareTo(Target_N67332, get({'TempInputRobotNames', 'DX_NAME'})) end)((get({InputRobotInterface, '$class'})):getName(InputRobotInterface)) =:= 0) of
                        true ->
                        (get({InputRobotInterface, '$class'})):mousePress(InputRobotInterface, get({'InputEvent', 'BUTTON1_MASK'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):mouseRelease(InputRobotInterface, get({'InputEvent', 'BUTTON1_MASK'})),
                        (get({InputRobotInterface, '$class'})):mousePress(InputRobotInterface, get({'InputEvent', 'BUTTON2_MASK'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):mouseRelease(InputRobotInterface, get({'InputEvent', 'BUTTON2_MASK'})),
                        (get({InputRobotInterface, '$class'})):mousePress(InputRobotInterface, get({'InputEvent', 'BUTTON3_MASK'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):mouseRelease(InputRobotInterface, get({'InputEvent', 'BUTTON3_MASK'})),
                        (get({InputRobotInterface, '$class'})):keyPress(InputRobotInterface, get({'KeyEvent', 'VK_1'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):keyRelease(InputRobotInterface, get({'KeyEvent', 'VK_1'})),
                        (get({InputRobotInterface, '$class'})):keyPress(InputRobotInterface, get({'KeyEvent', 'VK_2'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):keyRelease(InputRobotInterface, get({'KeyEvent', 'VK_2'})),
                        (get({InputRobotInterface, '$class'})):keyPress(InputRobotInterface, get({'KeyEvent', 'VK_3'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):keyRelease(InputRobotInterface, get({'KeyEvent', 'VK_3'})),
                        (get({InputRobotInterface, '$class'})):keyPress(InputRobotInterface, get({'KeyEvent', 'VK_4'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):keyRelease(InputRobotInterface, get({'KeyEvent', 'VK_4'})),
                        (get({InputRobotInterface, '$class'})):keyPress(InputRobotInterface, get({'KeyEvent', 'VK_F1'})),
                        timer:sleep(300),
                        (get({InputRobotInterface, '$class'})):keyRelease(InputRobotInterface, get({'KeyEvent', 'VK_F1'}));
                        false -> ok
                    end
                end, lists:seq(0, Size - 1));
                false -> ok
            end,
            put({This, index}, get({This, index}) + 1),
            (fun(Target_N68320) -> (get({Target_N68320, '$class'})):remove(Target_N68320, MotionRectangles) end)((get({This, '$class'})):getMotionRectanglesVector(This)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

