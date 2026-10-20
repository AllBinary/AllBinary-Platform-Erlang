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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.DisposalUtil
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.graphics.Anchor
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.AngleInfo
% import org.allbinary.util.CircularIndexUtil

-module('ImageBaseRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, image}, undefined),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, AngleInfo, TotalAngle, AnimationBehavior),
    This.

'$init'(This, Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
        'RotationAnimation':'$init'(This, AngleInfo, 'CircularIndexUtil':createInstance((TotalAngle / (fun(Target_N65913) -> (get({Target_N65913, '$class'})):getAngleIncrement(Target_N65913) end)((get({AngleInfo, '$class'})):getAngleIncrementInfo(AngleInfo)))), AnimationBehavior),
        init_fields(This),
        put({This, image}, Image).

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({Graphics, '$class'})):drawImage(Graphics, get({This, image}), X, Y, get({This, anchor})).

getImage(This) ->
        get({This, image}).

getWidth(This) ->
        (get({get({This, image}), '$class'})):getWidth(get({This, image})).

getHeight(This) ->
        (get({get({This, image}), '$class'})):getHeight(get({This, image})).

% throws Exception
close(This) ->
        (fun(Target_N66666) -> (get({Target_N66666, '$class'})):disposeImage(Target_N66666, get({This, image})) end)('DisposalUtil':getInstance()).

% throws Throwable
finalize(This) ->
        (fun(Target_N66748) -> (get({Target_N66748, '$class'})):disposeImage(Target_N66748, get({This, image})) end)('DisposalUtil':getInstance()).

