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
% import java.util.Vector
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('MotionRectangle').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Cloneable

init_fields(This) ->
    put({This, rectangle}, undefined),
    put({This, pixelDeltaVector}, undefined),
    ok.


new(Rectangle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Rectangle),
    This.

init(This, Rectangle) ->
    init_fields(This),
        (get({This, '$class'})):setRectangle(This, Rectangle),
        (get({This, '$class'})):setPixelDeltaVector(This, 'BasicArrayListD':new()).

getRectangle(This) ->
        get({This, rectangle}).

setRectangle(This, Rectangle) ->
        put({This, rectangle}, Rectangle).

getPixelDeltaVector(This) ->
        get({This, pixelDeltaVector}).

setPixelDeltaVector(This, PixelDeltaVector) ->
        put({This, pixelDeltaVector}, PixelDeltaVector).

clone(This) ->
        MotionRectangle = 'MotionRectangle':new((fun(Target_N66123) -> (get({Target_N66123, '$class'})):clone(Target_N66123) end)((get({This, '$class'})):getRectangle(This))),
        (get({MotionRectangle, '$class'})):setPixelDeltaVector(MotionRectangle, (fun(Target_N66192) -> (get({Target_N66192, '$class'})):clone(Target_N66192) end)((get({This, '$class'})):getPixelDeltaVector(This))),
        MotionRectangle.

