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
% import org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker
% import org.allbinary.media.image.comparison.ImageComparisonWorker
% import org.allbinary.media.image.comparison.SaveImageComparisonWorker
% import org.allbinary.media.image.comparison.motion.MotionRectanglesWorker
% import org.allbinary.media.image.comparison.motion.SaveMotionRectanglesResultsWorker
% import org.allbinary.media.image.comparison.motion.TestInputForMotionRectanglesResultsWorker

-module('TestInputAutomationWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, captureWorker}, undefined),
    put({This, imageComparisonWorker}, undefined),
    put({This, motionRectanglesWorker}, undefined),
    put({This, changedPixelsImageComparisonResultsWorker}, undefined),
    put({This, saveMotionRectanglesAsImagesWorker}, undefined),
    put({This, moveMouseToFirstMotionRectanglesResultsWorker}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, captureWorker}, 'ScreenCaptureImagesWorker':new()),
        put({This, changedPixelsImageComparisonResultsWorker}, 'SaveImageComparisonWorker':new()),
        put({This, saveMotionRectanglesAsImagesWorker}, 'SaveMotionRectanglesResultsWorker':new()),
        put({This, moveMouseToFirstMotionRectanglesResultsWorker}, 'TestInputForMotionRectanglesResultsWorker':new()),
        (get({get({This, motionRectanglesWorker}), '$class'})):addListenerInterface(get({This, motionRectanglesWorker}), get({This, saveMotionRectanglesAsImagesWorker})),
        (get({get({This, motionRectanglesWorker}), '$class'})):addListenerInterface(get({This, motionRectanglesWorker}), get({This, moveMouseToFirstMotionRectanglesResultsWorker})),
        (get({get({This, imageComparisonWorker}), '$class'})):addListenerInterface(get({This, imageComparisonWorker}), get({This, changedPixelsImageComparisonResultsWorker})),
        (get({get({This, imageComparisonWorker}), '$class'})):addListenerInterface(get({This, imageComparisonWorker}), get({This, motionRectanglesWorker})),
        (get({get({This, captureWorker}), '$class'})):addListenerInterface(get({This, captureWorker}), get({This, imageComparisonWorker})).

