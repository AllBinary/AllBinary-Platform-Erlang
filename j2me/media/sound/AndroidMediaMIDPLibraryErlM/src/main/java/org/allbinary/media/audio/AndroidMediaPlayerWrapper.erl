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
% import javax.microedition.media.MediaException
% import javax.microedition.media.Player
% import javax.microedition.media.PlayerListener
% import android.media.MediaPlayer
% import org.allbinary.android.NullAndroidCanvas
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('AndroidMediaPlayerWrapper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicPlayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_ANDROID_MEDIA_PLAYER_WRAPPER'}, 'AndroidMediaPlayerWrapper':createPlayerWrapper()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, mediaPlayer}, get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'})),
    ok.


createPlayerWrapper() ->
        try
            'AndroidMediaPlayerWrapper':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error({'RuntimeException'})
        end.

new(Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Resource),
    This.

'$init'(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
    'BasicPlayer':'$init'(This),
    init_fields(This),
        try
            case (Resource =:= get({'StringUtil':getInstance(), 'EMPTY_STRING'})) of
                true ->
                ok;
                false ->
                ResourceUtil = 'ResourceUtil':getInstance(),
                MediaPlayer = 'MediaPlayer':create((get({ResourceUtil, '$class'})):getContext(ResourceUtil), (fun(Target_N66315) -> (get({Target_N66315, '$class'})):intValue(Target_N66315) end)((get({ResourceUtil, '$class'})):getResourceId(ResourceUtil, Resource))),
                case (MediaPlayer =:= undefined) of
                    true ->
                    erlang:error({'Exception', (fun(Target_N66408) -> (get({Target_N66408, '$class'})):toString(Target_N66408) end)((fun(Target_N66415) -> (get({Target_N66415, '$class'})):append(Target_N66415, (fun(Target_N66485) -> (get({Target_N66485, '$class'})):toString(Target_N66485) end)((get({ResourceUtil, '$class'})):getResourceId(ResourceUtil, Resource))) end)((fun(Target_N66422) -> (get({Target_N66422, '$class'})):append(Target_N66422, " with id: ") end)((fun(Target_N66429) -> (get({Target_N66429, '$class'})):append(Target_N66429, Resource) end)((fun(Target_N66436) -> (get({Target_N66436, '$class'})):append(Target_N66436, "Failed to create media player for: ") end)('StringMaker':new())))))});
                    false -> ok
                end,
                (get({This, '$class'})):setMediaPlayer(This, MediaPlayer),
                (get({get({This, mediaPlayer}), '$class'})):setLooping(get({This, mediaPlayer}), false)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({get({This, commonStrings}), 'EXCEPTION_LABEL'}), Resource]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E),
            erlang:error(E)
        end.

setLoopCount(This, Count) when is_integer(Count) ->
        'BasicPlayer':setLoopCount(This, Count),
        case ((get({This, mediaPlayer}) =/= get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'})) andalso (get({This, mediaPlayer}) =/= undefined)) of
            true ->
            case (Count =:= 0) of
                true ->
                (get({get({This, mediaPlayer}), '$class'})):setLooping(get({This, mediaPlayer}), false);
                false ->
                ok
            end;
            false -> ok
        end.

addPlayerListener(This, PlayerListener) ->
        'BasicPlayer':addPlayerListener(This, PlayerListener).

removePlayerListener(This, PlayerListener) ->
        'BasicPlayer':removePlayerListener(This, PlayerListener).

getState(This) ->
        try
        case (get({get({This, mediaPlayer}), '$class'})):isPlaying(get({This, mediaPlayer})) of
            true ->
            throw({'$return', get({'Player', 'STARTED'})});
            false ->
            throw({'$return', get({'Player', 'PREFETCHED'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

close(This) ->
        try
            (get({get({This, mediaPlayer}), '$class'})):release(get({This, mediaPlayer})),
            put({This, mediaPlayer}, get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CLOSE'}), E)
        end.

% throws MediaException
start(This) ->
        try
            case (get({get({This, mediaPlayer}), '$class'})):isPlaying(get({This, mediaPlayer})) of
                true ->
                (get({get({This, mediaPlayer}), '$class'})):pause(get({This, mediaPlayer})),
                (get({get({This, mediaPlayer}), '$class'})):seekTo(get({This, mediaPlayer}), 0);
                false -> ok
            end,
            (get({get({This, mediaPlayer}), '$class'})):start(get({This, mediaPlayer})),
            'BasicPlayer':start(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'START_METHOD_NAME'}), E)
        end.

% throws MediaException
stop(This) ->
        try
            (get({get({This, mediaPlayer}), '$class'})):stop(get({This, mediaPlayer})),
            (get({get({This, mediaPlayer}), '$class'})):prepare(get({This, mediaPlayer})),
            'BasicPlayer':stop(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "stop", E)
        end.

update(This, Event) when (is_list(Event) orelse Event =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["LineEvent: ", Event]), This, get({get({This, commonStrings}), 'UPDATE'})),
        Size = (get({get({This, listenersList}), '$class'})):size(get({This, listenersList})),
        lists:foreach(fun(Index) ->
            Listener = array:get(Index, get({get({This, listenersList}), objectArray})),
            (get({Listener, '$class'})):playerUpdate(Listener, This, Event, get({'NullUtil':getInstance(), 'NULL_OBJECT'}))
        end, lists:seq(0, Size - 1)).

setVolume(This, LeftVolume, RightVolume) when is_integer(LeftVolume), is_integer(RightVolume) ->
        (get({get({This, mediaPlayer}), '$class'})):setVolume(get({This, mediaPlayer}), ((float(LeftVolume)) / 100.0), ((float(RightVolume)) / 100.0)).

getDuration(This) ->
        trunc((get({get({This, mediaPlayer}), '$class'})):getDuration(get({This, mediaPlayer}))).

setMediaPlayer(This, MediaPlayer) ->
        put({This, mediaPlayer}, MediaPlayer).

getMediaPlayer(This) ->
        get({This, mediaPlayer}).

