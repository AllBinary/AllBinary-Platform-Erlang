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
% import javax.microedition.media.MediaException
% import javax.microedition.media.Player
% import javax.microedition.media.PlayerListener
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicPlayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements Player
% implements Controllable2

static_init() ->
    put({?MODULE, 'CONTROL_TYPE'}, "ToneControl"),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, listenersList}, 'BasicArrayListD':new()),
    put({This, stateP}, 0),
    put({This, loopCountP}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):setLoopCount(This, 0),
        (get({This, '$class'})):setState(This, get({'Player', 'UNREALIZED'})).

getContentType(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

getControl(This, ControlType) when (is_list(ControlType) orelse ControlType =:= undefined) ->
        'NullControl':new().

getControls(This) ->
        array:new(0, {default, undefined}).

close(This) ->
        ok.

addPlayerListener(This, PlayerListener) ->
        case (not (get({get({This, listenersList}), '$class'})):contains(get({This, listenersList}), PlayerListener)) of
            true ->
            (get({get({This, listenersList}), '$class'})):add(get({This, listenersList}), PlayerListener);
            false -> ok
        end.

removePlayerListener(This, PlayerListener) ->
        (get({get({This, listenersList}), '$class'})):remove(get({This, listenersList}), PlayerListener).

getState(This) ->
        get({This, stateP}).

setState(This, State) when is_integer(State) ->
        put({This, stateP}, State).

getDuration(This) ->
        0.

getMediaTime(This) ->
        0.

deallocate(This) ->
        ok.

% throws MediaException
prefetch(This) ->
        ok.

% throws MediaException
realize(This) ->
        ok.

setLoopCount(This, Count) when is_integer(Count) ->
        put({This, loopCountP}, Count).

getLoopCount(This) ->
        get({This, loopCountP}).

% throws MediaException
setMediaTime(This, Now) when is_integer(Now) ->
        0.

% throws MediaException
start(This) ->
        (get({This, '$class'})):setState(This, get({'Player', 'STARTED'})).

% throws MediaException
stop(This) ->
        (get({This, '$class'})):setState(This, get({'Player', 'PREFETCHED'})).

setVolume(This, LeftVolume, RightVolume) when is_integer(LeftVolume), is_integer(RightVolume) ->
        ok.

