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
% package org.allbinary.media.image.analysis

-module('ImageAnalysisResults').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, imageColorRangeResults}, undefined),
    put({This, imageColorResults}, undefined),
    put({This, averageAmbientLevel}, 0.0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, imageColorRangeResults}, 'ImageColorRangeResults':new()),
        put({This, imageColorResults}, 'ImageColorResults':new()).

getImageColorRangeResults(This) ->
        get({This, imageColorRangeResults}).

setImageColorRangeResults(This, ImageColorRangeResults) ->
        put({This, imageColorRangeResults}, ImageColorRangeResults).

getAverageAmbientLevel(This) ->
        get({This, averageAmbientLevel}).

setAverageAmbientLevel(This, AverageAmbientLevel) when is_number(AverageAmbientLevel) ->
        put({This, averageAmbientLevel}, AverageAmbientLevel).

getImageColorResults(This) ->
        get({This, imageColorResults}).

setImageColorResults(This, ImageColorResults) ->
        put({This, imageColorResults}, ImageColorResults).

