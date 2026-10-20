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
% import java.awt.image.BufferedImage
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('ConstrainedMotionRectangles').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionRectangles', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "constrainedMotionRectangles_"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, motionRectangleConstraintsInterface}, undefined),
    ok.


new(MotionRectangleConstraintsInterface, MotionRectangles) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MotionRectangleConstraintsInterface, MotionRectangles),
    This.

'$init'(This, MotionRectangleConstraintsInterface, MotionRectangles) ->
        'MotionRectangles':'$init'(This, get({'ConstrainedMotionRectangles', 'NAME'}), (get({MotionRectangles, '$class'})):getImageComparisonResult(MotionRectangles)),
        init_fields(This),
        (get({This, '$class'})):setMotionRectangleConstraintsInterface(This, MotionRectangleConstraintsInterface).

% throws Exception
applyMotionRectangleConstraints(This, MotionRectangles) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Start - Size Before: ", (fun(Target_N66066) -> (get({Target_N66066, '$class'})):size(Target_N66066) end)((get({MotionRectangles, '$class'})):getVector(MotionRectangles))]), This, "applyMotionRectangleConstraints"),
        BufferedImageArray = (fun(Target_N66119) -> (get({Target_N66119, '$class'})):getBufferedImages(Target_N66119) end)((get({MotionRectangles, '$class'})):getImageComparisonResult(MotionRectangles)),
        BufferedImage = array:get(1, BufferedImageArray),
        Vector = 'BasicArrayListD':new(),
        Vector2 = (get({MotionRectangles, '$class'})):getVector(MotionRectangles),
        Size = (get({Vector2, '$class'})):size(Vector2),
        lists:foreach(fun(Index) ->
            try
            MotionRectangle = (get({Vector2, '$class'})):get(Vector2, Index),
            Rectangle = (get({MotionRectangle, '$class'})):getRectangle(MotionRectangle),
            IsTooSmall = (fun(Target_N66498) -> (get({Target_N66498, '$class'})):isTooSmall(Target_N66498, Rectangle) end)((get({This, '$class'})):getMotionRectangleConstraintsInterface(This)),
            case IsTooSmall of
                true ->
                throw('$continue');
                false -> ok
            end,
            IsAreaTooSmall = (fun(Target_N66578) -> (get({Target_N66578, '$class'})):isAreaTooSmall(Target_N66578, Rectangle) end)((get({This, '$class'})):getMotionRectangleConstraintsInterface(This)),
            case IsAreaTooSmall of
                true ->
                throw('$continue');
                false -> ok
            end,
            IsTooBig = (fun(Target_N66658) -> (get({Target_N66658, '$class'})):isTooBig(Target_N66658, Rectangle) end)((get({This, '$class'})):getMotionRectangleConstraintsInterface(This)),
            case IsTooBig of
                true ->
                throw('$continue');
                false -> ok
            end,
            IsValid = (fun(Target_N66738) -> (get({Target_N66738, '$class'})):isValid(Target_N66738, (fun(Target_N66758) -> (get({Target_N66758, '$class'})):getFrameTwo(Target_N66758) end)((get({This, '$class'})):getImageComparisonResult(This)), BufferedImage, (get({MotionRectangle, '$class'})):getRectangle(MotionRectangle)) end)((get({This, '$class'})):getMotionRectangleConstraintsInterface(This)),
            case (not IsValid) of
                true ->
                throw('$continue');
                false -> ok
            end,
            case ((((not IsTooSmall) andalso (not IsAreaTooSmall)) andalso (not IsTooBig)) andalso IsValid) of
                true ->
                (get({Vector, '$class'})):add(Vector, MotionRectangle);
                false -> ok
            end
            catch throw:'$continue' -> ok end
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):setVector(This, Vector).

getMotionRectangleConstraintsInterface(This) ->
        get({This, motionRectangleConstraintsInterface}).

setMotionRectangleConstraintsInterface(This, MotionRectangleConstraintsInterface) ->
        put({This, motionRectangleConstraintsInterface}, MotionRectangleConstraintsInterface).

