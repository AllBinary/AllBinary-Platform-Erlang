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
% package org.allbinary.input.automation.module.generic
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType
% import org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType
% import org.allbinary.input.media.image.capture.CaptureWorkerInterface
% import org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker

-module('GenericProfileCaptureWorkerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(GenericProfile) ->
        try
        Vector = (get({GenericProfile, '$class'})):getGenericProfileDataWorkerTypeVector(GenericProfile),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            GenericProfileDataWorkerType = (get({Vector, '$class'})):get(Vector, Index),
            case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'SCREEN_CAPTURE'})) of
                true ->
                throw({'$return', 'ScreenCaptureImagesWorker':new()});
                false ->
                case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'SAVED_CAPTURE'})) of
                true ->
                throw({'$return', 'SavedCaptureImagesWorker':new(GenericProfileDataWorkerType)});
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', "No CaptureWorkerInterface specified in GenericProfile"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

