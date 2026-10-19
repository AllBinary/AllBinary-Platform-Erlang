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
% import javax.microedition.lcdui.Image
% import org.allbinary.image.GameFeatureImageCacheFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.HashtableUtil
% import org.microemu.device.playn.PlaynImage
% import playn.core.CoreImage

-module('ImageWaitCompleteUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageCompleteUtil', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(18000)),
    put({This, allTimeDelayHelper}, 'TimeDelayHelper':new(120000)),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'ImageCompleteUtil':init(This),
    init_fields(This),
        ok.

% throws Exception
waitForImage(This, Image, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, timeDelayHelper}), '$class'})):setStartTimeTNT(get({This, timeDelayHelper})),
        (get({This, '$class'})):waitForATime(This, Image, Name, get({This, timeDelayHelper})).

% throws Exception
handleTimeout(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTimeTNT(get({This, timeDelayHelper})) of
            true ->
            erlang:error({'Exception', lists:concat(["isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: ", Name])});
            false -> ok
        end.

% throws Exception
waitForATime(This, Image, Name, TimeDelayHelper) when (is_list(Name) orelse Name =:= undefined) ->
        PlaynImage = Image,
        PlaynCoreImage = (get({PlaynImage, '$class'})):getImage(PlaynImage),
        (fun Loop() -> case ((not (get({PlaynCoreImage, '$class'})):isReady(PlaynCoreImage)) orelse (((get({PlaynCoreImage, '$class'})):width(PlaynCoreImage) + (get({PlaynCoreImage, '$class'})):height(PlaynCoreImage)) =< 0)) of true ->
            case (get({TimeDelayHelper, '$class'})):isTimeTNT(TimeDelayHelper) of
                true ->
                erlang:error({'Exception', lists:concat(["waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: ", Name])});
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        case (not (get({Image, '$class'})):isReady(Image)) of
            true ->
            (get({Image, '$class'})):init(Image, (get({Image, '$class'})):getImage(Image));
            false -> ok
        end.

% throws Exception
waitForAll(This) ->
        (get({get({This, allTimeDelayHelper}), '$class'})):setStartTimeTNT(get({This, allTimeDelayHelper})),
        Hashtable = (fun(Target_N66817) -> (get({Target_N66817, '$class'})):getHashtableP(Target_N66817) end)('GameFeatureImageCacheFactory':getInstance()),
        ObjectArray = (fun(Target_N66894) -> (get({Target_N66894, '$class'})):getKeysAsArray(Target_N66894, Hashtable) end)('HashtableUtil':getInstance()),
        Size = array:size(ObjectArray),
        'PreLogUtil':put(lists:concat(["Image Total: ", Size]), This, "waitForAll"),
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):waitForATime(This, (get({Hashtable, '$class'})):get(Hashtable, array:get(Index, ObjectArray)), array:get(Index, ObjectArray), get({This, allTimeDelayHelper}))
        end, lists:seq(0, Size - 1)).

