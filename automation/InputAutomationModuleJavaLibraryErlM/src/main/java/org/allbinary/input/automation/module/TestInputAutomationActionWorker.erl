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
% package org.allbinary.input.automation.module
% import java.util.Set
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface
% import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface
% import org.allbinary.util.ABHashtable

-module('TestInputAutomationActionWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractInputAutomationWorker', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, sleep}, 0),
    ok.


new(Sleep, InputAutomationActionInterface, ImageComparatorConstraintsInterface, MotionRectangleConstraintsInterface) when is_integer(Sleep) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Sleep, InputAutomationActionInterface, ImageComparatorConstraintsInterface, MotionRectangleConstraintsInterface),
    This.

init(This, Sleep, InputAutomationActionInterface, ImageComparatorConstraintsInterface, MotionRectangleConstraintsInterface) when is_integer(Sleep) ->
        'AbstractInputAutomationWorker':init(This, InputAutomationActionInterface),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "BasicTestAttackWorder", This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, sleep}, Sleep).

% throws Exception
processBetweenWorkers(This) ->
        timer:sleep(2000).

% throws Exception
process(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'PROCESS'})),
        Hashtable = (fun(Target_N66252) -> (get({Target_N66252, '$class'})):get(Target_N66252) end)('InputRobotFactory':getInstance()),
        Set = (get({Hashtable, '$class'})):keySet(Hashtable),
        InputTypeNameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(InputTypeNameArray),
        lists:foreach(fun(Index) ->
            InputTypeNameString = array:get(Index, InputTypeNameArray),
            Robot = (get({Hashtable, '$class'})):get(Hashtable, InputTypeNameString),
            case (get({This, sleep}) > 0) of
                true ->
                timer:sleep(get({This, sleep}));
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

