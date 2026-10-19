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
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('MotionRectanglesResultsEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, frame}, undefined),
    put({This, motionRectangles}, undefined),
    ok.


new(AnyType, Frame, MotionRectangles) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnyType, Frame, MotionRectangles),
    This.

init(This, AnyType, Frame, MotionRectangles) ->
        'AllBinaryEventObject':init(This, AnyType),
        init_fields(This),
        put({This, frame}, Frame),
        (get({This, '$class'})):setMotionRectangles(This, MotionRectangles).

getMotionRectangles(This) ->
        get({This, motionRectangles}).

setMotionRectangles(This, MotionRectangles) ->
        put({This, motionRectangles}, MotionRectangles).

getFrame(This) ->
        get({This, frame}).

