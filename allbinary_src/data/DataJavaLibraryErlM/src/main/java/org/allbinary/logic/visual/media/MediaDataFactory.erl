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
% package org.allbinary.logic.visual.media

-module('MediaDataFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MediaDataFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'AVI'}, 'MediaData':new("avi")),
    put({This, 'BMP'}, 'MediaData':new("bmp")),
    put({This, 'CEL'}, 'MediaData':new("cel")),
    put({This, 'FITS'}, 'MediaData':new("fits")),
    put({This, 'FLI'}, 'MediaData':new("fli")),
    put({This, 'GBR'}, 'MediaData':new("gbr")),
    put({This, 'GIF'}, 'MediaData':new("gif")),
    put({This, 'GIH'}, 'MediaData':new("gih")),
    put({This, 'JPG'}, 'MediaData':new("jpg")),
    put({This, 'PIX'}, 'MediaData':new("pix")),
    put({This, 'PNG'}, 'MediaData':new("png")),
    put({This, 'PNM'}, 'MediaData':new("pnm")),
    put({This, 'PSD'}, 'MediaData':new("psd")),
    put({This, 'PSP'}, 'MediaData':new("psp")),
    put({This, 'PS'}, 'MediaData':new("ps")),
    put({This, 'SGI'}, 'MediaData':new("SGI")),
    put({This, 'SWF'}, 'MediaData':new("swf")),
    put({This, 'TGA'}, 'MediaData':new("tga")),
    put({This, 'TIFF'}, 'MediaData':new("tiff")),
    put({This, 'WMF'}, 'MediaData':new("wmf")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'MediaDataFactory', instance}).

