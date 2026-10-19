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
% package org.allbinary.vector

-module('VectorInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, width}, 0),
    put({This, height}, 0),
    put({This, points}, undefined),
    put({This, totalFrames}, 0),
    ok.


new(Width, Height, Points, TotalFrames) when is_integer(Width), is_integer(Height), (is_tuple(Points) orelse Points =:= undefined), is_integer(TotalFrames) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Width, Height, Points, TotalFrames),
    This.

init(This, Width, Height, Points, TotalFrames) when is_integer(Width), is_integer(Height), (is_tuple(Points) orelse Points =:= undefined), is_integer(TotalFrames) ->
    init_fields(This),
        put({This, width}, Width),
        put({This, height}, Height),
        put({This, points}, Points),
        put({This, totalFrames}, TotalFrames).

getWidth(This) ->
        get({This, width}).

setWidth(This, Width) when is_integer(Width) ->
        put({This, width}, Width).

getHeight(This) ->
        get({This, height}).

setHeight(This, Height) when is_integer(Height) ->
        put({This, height}, Height).

getPoints(This) ->
        get({This, points}).

setPoints(This, Points) when (is_tuple(Points) orelse Points =:= undefined) ->
        put({This, points}, Points).

getTotalFrames(This) ->
        get({This, totalFrames}).

setTotalFrames(This, TotalFrames) when is_integer(TotalFrames) ->
        put({This, totalFrames}, TotalFrames).

