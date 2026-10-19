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
% package org.allbinary.input.automation.module.game.test
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.module.AbstractInputAutomationWorker
% import org.allbinary.input.automation.module.InputAutomationActionInterface
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript
% import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.cache.J2SECacheInterface
% import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface
% import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface

-module('TestInputAutomationCaptureWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractInputAutomationWorker', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, genericProfileActions}, undefined),
    put({This, 'MESSAGE'}, "GenericInputAutomationCaptureWorker"),
    put({This, 'PROCESS_DATA_WORKER_RESULTS'}, "processDataWorkerResults"),
    put({This, 'IMAGE_AVAILABLE_SO_PROCESSING'}, "Image Available so processing"),
    put({This, 'IMAGE_NOT_AVAILABLE'}, "Image Not Available"),
    ok.


new(InputAutomationActionInterface, GenericProfileActions, ImageComparatorConstraintsInterface, MotionRectangleConstraintsInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InputAutomationActionInterface, GenericProfileActions, ImageComparatorConstraintsInterface, MotionRectangleConstraintsInterface),
    This.

init(This, InputAutomationActionInterface, GenericProfileActions, ImageComparatorConstraintsInterface, MotionRectangleConstraintsInterface) ->
        'AbstractInputAutomationWorker':init(This, InputAutomationActionInterface),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'MESSAGE'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):setGenericProfileActions(This, GenericProfileActions).

% throws Exception
processDataWorkerResults(This) ->
        CacheInterface = 'CapturedBufferedImagesCacheSingleton':getInstance(),
        case ((fun(Target_N66642) -> (get({Target_N66642, '$class'})):size(Target_N66642) end)((get({CacheInterface, '$class'})):keySet(CacheInterface)) > 0) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'IMAGE_AVAILABLE_SO_PROCESSING'}), This, get({This, 'PROCESS_DATA_WORKER_RESULTS'})),
            AnyType = array:get(0, (fun(Target_N66803) -> (get({Target_N66803, '$class'})):toArray(Target_N66803) end)((get({CacheInterface, '$class'})):keySet(CacheInterface))),
            HashMap = (fun(Target_N66855) -> (get({Target_N66855, '$class'})):getHashMap(Target_N66855) end)((get({This, '$class'})):getGenericProfileActions(This)),
            Set = (get({HashMap, '$class'})):keySet(HashMap),
            ActionNameArray = (get({Set, '$class'})):toArray(Set),
            Size = array:size(ActionNameArray),
            lists:foreach(fun(Index) ->
                ActionNameString = array:get(Index, ActionNameArray),
                GenericProfileAction = (get({HashMap, '$class'})):get(HashMap, ActionNameString),
                GenericProfileActionScript = (get({GenericProfileAction, '$class'})):getGenericProfileActionScript(GenericProfileAction),
                Vector = (get({GenericProfileActionScript, '$class'})):getProfileActionConditionInterfaceVector(GenericProfileActionScript)
            end, lists:seq(0, Size - 1)),
            (get({CacheInterface, '$class'})):get(CacheInterface, AnyType);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'IMAGE_NOT_AVAILABLE'}), This, get({This, 'PROCESS_DATA_WORKER_RESULTS'}))
        end.

% throws Exception
process(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'PROCESS'})),
        (get({This, '$class'})):startDataWorkers(This),
        (get({This, '$class'})):processDataWorkerResults(This).

getGenericProfileActions(This) ->
        get({This, genericProfileActions}).

setGenericProfileActions(This, GenericProfileActions) ->
        put({This, genericProfileActions}, GenericProfileActions).

