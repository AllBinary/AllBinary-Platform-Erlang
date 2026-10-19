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
% package org.allbinary.media.image.cache
% import java.awt.image.BufferedImage
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.CacheableInterface

-module('BufferedImageFrameCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, frame}, undefined),
    put({This, bufferedImage}, undefined),
    ok.


new(BufferedImage, Frame) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BufferedImage, Frame),
    This.

init(This, BufferedImage, Frame) ->
    init_fields(This),
        put({This, frame}, Frame),
        (get({This, '$class'})):setBufferedImage(This, BufferedImage).

getKey(This) ->
        get({This, frame}).

getBufferedImage(This) ->
        get({This, bufferedImage}).

setBufferedImage(This, BufferedImage) ->
        put({This, bufferedImage}, BufferedImage).

getFrame(This) ->
        get({This, frame}).

setFrame(This, Frame) ->
        put({This, frame}, Frame).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Frame: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({This, '$class'})):getFrame(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

