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
% package org.allbinary.game.layer.geographic.map
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.Anchor
% import org.allbinary.image.PaintableToImageUtil
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.view.ViewPositionBase

-module('ImageMiniMapLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MiniMapLayer', Function, Arguments).

init_fields(This) ->
    put({This, image}, get({'NullImage', 'NULL_IMAGE'})),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(GeographicMapInterface, ViewPosition) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GeographicMapInterface, ViewPosition),
    This.

'$init'(This, GeographicMapInterface, ViewPosition) ->
        'MiniMapLayer':'$init'(This, GeographicMapInterface, ViewPosition),
        init_fields(This).

% throws Exception
init(This) ->
        AWidth = (get({get({This, allBinaryTiledLayer}), '$class'})):getWidth(get({This, allBinaryTiledLayer})),
        AHeight = (get({get({This, allBinaryTiledLayer}), '$class'})):getHeight(get({This, allBinaryTiledLayer})),
        put({This, image}, 'PaintableToImageUtil':getImage(get({This, allBinaryTiledLayer}), AWidth, AHeight)).

paint(This, Graphics) ->
        (get({Graphics, '$class'})):drawImage(Graphics, get({This, image}), get({This, x}), get({This, y}), get({This, anchor})),
        (get({This, '$class'})):paintDots(This, Graphics).

