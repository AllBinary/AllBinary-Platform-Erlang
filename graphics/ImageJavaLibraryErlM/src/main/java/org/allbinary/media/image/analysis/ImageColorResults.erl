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

-module('ImageColorResults').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, colorRange}, undefined),
    put({This, colorAverage}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):setColorRange(This, 'ColorRange':new()),
        (fun(Target_N65686) -> (get({Target_N65686, '$class'})):setMaxRed(Target_N65686, (-1)) end)((get({This, '$class'})):getColorRange(This)),
        (fun(Target_N65721) -> (get({Target_N65721, '$class'})):setMaxGreen(Target_N65721, (-1)) end)((get({This, '$class'})):getColorRange(This)),
        (fun(Target_N65756) -> (get({Target_N65756, '$class'})):setMaxBlue(Target_N65756, (-1)) end)((get({This, '$class'})):getColorRange(This)),
        (fun(Target_N65791) -> (get({Target_N65791, '$class'})):setMinRed(Target_N65791, 256) end)((get({This, '$class'})):getColorRange(This)),
        (fun(Target_N65821) -> (get({Target_N65821, '$class'})):setMinGreen(Target_N65821, 256) end)((get({This, '$class'})):getColorRange(This)),
        (fun(Target_N65851) -> (get({Target_N65851, '$class'})):setMinBlue(Target_N65851, 256) end)((get({This, '$class'})):getColorRange(This)),
        (get({This, '$class'})):setColorAverage(This, 'ColorAverage':new()).

getColorRange(This) ->
        get({This, colorRange}).

setColorRange(This, ColorRange) ->
        put({This, colorRange}, ColorRange).

getColorAverage(This) ->
        get({This, colorAverage}).

setColorAverage(This, ColorAverage) ->
        put({This, colorAverage}, ColorAverage).

