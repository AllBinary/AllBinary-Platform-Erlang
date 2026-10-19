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
% package org.allbinary.media.image.comparison
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.CacheableInterface

-module('ImageComparisonResultFrameCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, frame}, undefined),
    put({This, imageComparisonResult}, undefined),
    ok.


new(ImageComparisonResult, Frame) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageComparisonResult, Frame),
    This.

init(This, ImageComparisonResult, Frame) ->
    init_fields(This),
        (get({This, '$class'})):setImageComparisonResult(This, ImageComparisonResult),
        put({This, frame}, Frame).

getKey(This) ->
        get({This, frame}).

getFrame(This) ->
        get({This, frame}).

setFrame(This, Frame) ->
        put({This, frame}, Frame).

getImageComparisonResult(This) ->
        get({This, imageComparisonResult}).

setImageComparisonResult(This, ImageComparisonResult) ->
        put({This, imageComparisonResult}, ImageComparisonResult).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({This, '$class'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Frame: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({This, '$class'})):getFrame(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

