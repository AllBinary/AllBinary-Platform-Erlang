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
% package org.allbinary.media.image.io
% import java.awt.image.BufferedImage
% import javax.imageio.IIOImage
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.CacheableInterface

-module('IIOImageCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, key}, undefined),
    put({This, iioImage}, undefined),
    ok.


new(Key) when (is_list(Key) orelse Key =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Key),
    This.

init(This, Key) when (is_list(Key) orelse Key =:= undefined) ->
    init_fields(This),
        put({This, key}, Key).

getKey(This) ->
        get({This, key}).

setBufferedImage(This, BufferedImage) ->
        (get({This, '$class'})):setIioImage(This, 'IIOImage':new(BufferedImage, undefined, undefined)).

getIioImage(This) ->
        get({This, iioImage}).

setIioImage(This, IioImage) ->
        put({This, iioImage}, IioImage).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Reusable IIOImage"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

