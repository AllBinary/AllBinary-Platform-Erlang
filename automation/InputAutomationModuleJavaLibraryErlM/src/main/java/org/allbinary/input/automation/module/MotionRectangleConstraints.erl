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
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface

-module('MotionRectangleConstraints').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MotionRectangleConstraintsInterface

init_fields(This) ->
    put({This, minDimension}, undefined),
    put({This, maxDimension}, undefined),
    put({This, maxMotionRectangles}, 0),
    put({This, minArea}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getMinDimension(This) ->
        get({This, minDimension}).

getMaxDimension(This) ->
        get({This, maxDimension}).

isTooSmall(This, Rectangle) ->
        try
        case ((get({Rectangle, width}) < get({(get({This, '$class'})):getMinDimension(This), width})) orelse (get({Rectangle, height}) < get({(get({This, '$class'})):getMinDimension(This), height}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isAreaTooSmall(This, Rectangle) ->
        try
        case ((get({Rectangle, width}) * get({Rectangle, height})) < (get({This, '$class'})):getMinArea(This)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isTooBig(This, Rectangle) ->
        try
        case ((get({Rectangle, width}) > get({(get({This, '$class'})):getMaxDimension(This), width})) orelse (get({Rectangle, height}) > get({(get({This, '$class'})):getMaxDimension(This), height}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isValid(This, Frame, BufferedImage, Rectangle) ->
        erlang:error({'RuntimeException'}).

setMinDimension(This, MinDimension) ->
        put({This, minDimension}, MinDimension).

setMaxDimension(This, MaxDimension) ->
        put({This, maxDimension}, MaxDimension).

getMaxMotionRectangles(This) ->
        get({This, maxMotionRectangles}).

setMaxMotionRectangles(This, MaxMotionRectangles) when is_integer(MaxMotionRectangles) ->
        put({This, maxMotionRectangles}, MaxMotionRectangles).

getMinArea(This) ->
        get({This, minArea}).

setMinArea(This, MinArea) when is_integer(MinArea) ->
        put({This, minArea}, MinArea).

