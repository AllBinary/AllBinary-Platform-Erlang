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
% package org.allbinary.business.advertisement
% import org.allbinary.direction.Direction
% import org.allbinary.game.state.GameState

-module('AdConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'INNERACTIVE'}, undefined),
    put({This, 'LEADBOLT'}, undefined),
    put({This, 'ADMOB'}, undefined),
    ok.


new(AdvertIdArray) when (is_tuple(AdvertIdArray) orelse AdvertIdArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AdvertIdArray),
    This.

init(This, AdvertIdArray) when (is_tuple(AdvertIdArray) orelse AdvertIdArray =:= undefined) ->
    init_fields(This),
        put({This, 'INNERACTIVE'}, array:get(0, AdvertIdArray)),
        put({This, 'ADMOB'}, array:get(1, AdvertIdArray)),
        put({This, 'LEADBOLT'}, array:get(2, AdvertIdArray)).

getValidAdSpots(This) ->
        array:new(0, {default, undefined}).

process(This, GameState) ->
        ok.

processDemo(This, State) when is_integer(State) ->
        ok.

setShowAds(This) ->
        ok.

setToggleAds(This, ShowAds) when is_boolean(ShowAds) ->
        ok.

isShowAds(This) ->
        true.

