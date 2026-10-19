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
% package org.allbinary.input.media.image.capture
% import java.awt.image.BufferedImage
% import org.allbinary.input.automation.ImageOutputData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.number.LongUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.logic.visual.media.MediaDataFactory
% import org.allbinary.media.image.ImagePersistanceUtil
% import org.allbinary.media.image.ImageUtil
% import org.allbinary.media.image.cache.BufferedImageFrameCacheable
% import org.allbinary.media.image.io.ImageIOInterface
% import org.allbinary.string.CommonStrings

-module('CapturedImageInputOutput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageIOInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
save(This, Frame) ->
        CommonStrings = 'CommonStrings':getInstance(),
        CapturedBufferedImageCacheable = ((fun(Target_N66116) -> (get({Target_N66116, '$class'})):get(Target_N66116, Frame) end)(('CapturedBufferedImagesCacheSingleton':getInstance()))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (lists:concat(["Saving: ", (get({CapturedBufferedImageCacheable, '$class'})):toString(CapturedBufferedImageCacheable)])), This, get({CommonStrings, 'SAVE'})),
        (get({This, '$class'})):save(This, (get({CapturedBufferedImageCacheable, '$class'})):getBufferedImage(CapturedBufferedImageCacheable), Frame).

save(This, BufferedImage, Frame) ->
        CommonStrings = 'CommonStrings':getInstance(),
        ImageUtil = 'ImageUtil':getInstance(),
        FilePathStringBuffer = 'StringMaker':new(),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, get({'ImageOutputData', 'SAVE_PATH'})),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, 'LongUtil':fillIn((get({Frame, '$class'})):toString(Frame))),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, (fun(Target_N66628) -> (get({Target_N66628, '$class'})):getExtension(Target_N66628) end)(get({'MediaDataFactory':getInstance(), 'JPG'}))),
        FilePath = (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (lists:concat([lists:concat(["Image File Path: ", FilePath]), (get({ImageUtil, '$class'})):toString(ImageUtil, BufferedImage)])), This, get({CommonStrings, 'SAVE'})),
        ImagePersistanceUtil = 'ImagePersistanceUtil':getInstance(),
        (get({ImagePersistanceUtil, '$class'})):saveWithImageIO(ImagePersistanceUtil, FilePath, BufferedImage).

