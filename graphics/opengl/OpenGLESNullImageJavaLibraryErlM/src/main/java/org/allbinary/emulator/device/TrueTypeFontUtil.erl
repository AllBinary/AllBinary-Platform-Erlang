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
% package org.allbinary.emulator.device
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.image.opengles.OpenGLESImage

-module('TrueTypeFontUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TrueTypeFontUtilBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'TrueTypeFontUtil':new()),
    ok.

init_fields(This) ->
    put({This, fontImage}, get({'OpenGLESImage', 'NULL_OPENGL_IMAGE'})),
    ok.


getInstance() ->
        get({'TrueTypeFontUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'TrueTypeFontUtilBase':'$init'(This, 1),
        init_fields(This).

getAsTextureSize(This, TextureSize) when is_integer(TextureSize) ->
        erlang:error({'RuntimeException'}).

getCellSize(This, CellSize) when is_integer(CellSize) ->
        erlang:error({'RuntimeException'}).

getFontBitmap(This, Filename, FontSize, CellSize, BasicColor) when (is_list(Filename) orelse Filename =:= undefined), is_integer(FontSize), is_integer(CellSize) ->
        erlang:error({'RuntimeException'}).

saveFontAtlasAsFile(This) ->
        ok.

getFontBitmapGL(This, Gl, Filename, CellSize, BasicColor) when (is_list(Filename) orelse Filename =:= undefined), is_integer(CellSize) ->
        erlang:error({'RuntimeException'}).

getFontWidths(This, Filename, FontSize) when (is_list(Filename) orelse Filename =:= undefined), is_integer(FontSize) ->
        erlang:error({'RuntimeException'}).

