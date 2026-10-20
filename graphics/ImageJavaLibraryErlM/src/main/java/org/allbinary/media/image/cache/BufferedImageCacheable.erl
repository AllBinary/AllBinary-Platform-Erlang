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

-module('BufferedImageCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, key}, undefined),
    put({This, bufferedImage}, undefined),
    ok.


new(Key) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Key),
    This.

'$init'(This, Key) ->
    init_fields(This),
        put({This, key}, Key),
        (get({This, '$class'})):setBufferedImage(This, 'BufferedImage':new((get({Key, '$class'})):getWidth(Key), (get({Key, '$class'})):getHeight(Key), (get({Key, '$class'})):getType(Key))).

getKey(This) ->
        get({This, key}).

getBufferedImage(This) ->
        get({This, bufferedImage}).

setBufferedImage(This, BufferedImage) ->
        put({This, bufferedImage}, BufferedImage).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66199) -> (get({Target_N66199, '$class'})):toString(Target_N66199) end)((get({This, '$class'})):getKey(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

