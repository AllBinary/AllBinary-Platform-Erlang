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

-module('ImageColorRangeResults').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, colorRangeInterface}, undefined),
    put({This, matchingPixelsChecked}, 0),
    put({This, totalPixelsChecked}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({This, '$class'})):setColorRangeInterface(This, 'ColorRange':new()).

getColorRangeInterface(This) ->
        get({This, colorRangeInterface}).

setColorRangeInterface(This, ColorRangeInterface) ->
        put({This, colorRangeInterface}, ColorRangeInterface).

getMatchingPixelsChecked(This) ->
        get({This, matchingPixelsChecked}).

setMatchingPixelsChecked(This, MatchingPixelsChecked) when is_integer(MatchingPixelsChecked) ->
        put({This, matchingPixelsChecked}, MatchingPixelsChecked).

addMatchingPixelsChecked(This) ->
        put({This, matchingPixelsChecked}, get({This, matchingPixelsChecked}) + 1).

getTotalPixelsChecked(This) ->
        get({This, totalPixelsChecked}).

addTotalPixelsChecked(This) ->
        put({This, totalPixelsChecked}, get({This, totalPixelsChecked}) + 1).

setTotalPixelsChecked(This, TotalPixelsChecked) when is_integer(TotalPixelsChecked) ->
        put({This, totalPixelsChecked}, TotalPixelsChecked).

getPercent(This) ->
        ((float((get({This, '$class'})):getMatchingPixelsChecked(This)) / float((get({This, '$class'})):getTotalPixelsChecked(This)))).

