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
% import java.io.IOException
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ImageArrayRotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageArrayRotationUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'TOTAL_ANGLE'}, "totalAngle: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ImageArrayRotationUtil', instance}).

% throws IOException
process(This, ImageProcessorInput, Input, Visitor) ->
        put({local, totalAngle}, undefined),
        case (Input =:= get({get({This, commonStrings}), 'UP'})) of
            true ->
            put({local, totalAngle}, allbinary_java:to_string((-90)));
            false ->
            case (Input =:= get({get({This, commonStrings}), 'DOWN'})) of
            true ->
            put({local, totalAngle}, allbinary_java:to_string(90));
            false ->
            put({local, totalAngle}, allbinary_java:to_string(Input))
        end
        end,
        put({local, generatedBufferedImage}, undefined),
        BufferedImageArray = (get({ImageProcessorInput, '$class'})):getBufferedImageArray(ImageProcessorInput),
        lists:foreach(fun(Index) ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'TOTAL_ANGLE'}), get({local, totalAngle})]), This, get({get({This, commonStrings}), 'RUN'})),
            put({local, generatedBufferedImage}, (get({'ImageJ2SERotationUtil':getInstance(), '$class'})):getRotatedImage('ImageJ2SERotationUtil':getInstance(), array:get(Index, BufferedImageArray), (get({get({local, totalAngle}), '$class'})):intValue(get({local, totalAngle})))),
            (get({Visitor, '$class'})):visit(Visitor, get({local, generatedBufferedImage}), Input, Index)
        end, lists:seq(0, array:size(BufferedImageArray) - 1)).

