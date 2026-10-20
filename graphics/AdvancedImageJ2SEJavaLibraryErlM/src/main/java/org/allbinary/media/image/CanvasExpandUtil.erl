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
% package org.allbinary.media.image
% import java.awt.image.BufferedImage
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil

-module('CanvasExpandUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CanvasExpandUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CanvasExpandUtil', instance}).

% throws Exception
process(This, ImageProcessorInput, IncreaseX, IncreaseY, Visitor) when is_integer(IncreaseX), is_integer(IncreaseY) ->
        ImageUtil = 'ImageUtil':getInstance(),
        BufferedImageArray = (get({ImageProcessorInput, '$class'})):getBufferedImageArray(ImageProcessorInput),
        SubBufferedImageArray = array:new(array:size(BufferedImageArray), {default, undefined}),
        Size = array:size(BufferedImageArray),
        put({local, bufferedImage}, undefined),
        lists:foreach(fun(Index) ->
            put({local, bufferedImage}, array:get(Index, BufferedImageArray)),
            array:set(Index, (get({ImageUtil, '$class'})):createBufferedImage(ImageUtil, get({local, bufferedImage}), ((get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage})) + IncreaseX), ((get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage})) + IncreaseY), false), SubBufferedImageArray),
            (get({Visitor, '$class'})):visit(Visitor, array:get(Index, SubBufferedImageArray), get({get({This, stringUtil}), 'EMPTY_STRING'}), Index)
        end, lists:seq(0, Size - 1)).

