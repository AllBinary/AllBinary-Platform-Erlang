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
% package org.allbinary.media.audio
% import javax.microedition.media.Control
% import javax.microedition.media.Controllable
% import javax.microedition.media.Player
% import javax.microedition.media.PlayerListener
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('PlayerComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Controllable
% implements Player

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, player}, undefined),
    put({This, timeElapsedHelper}, 'TimeDelayHelper':new(0)),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    ok.


new(Player, RepeatTime) when is_integer(RepeatTime) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Player, RepeatTime),
    This.

init(This, Player, RepeatTime) when is_integer(RepeatTime) ->
    init_fields(This),
        put({This, player}, Player),
        put({get({This, timeElapsedHelper}), delay}, RepeatTime).

addPlayerListener(This, PlayerListener) ->
        (get({get({This, player}), '$class'})):addPlayerListener(get({This, player}), PlayerListener).

removePlayerListener(This, PlayerListener) ->
        (get({get({This, player}), '$class'})):removePlayerListener(get({This, player}), PlayerListener).

close(This) ->
        (get({get({This, player}), '$class'})):close(get({This, player})).

deallocate(This) ->
        (get({get({This, player}), '$class'})):deallocate(get({This, player})).

getContentType(This) ->
        (get({get({This, player}), '$class'})):getContentType(get({This, player})).

getDuration(This) ->
        (get({get({This, player}), '$class'})):getDuration(get({This, player})).

getMediaTime(This) ->
        (get({get({This, player}), '$class'})):getMediaTime(get({This, player})).

prefetch(This) ->
        try
            (get({get({This, player}), '$class'})):prefetch(get({This, player}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "prefetch", E)
        end.

realize(This) ->
        try
            (get({get({This, player}), '$class'})):realize(get({This, player}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "realize", E)
        end.

getState(This) ->
        (get({get({This, player}), '$class'})):getState(get({This, player})).

setLoopCount(This, Count) when is_integer(Count) ->
        (get({get({This, player}), '$class'})):setLoopCount(get({This, player}), Count).

setMediaTime(This, Now) when is_integer(Now) ->
        try
            (get({get({This, player}), '$class'})):setMediaTime(get({This, player}), Now)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setMediaTime", E),
            (-1)
        end.

start(This) ->
        try
            case (get({get({This, timeElapsedHelper}), '$class'})):isTime(get({This, timeElapsedHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
                true ->
                (get({get({This, player}), '$class'})):start(get({This, player}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'START_METHOD_NAME'}), E)
        end.

stop(This) ->
        try
            (get({get({This, player}), '$class'})):stop(get({This, player}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "stop", E)
        end.

getControl(This, ControlType) when (is_list(ControlType) orelse ControlType =:= undefined) ->
        (get({get({This, player}), '$class'})):getControl(get({This, player}), ControlType).

getControls(This) ->
        erlang:error({'RuntimeException'}).

setVolume(This, LeftVolume, RightVolume) when is_integer(LeftVolume), is_integer(RightVolume) ->
        Controllable2 = (get({This, player})),
        (get({Controllable2, '$class'})):setVolume(Controllable2, LeftVolume, RightVolume).

getPlayerP(This) ->
        get({This, player}).

