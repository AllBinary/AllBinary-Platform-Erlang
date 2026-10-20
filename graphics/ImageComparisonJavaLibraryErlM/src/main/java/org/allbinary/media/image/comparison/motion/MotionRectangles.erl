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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.media.image.comparison.ImageComparisonResult

-module('MotionRectangles').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, rectangleVector}, undefined),
    put({This, imageComparisonResult}, undefined),
    put({This, 'MAX_PIXEL_DISTANCE_THRESHOLD'}, 2),
    ok.


new(Name, ImageComparisonResult) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, ImageComparisonResult),
    This.

'$init'(This, Name, ImageComparisonResult) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        (get({This, '$class'})):setImageComparisonResult(This, ImageComparisonResult),
        (get({This, '$class'})):setVector(This, 'BasicArrayListD':new()).

getVector(This) ->
        get({This, rectangleVector}).

setVector(This, RectangleVector) ->
        put({This, rectangleVector}, RectangleVector).

getName(This) ->
        get({This, name}).

getImageComparisonResult(This) ->
        get({This, imageComparisonResult}).

setImageComparisonResult(This, ImageComparisonResult) ->
        put({This, imageComparisonResult}, ImageComparisonResult).

