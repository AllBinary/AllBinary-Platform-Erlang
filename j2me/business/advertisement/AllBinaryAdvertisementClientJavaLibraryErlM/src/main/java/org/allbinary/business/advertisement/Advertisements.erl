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
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.logic.system.security.licensing.LockedUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('Advertisements').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, bannerList}, 'BasicArrayListD':new()),
    put({This, pageList}, 'BasicArrayListD':new()),
    put({This, myRandomFactory}, 'MyRandomFactory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


addPage(This, AdvertisementProcessorInterface) ->
        case (not (get({get({This, pageList}), '$class'})):contains(get({This, pageList}), AdvertisementProcessorInterface)) of
            true ->
            (get({get({This, pageList}), '$class'})):add(get({This, pageList}), AdvertisementProcessorInterface);
            false -> ok
        end.

startRandomPage(This) ->
        Size = (get({get({This, pageList}), '$class'})):size(get({This, pageList})),
        case (Size > 0) of
            true ->
            Random = (get({get({This, myRandomFactory}), '$class'})):getAbsoluteNextInt(get({This, myRandomFactory}), Size),
            AdvertisementProcessorInterface = array:get(Random, get({get({This, pageList}), objectArray})),
            (get({AdvertisementProcessorInterface, '$class'})):start(AdvertisementProcessorInterface);
            false -> ok
        end.

processRandomPage(This) ->
        case (fun(Target_N66219) -> (get({Target_N66219, '$class'})):isLocked(Target_N66219) end)('LockedUtil':getInstance()) of
            true ->
            Size = (get({get({This, pageList}), '$class'})):size(get({This, pageList})),
            case (Size > 0) of
                true ->
                Random = (get({get({This, myRandomFactory}), '$class'})):getAbsoluteNextInt(get({This, myRandomFactory}), Size),
                AdvertisementProcessorInterface = array:get(Random, get({get({This, pageList}), objectArray})),
                (get({AdvertisementProcessorInterface, '$class'})):process(AdvertisementProcessorInterface);
                false -> ok
            end;
            false -> ok
        end.

stopAllPage(This) ->
        put({local, index}, (get({get({This, pageList}), '$class'})):size(get({This, pageList}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            AdvertisementProcessorInterface = array:get(get({local, index}), get({get({This, pageList}), objectArray})),
            (get({AdvertisementProcessorInterface, '$class'})):stop(AdvertisementProcessorInterface),
            Loop();
        false -> ok end end)().

addBanner(This, AdvertisementProcessorInterface) ->
        case (not (get({get({This, bannerList}), '$class'})):contains(get({This, bannerList}), AdvertisementProcessorInterface)) of
            true ->
            (get({get({This, bannerList}), '$class'})):add(get({This, bannerList}), AdvertisementProcessorInterface);
            false -> ok
        end.

startAll(This) ->
        put({local, index}, (get({get({This, bannerList}), '$class'})):size(get({This, bannerList}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            AdvertisementProcessorInterface = array:get(get({local, index}), get({get({This, bannerList}), objectArray})),
            (get({AdvertisementProcessorInterface, '$class'})):start(AdvertisementProcessorInterface),
            Loop();
        false -> ok end end)().

stopAllBanner(This) ->
        put({local, index}, (get({get({This, bannerList}), '$class'})):size(get({This, bannerList}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            AdvertisementProcessorInterface = array:get(get({local, index}), get({get({This, bannerList}), objectArray})),
            (get({AdvertisementProcessorInterface, '$class'})):stop(AdvertisementProcessorInterface),
            Loop();
        false -> ok end end)().

getBanner(This, Index) when is_integer(Index) ->
        AdvertisementProcessorInterface = array:get(Index, get({get({This, bannerList}), objectArray})),
        AdvertisementProcessorInterface.

stopAll(This) ->
        (get({This, '$class'})):stopAllBanner(This),
        (get({This, '$class'})):stopAllPage(This).

