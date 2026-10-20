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
% import javax.microedition.lcdui.game.Sprite
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.graphics.Anchor
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('BottomToTopImageAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageSegmentAnimation', Function, Arguments).

init_fields(This) ->
    put({This, startHeight}, 0),
    put({This, currentHeight}, 0),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(Image, AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, AnimationBehavior),
    This.

'$init'(This, Image, AnimationBehavior) ->
        'ImageSegmentAnimation':'$init'(This, Image, 'PrimitiveIntUtil':getArrayInstance(), AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):setFrame(This, ((get({This, '$class'})):getSize(This) - 1)).

nextFrame(This) ->
        'ImageSegmentAnimation':previousFrame(This),
        (get({This, '$class'})):update(This).

previousFrame(This) ->
        'ImageSegmentAnimation':nextFrame(This),
        (get({This, '$class'})):update(This).

setFrame(This, Index) when is_integer(Index) ->
        'ImageSegmentAnimation':setFrame(This, Index),
        (get({This, '$class'})):update(This).

update(This) ->
        put({This, startHeight}, (((get({This, '$class'})):getDrawHeight(This) * (get({This, '$class'})):getFrame(This)) / (get({This, '$class'})):getSize(This))),
        put({This, currentHeight}, ((get({This, '$class'})):getDrawHeight(This) - get({This, startHeight}))).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({Graphics, '$class'})):drawRegion(Graphics, (get({This, '$class'})):getImage(This), (get({This, '$class'})):getStartX(This), get({This, startHeight}), (get({This, '$class'})):getDrawWidth(This), get({This, currentHeight}), get({'Sprite', 'TRANS_NONE'}), X, (Y + get({This, startHeight})), get({This, anchor})).

