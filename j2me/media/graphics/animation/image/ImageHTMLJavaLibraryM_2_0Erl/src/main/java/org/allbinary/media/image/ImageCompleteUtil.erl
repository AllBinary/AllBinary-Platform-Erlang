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
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper
% import org.microemu.device.playn.PlaynImage
% import playn.core.CoreImage

-module('ImageCompleteUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageCompleteUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'ISREADY'}, "isReady"),
    put({This, 'COMPLETE'}, "Image loading complete for: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ImageCompleteUtil', instance}).

% throws Exception
waitForImage(This, Image, Name) when (is_list(Name) orelse Name =:= undefined) ->
        ok.

% throws Exception
isReady(This, Image, Name, TimeDelayHelper) when (is_list(Name) orelse Name =:= undefined) ->
        try
        PlaynImage = Image,
        PlaynCoreImage = (get({PlaynImage, '$class'})):getImage(PlaynImage),
        case ((not (get({PlaynCoreImage, '$class'})):isReady(PlaynCoreImage)) orelse (((get({PlaynCoreImage, '$class'})):width(PlaynCoreImage) + (get({PlaynCoreImage, '$class'})):height(PlaynCoreImage)) =< 0)) of
            true ->
            (get({This, '$class'})):handleTimeout(This, Name),
            throw({'$return', false});
            false -> ok
        end,
        case (not (get({Image, '$class'})):isReady(Image)) of
            true ->
            (get({Image, '$class'})):init(Image, (get({Image, '$class'})):getImage(Image)),
            case (not (get({Image, '$class'})):isReady(Image)) of
                true ->
                'PreLogUtil':put(lists:concat(["Waiting for Not Ready Image: ", (get({Image, '$class'})):getName(Image)]), This, get({This, 'ISREADY'}));
                false -> ok
            end;
            false -> ok
        end,
        CommonStrings = 'CommonStrings':getInstance(),
        'PreLogUtil':put(lists:concat([get({This, 'COMPLETE'}), (get({Image, '$class'})):getName(Image)]), This, get({CommonStrings, 'SUCCESS'})),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
handleTimeout(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        ok.

% throws Exception
waitForAll(This) ->
        ok.

