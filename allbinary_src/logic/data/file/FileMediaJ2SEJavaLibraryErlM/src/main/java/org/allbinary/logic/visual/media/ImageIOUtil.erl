% Generated Code Do Not Modify
% package org.allbinary.logic.visual.media
% import java.awt.image.BufferedImage
% import java.awt.image.RenderedImage
% import javax.imageio.ImageIO
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil

-module('ImageIOUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
read(File) ->
        'ImageIO':read('AbFileNativeUtil':get(File)).

% throws Exception
write(RenderedImage, Name, File) when (is_list(Name) orelse Name =:= undefined) ->
        'ImageIO':write(RenderedImage, Name, 'AbFileNativeUtil':get(File)).

