% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.business.advertisement
% import org.allbinary.game.GameType
% import org.allbinary.game.state.GameState
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('GameAdStateBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, adConfigurationP}, undefined),
    put({This, advertisementsP}, 'Advertisements':new()),
    put({This, okayToShowAdsP}, false),
    ok.


new(AdConfiguration) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AdConfiguration),
    This.

'$init'(This, AdConfiguration) ->
    init_fields(This),
        put({This, adConfigurationP}, AdConfiguration).

initViewArray(This, ViewArray) when (is_tuple(ViewArray) orelse ViewArray =:= undefined) ->
        ok.

onStart(This, AnyType) ->
        (get({This, '$class'})):init(This).

init(This) ->
        ok.

isShowingAtLocation(This, Location) when is_integer(Location) ->
        false.

isShowingAt(This) ->
        false.

show(This) ->
        ok.

hide(This) ->
        ok.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

processAdState(This, GameState, GameType) ->
        ok.

processPageAdState(This) ->
        ok.

% throws Exception
playingAdState(This) ->
        ok.

% throws Exception
playingAdStateWH(This, Width, Height) when is_integer(Width), is_integer(Height) ->
        ok.

% throws Exception
notPlayingAdState(This) ->
        ok.

setGameIsReady(This, GameIsReady) when is_boolean(GameIsReady) ->
        ok.

isGameIsReady(This) ->
        false.

getAdvertisements(This) ->
        get({This, advertisementsP}).

getAdConfiguration(This) ->
        get({This, adConfigurationP}).

isOkayToShowPageAd(This) ->
        false.

setOkayToShowAds(This, OkayToShowAds) when is_boolean(OkayToShowAds) ->
        put({This, okayToShowAdsP}, OkayToShowAds).

isOkayToShowAds(This) ->
        get({This, okayToShowAdsP}).

isEnabled(This) ->
        false.

