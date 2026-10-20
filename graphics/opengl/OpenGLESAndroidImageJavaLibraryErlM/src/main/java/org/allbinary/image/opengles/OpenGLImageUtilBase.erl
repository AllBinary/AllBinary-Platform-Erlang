% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.image.opengles
% import java.io.IOException
% import java.io.InputStream
% import org.allbinary.graphics.OpenGLBitmap
% import org.allbinary.graphics.color.BasicColor

-module('OpenGLImageUtilBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


paint(This, AlphaBitmap, OriginalBitmap, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

paint(This, ColorBitmap, OriginalBitmap, Alpha, BasicColor) when is_integer(Alpha) ->
        erlang:error({'RuntimeException'}).

% throws IOException
createImage(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        erlang:error({'RuntimeException'}).

% throws IOException
createImageFromInputStream(This, InputStream) ->
        erlang:error({'RuntimeException'}).

