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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.CacheableInterface

-module('MotionRectanglesResultsFrameCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, motionRectangles}, undefined),
    put({This, frame}, undefined),
    ok.


new(MotionRectangles, Frame) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MotionRectangles, Frame),
    This.

'$init'(This, MotionRectangles, Frame) ->
    init_fields(This),
        put({This, frame}, Frame),
        (get({This, '$class'})):setMotionRectangles(This, MotionRectangles).

getKey(This) ->
        get({This, frame}).

getMotionRectangles(This) ->
        get({This, motionRectangles}).

setMotionRectangles(This, MotionRectangles) ->
        put({This, motionRectangles}, MotionRectangles).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Frame: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66141) -> (get({Target_N66141, '$class'})):toString(Target_N66141) end)((get({This, '$class'})):getKey(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

