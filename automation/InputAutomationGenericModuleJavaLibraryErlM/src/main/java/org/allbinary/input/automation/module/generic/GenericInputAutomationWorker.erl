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
% package org.allbinary.input.automation.module.generic
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.module.AbstractInputAutomationWorker
% import org.allbinary.input.automation.module.InputAutomationActionInterface
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript
% import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.cache.J2SECacheInterface
% import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface
% import org.allbinary.media.image.comparison.ImageComparisonWorker
% import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface
% import org.allbinary.media.image.comparison.motion.MotionRectanglesWorker

-module('GenericInputAutomationWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractInputAutomationWorker', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'PROCESS_DATA_WORKER_RESULTS'}, "processDataWorkerResults"),
    put({This, lastFrame}, (-1)),
    put({This, frame}, undefined),
    put({This, genericProfile}, undefined),
    ok.


new(InputAutomationActionInterface, GenericProfile, MotionRectangleConstraintsInterface, ImageComparatorConstraintsInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InputAutomationActionInterface, GenericProfile, MotionRectangleConstraintsInterface, ImageComparatorConstraintsInterface),
    This.

init(This, InputAutomationActionInterface, GenericProfile, MotionRectangleConstraintsInterface, ImageComparatorConstraintsInterface) ->
        'AbstractInputAutomationWorker':init(This, InputAutomationActionInterface),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):setCaptureWorker(This, 'GenericProfileCaptureWorkerFactory':getInstance(GenericProfile)),
        (get({This, '$class'})):setInputAutomationActionInterface(This, InputAutomationActionInterface),
        (get({This, '$class'})):setImageComparisonWorker(This, 'ImageComparisonWorker':new(ImageComparatorConstraintsInterface)),
        (get({This, '$class'})):setMotionRectanglesWorker(This, 'MotionRectanglesWorker':new(MotionRectangleConstraintsInterface)),
        (get({This, '$class'})):setGenericProfile(This, GenericProfile),
        Vector = (fun(Target_N66737) -> (get({Target_N66737, '$class'})):getGenericProfileDataWorkerTypeVector(Target_N66737) end)((get({This, '$class'})):getGenericProfile(This)),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            GenericProfileDataWorkerType = (get({Vector, '$class'})):get(Vector, Index),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Adding Listener: ", GenericProfileDataWorkerType]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'COMPARISON'})) of
                true ->
                (fun(Target_N67081) -> (get({Target_N67081, '$class'})):addListenerInterface(Target_N67081, (get({This, '$class'})):getImageComparisonWorker(This)) end)((get({This, '$class'})):getCaptureWorker(This));
                false ->
                case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'MOTION'})) of
                true ->
                (fun(Target_N67036) -> (get({Target_N67036, '$class'})):addListenerInterface(Target_N67036, (get({This, '$class'})):getMotionRectanglesWorker(This)) end)((get({This, '$class'})):getImageComparisonWorker(This));
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
processDataWorkerResults(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({This, 'PROCESS_DATA_WORKER_RESULTS'})),
        (get({This, '$class'})):waitForDataWorkers(This),
        CacheInterface = 'CapturedBufferedImagesCacheSingleton':getInstance(),
        KeyArray = (fun(Target_N67470) -> (get({Target_N67470, '$class'})):toArray(Target_N67470) end)((get({CacheInterface, '$class'})):keySet(CacheInterface)),
        case (array:size(KeyArray) > 0) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Image Available", This, get({This, 'PROCESS_DATA_WORKER_RESULTS'})),
            (get({This, '$class'})):setFrame(This, array:get((array:size(KeyArray) - 1), KeyArray)),
            case ((get({This, '$class'})):getFrame(This) > get({This, lastFrame})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Processing new frame: ", (get({This, '$class'})):getFrame(This)]), This, get({This, 'PROCESS_DATA_WORKER_RESULTS'})),
                HashMap = (fun(Target_N67817) -> (get({Target_N67817, '$class'})):getHashMap(Target_N67817) end)((fun(Target_N67824) -> (get({Target_N67824, '$class'})):getGenericProfileActions(Target_N67824) end)((get({This, '$class'})):getGenericProfile(This))),
                Set = (get({HashMap, '$class'})):keySet(HashMap),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Processing ", (get({Set, '$class'})):size(Set)]), "Actions"]), This, get({This, 'PROCESS_DATA_WORKER_RESULTS'})),
                ActionNameArray = (get({Set, '$class'})):toArray(Set),
                Size = array:size(ActionNameArray),
                lists:foreach(fun(Index) ->
                    ActionNameString = array:get(Index, ActionNameArray),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Processing Action: ", ActionNameString]), This, get({This, 'PROCESS_DATA_WORKER_RESULTS'})),
                    GenericProfileAction = (get({HashMap, '$class'})):get(HashMap, ActionNameString),
                    GenericProfileActionScript = (get({GenericProfileAction, '$class'})):getGenericProfileActionScript(GenericProfileAction),
                    Vector = (get({GenericProfileActionScript, '$class'})):getProfileActionConditionInterfaceVector(GenericProfileActionScript),
                    'CaptureWorkerUtil':processProfileActionConditions(Vector, (get({This, '$class'})):getFrame(This))
                end, lists:seq(0, Size - 1)),
                put({This, lastFrame}, (get({This, '$class'})):getFrame(This));
                false -> ok
            end;
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Image Not Available", This, get({This, 'PROCESS_DATA_WORKER_RESULTS'}))
        end.

% throws Exception
process(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'PROCESS'})),
        (get({This, '$class'})):startDataWorkers(This),
        (get({This, '$class'})):processDataWorkerResults(This).

getGenericProfile(This) ->
        get({This, genericProfile}).

setGenericProfile(This, GenericProfile) ->
        put({This, genericProfile}, GenericProfile).

getFrame(This) ->
        get({This, frame}).

setFrame(This, Frame) ->
        put({This, frame}, Frame).

