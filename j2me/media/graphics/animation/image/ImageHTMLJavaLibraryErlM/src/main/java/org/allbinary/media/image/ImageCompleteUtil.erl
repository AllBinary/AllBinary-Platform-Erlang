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
% package org.allbinary.media.image
% import javax.microedition.lcdui.Image
% import org.allbinary.image.GameFeatureImageCacheFactory
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.HashtableUtil
% import org.microemu.device.playn.PlaynImage

-module('ImageCompleteUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageCompleteUtil':new()),
    ok.

init_fields(This) ->
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(18000)),
    put({This, allTimeDelayHelper}, 'TimeDelayHelper':new(120000)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ImageCompleteUtil', instance}).

% throws Exception
waitForImage(This, Image, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, timeDelayHelper}), '$class'})):setStartTime(get({This, timeDelayHelper})),
        (get({This, '$class'})):waitForATime(This, Image, Name, get({This, timeDelayHelper})).

% throws Exception
isReady(This, Image, Name, TimeDelayHelper) when (is_list(Name) orelse Name =:= undefined) ->
        try
        PlaynImage = Image,
        case ((not (fun(Target_N66177) -> (get({Target_N66177, '$class'})):isReady(Target_N66177) end)((get({PlaynImage, '$class'})):getImage(PlaynImage))) andalso (((fun(Target_N66210) -> (get({Target_N66210, '$class'})):width(Target_N66210) end)((get({PlaynImage, '$class'})):getImage(PlaynImage)) + (fun(Target_N66234) -> (get({Target_N66234, '$class'})):height(Target_N66234) end)((get({PlaynImage, '$class'})):getImage(PlaynImage))) =:= 0)) of
            true ->
            case (get({TimeDelayHelper, '$class'})):isTime(TimeDelayHelper) of
                true ->
                erlang:error({'Exception', lists:concat(["isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: ", Name])});
                false -> ok
            end,
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
waitForATime(This, Image, Name, TimeDelayHelper) when (is_list(Name) orelse Name =:= undefined) ->
        PlaynImage = Image,
        (fun Loop() -> case ((not (fun(Target_N66583) -> (get({Target_N66583, '$class'})):isReady(Target_N66583) end)((get({PlaynImage, '$class'})):getImage(PlaynImage))) andalso (((fun(Target_N66616) -> (get({Target_N66616, '$class'})):width(Target_N66616) end)((get({PlaynImage, '$class'})):getImage(PlaynImage)) + (fun(Target_N66640) -> (get({Target_N66640, '$class'})):height(Target_N66640) end)((get({PlaynImage, '$class'})):getImage(PlaynImage))) =:= 0)) of true ->
            case (get({TimeDelayHelper, '$class'})):isTime(TimeDelayHelper) of
                true ->
                erlang:error({'Exception', lists:concat(["waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: ", Name])});
                false -> ok
            end,
            Loop();
        false -> ok end end)().

% throws Exception
waitForAll(This) ->
        (get({get({This, allTimeDelayHelper}), '$class'})):setStartTime(get({This, allTimeDelayHelper})),
        Hashtable = (fun(Target_N66796) -> (get({Target_N66796, '$class'})):getHashtable(Target_N66796) end)('GameFeatureImageCacheFactory':getInstance()),
        ObjectArray = (fun(Target_N66847) -> (get({Target_N66847, '$class'})):getKeysAsArray(Target_N66847, Hashtable) end)('HashtableUtil':getInstance()),
        Size = array:size(ObjectArray),
        'PreLogUtil':put(lists:concat(["Total: ", Size]), This, "waitForAll"),
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):waitForATime(This, (get({Hashtable, '$class'})):get(Hashtable, array:get(Index, ObjectArray)), array:get(Index, ObjectArray), get({This, allTimeDelayHelper}))
        end, lists:seq(0, Size - 1)).

