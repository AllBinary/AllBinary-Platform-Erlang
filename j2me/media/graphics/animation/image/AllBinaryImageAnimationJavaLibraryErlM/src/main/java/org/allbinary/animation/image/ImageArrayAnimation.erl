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
% import javax.microedition.lcdui.NullImage
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.graphics.Anchor
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.util.CircularIndexUtil

-module('ImageArrayAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, imageArray}, get({'NullImage', 'NULL_IMAGE_ARRAY'})),
    put({This, totalFrames}, 0),
    put({This, circularIndexUtil}, get({'CircularIndexUtil', 'NULL_CIRCULAR_INDEX_UTIL'})),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(ImageArray, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageArray, AnimationBehavior),
    This.

init(This, ImageArray, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        'IndexedAnimation':init(This, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):setImageArray(This, ImageArray).

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

nextFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

previousFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil})).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index).

getFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})).

getSize(This) ->
        get({This, totalFrames}).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

getImage(This, Index) when is_integer(Index) ->
        array:get(Index, get({This, imageArray})).

getImageArray(This) ->
        get({This, imageArray}).

setImageArray(This, ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        put({This, imageArray}, ImageArray),
        put({This, totalFrames}, array:size(ImageArray)),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(get({This, totalFrames}))).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({Graphics, '$class'})):drawImage(Graphics, array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, imageArray})), X, Y, get({This, anchor})).

