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
% import java.awt.image.BufferedImage
% import java.io.File

-module('ImageProcessorInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, bufferedImageArray}, undefined),
    put({This, files}, undefined),
    ok.


new(Files, BufferedImageArray) when (is_tuple(Files) orelse Files =:= undefined), (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Files, BufferedImageArray),
    This.

init(This, Files, BufferedImageArray) when (is_tuple(Files) orelse Files =:= undefined), (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined) ->
        ok,
        init_fields(This),
        put({This, bufferedImageArray}, BufferedImageArray),
        put({This, files}, Files).

getBufferedImageArray(This) ->
        get({This, bufferedImageArray}).

getFiles(This) ->
        get({This, files}).

