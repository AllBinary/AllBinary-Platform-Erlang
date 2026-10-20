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
% package org.allbinary.input.media.image
% import org.allbinary.input.media.image.capture.CapturedImageInputOutput
% import org.allbinary.media.image.comparison.ComparisonImageInputOutput
% import org.allbinary.media.image.comparison.motion.MotionRectanglesImageInputOutput
% import org.allbinary.media.image.io.ImageIOInterface

-module('InputImageIOInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(ImageType) ->
        try
        case (ImageType =:= get({'InputImageType', 'CAPTURE'})) of
            true ->
            throw({'$return', 'CapturedImageInputOutput':new()});
            false ->
            case (ImageType =:= get({'InputImageType', 'COMPARISON'})) of
            true ->
            throw({'$return', 'ComparisonImageInputOutput':new()});
            false ->
            case (ImageType =:= get({'InputImageType', 'MOTION'})) of
            true ->
            throw({'$return', 'MotionRectanglesImageInputOutput':new()});
            false ->
            erlang:error({'Exception', lists:concat(["No ImageIOInterface for: ", (get({ImageType, '$class'})):toString(ImageType)])})
        end
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

