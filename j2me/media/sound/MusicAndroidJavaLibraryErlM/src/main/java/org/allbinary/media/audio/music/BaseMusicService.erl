% Generated Code Do Not Modify
% package org.allbinary.media.audio.music
% import android.app.Service
% import android.content.Intent
% import android.media.MediaPlayer
% import android.os.IBinder
% import org.allbinary.android.NullAndroidCanvas
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStateStrings
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.ARunnable

-module('BaseMusicService').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Service', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonStateStrings}, 'CommonStateStrings':getInstance()),
    put({This, 'ALREADY_PLAYING'}, "This is one song per music service"),
    put({This, 'WAITING_FOR_MUSIC_TO_END'}, "Waiting for music to end"),
    put({This, player}, get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'})),
    put({This, songId}, (-1)),
    put({This, leftVolume}, (-1)),
    put({This, rightVolume}, (-1)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Service':'$init'(This),
    init_fields(This).


onBind(This, Intent) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'BIND'})),
        undefined.

onCreate(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'CREATE'})).

onDestroy(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'DESTROY'})),
        case (get({This, player}) =/= get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'PAUSE'})),
            (get({get({This, player}), '$class'})):stop(get({This, player})),
            (get({get({This, player}), '$class'})):reset(get({This, player})),
            (get({get({This, player}), '$class'})):release(get({This, player}));
            false -> ok
        end.

pause(This) ->
        case (get({This, player}) =/= get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'PAUSE'})),
            (get({get({This, player}), '$class'})):pause(get({This, player}));
            false -> ok
        end.

resume(This) ->
        case ((get({This, player}) =/= get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'})) andalso (not (get({get({This, player}), '$class'})):isPlaying(get({This, player})))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'RESUME'})),
            (get({get({This, player}), '$class'})):start(get({This, player}));
            false -> ok
        end.

start(This) ->
        put({This, player}, 'MediaPlayer':create(This, get({This, songId}))),
        (get({get({This, player}), '$class'})):setVolume(get({This, player}), ((float(get({This, leftVolume}))) / 100.0), ((float(get({This, rightVolume}))) / 100.0)),
        (get({get({This, player}), '$class'})):setLooping(get({This, player}), false),
        (get({get({This, player}), '$class'})):start(get({This, player})).

onStart(This, Intent, Startid) when is_integer(Startid) ->
        (get({This, '$class'})):onStartCommandIntent(This, Intent),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'START'})).

onStartCommand(This, Intent, Flags, StartId) when is_integer(Flags), is_integer(StartId) ->
        (get({This, '$class'})):onStartCommandIntent(This, Intent),
        get({'Service', 'START_STICKY'}).

onStartCommandIntent(This, Intent) ->
        try
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStateStrings}), 'ON_START_COMMAND'})),
        MusicStrings = 'MusicStrings':getInstance(),
        case (Intent =/= undefined) of
            true ->
            Command = (get({Intent, '$class'})):getIntExtra(Intent, get({get({This, commonStateStrings}), 'ON_START_COMMAND'}), (-1)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'COMMAND_LABEL'}) + Command), This, get({get({This, commonStateStrings}), 'ON_START_COMMAND'})),
            case (Command =:= 1) of
                true ->
                (get({This, '$class'})):pause(This),
                throw({'$return', ok});
                false ->
                case (Command =:= 2) of
                true ->
                (get({This, '$class'})):resume(This),
                throw({'$return', ok});
                false ->
                put({This, songId}, (get({Intent, '$class'})):getIntExtra(Intent, get({MusicStrings, 'SONG_EXTRA'}), (-1))),
                put({This, leftVolume}, (get({Intent, '$class'})):getIntExtra(Intent, get({MusicStrings, 'LEFT_VOLUME'}), (-1))),
                put({This, rightVolume}, (get({Intent, '$class'})):getIntExtra(Intent, get({MusicStrings, 'RIGHT_VOLUME'}), (-1)))
            end
            end;
            false ->
            erlang:error({'RuntimeException', "Started service without intent"})
        end,
        case (get({This, songId}) =/= (-1)) of
            true ->
            erlang:garbage_collect(),
            case ((get({This, player}) =/= get({'NullAndroidCanvas', 'NULL_MEDIA_PLAYER'})) andalso (get({get({This, player}), '$class'})):isPlaying(get({This, player}))) of
                true ->
                Player = get({This, player}),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'ALREADY_PLAYING'}), This, get({get({This, commonStateStrings}), 'ON_START_COMMAND'})),
                ok % Java nested type MusicRunnable: move it to its own module
,
                Runnable = 'MusicRunnable':new(This),
                Thread = 'Thread':new(Runnable),
                (get({Thread, '$class'})):start(Thread),
                throw({'$return', ok});
                false -> ok
            end,
            (get({This, '$class'})):start(This);
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

