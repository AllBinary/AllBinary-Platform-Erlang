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
% package org.allbinary.media.image
% import javax.microedition.lcdui.Image
% import org.allbinary.image.ImageCache

-module('ImageScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageScaleUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
createImage2(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached) ->
        (get({This, '$class'})):createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, true).

% throws Exception
createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, Mutable) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached), is_boolean(Mutable) ->
        OriginalImage.

