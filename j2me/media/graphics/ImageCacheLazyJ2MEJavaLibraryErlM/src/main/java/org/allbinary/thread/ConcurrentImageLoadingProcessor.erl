% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.thread
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.image.ImageCache
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ConcurrentImageLoadingProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageLoadingProcessor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, runnable}, undefined),
    ok.


new(ImageCache) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageCache),
    This.

init(This, ImageCache) ->
    'BaseImageLoadingProcessor':init(This),
    init_fields(This),
        put({This, runnable}, 'ImageCacheRunnable':new(ImageCache)).

runTask(This) ->
        case (not (get({get({This, runnable}), '$class'})):isRunning(get({This, runnable}))) of
            true ->
            (fun(Target_N66600) -> (get({Target_N66600, '$class'})):runTask(Target_N66600, get({This, runnable})) end)('ImageThreadPool':getInstance());
            false -> ok
        end.
% Java nested class ImageCacheRunnable: move it to its own module 'ImageCacheRunnable'

