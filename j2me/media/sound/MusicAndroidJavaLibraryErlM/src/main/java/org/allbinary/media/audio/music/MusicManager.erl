% Generated Code Do Not Modify
% package org.allbinary.media.audio.music
% import android.app.Activity
% import android.content.Context
% import android.content.Intent
% import org.allbinary.android.AndroidServicesUtil
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.audio.NoSound
% import org.allbinary.media.audio.Sound
% import org.allbinary.string.CommonStateStrings
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('MusicManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'PLAY'}, "Play "),
    put({This, 'FOR'}, " for: "),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, musicStrings}, 'MusicStrings':getInstance()),
    put({This, commonStateStrings}, 'CommonStateStrings':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    put({This, resourceUtil}, 'ResourceUtil':getInstance()),
    put({This, androidServicesUtil}, 'AndroidServicesUtil':getInstance()),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(0)),
    put({This, timeDelayHelper2}, 'TimeDelayHelper':new(1200)),
    put({This, songList}, undefined),
    put({This, currentSongSound}, 'NoSound':getInstance()),
    put({This, nextSongSound}, 'NoSound':getInstance()),
    put({This, leftVolume}, 100),
    put({This, rightVolume}, 100),
    put({This, musicServiceClass}, undefined),
    put({This, currentIntent}, undefined),
    ok.


new(MusicServiceClass, SongList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MusicServiceClass, SongList),
    This.

init(This, MusicServiceClass, SongList) ->
    init_fields(This),
        'PreLogUtil':put((get({get({This, commonStateStrings}), 'CONTEXT'}) + (get({get({This, resourceUtil}), '$class'})):getContext(get({This, resourceUtil}))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, musicServiceClass}, MusicServiceClass),
        put({This, currentIntent}, 'Intent':new((get({get({This, resourceUtil}), '$class'})):getContext(get({This, resourceUtil})), MusicServiceClass)),
        put({This, songList}, SongList).

nextSong(This, NextSongSound, LeftVolume, RightVolume) when is_integer(LeftVolume), is_integer(RightVolume) ->
        put({local, nextSongSound}, NextSongSound),
        case (get({local, nextSongSound}) =:= undefined) of
            true ->
            put({local, nextSongSound}, 'NoSound':getInstance());
            false -> ok
        end,
        put({This, nextSongSound}, get({local, nextSongSound})),
        put({This, leftVolume}, LeftVolume),
        put({This, rightVolume}, RightVolume),
        (get({This, '$class'})):reset(This).

reset(This) ->
        put({get({This, timeDelayHelper}), delay}, 0).

process(This) ->
        try
        case ((get({get({This, songList}), '$class'})):size(get({This, songList})) =:= 0) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
            true ->
            (get({This, '$class'})):startNewSong(This),
            throw({'$return', ok});
            false -> ok
        end,
        case (get({get({This, timeDelayHelper2}), '$class'})):isTime(get({This, timeDelayHelper2}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
            true ->
            case (get({get({This, androidServicesUtil}), '$class'})):isServiceRunning(get({This, androidServicesUtil}), (get({get({This, musicServiceClass}), '$class'})):getName(get({This, musicServiceClass}))) of
                true ->
                ok;
                false ->
                (get({This, '$class'})):startNewSong(This)
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

show(This) ->
        put({local, index}, (get({get({This, songList}), '$class'})):size(get({This, songList}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            Sound = (get({get({This, songList}), '$class'})):get(get({This, songList}), get({local, index})),
            Duration = trunc((get({Sound, '$class'})):getDuration(Sound)),
            'PreLogUtil':put((fun(Target_N67836) -> (get({Target_N67836, '$class'})):toString(Target_N67836) end)((fun(Target_N67843) -> (get({Target_N67843, '$class'})):appendlong(Target_N67843, Duration) end)((fun(Target_N67850) -> (get({Target_N67850, '$class'})):append(Target_N67850, get({This, 'FOR'})) end)((fun(Target_N67857) -> (get({Target_N67857, '$class'})):append(Target_N67857, (get({Sound, '$class'})):getResource(Sound)) end)((fun(Target_N67864) -> (get({Target_N67864, '$class'})):append(Target_N67864, get({This, 'PLAY'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
            Loop();
        false -> ok end end)().

startNewSong(This) ->
        try
            (fun(Target_N68073) -> (get({Target_N68073, '$class'})):stopService(Target_N68073, get({This, currentIntent})) end)((get({get({This, resourceUtil}), '$class'})):getContext(get({This, resourceUtil}))),
            case (get({This, nextSongSound}) =:= 'NoSound':getInstance()) of
                true ->
                put({This, currentSongSound}, (get({get({This, basicArrayListUtil}), '$class'})):getRandom(get({This, basicArrayListUtil}), get({This, songList})));
                false ->
                put({This, currentSongSound}, get({This, nextSongSound})),
                put({This, nextSongSound}, 'NoSound':getInstance())
            end,
            Duration = trunc((get({get({This, currentSongSound}), '$class'})):getDuration(get({This, currentSongSound}))),
            'PreLogUtil':put((fun(Target_N68378) -> (get({Target_N68378, '$class'})):toString(Target_N68378) end)((fun(Target_N68385) -> (get({Target_N68385, '$class'})):appendlong(Target_N68385, Duration) end)((fun(Target_N68392) -> (get({Target_N68392, '$class'})):append(Target_N68392, get({This, 'FOR'})) end)((fun(Target_N68399) -> (get({Target_N68399, '$class'})):append(Target_N68399, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound}))) end)((fun(Target_N68406) -> (get({Target_N68406, '$class'})):append(Target_N68406, get({This, 'PLAY'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
            put({get({This, timeDelayHelper}), delay}, Duration),
            (get({get({This, currentIntent}), '$class'})):putExtra(get({This, currentIntent}), get({get({This, musicStrings}), 'SONG_EXTRA'}), (fun(Target_N68606) -> (get({Target_N68606, '$class'})):intValue(Target_N68606) end)((get({get({This, resourceUtil}), '$class'})):getResourceId(get({This, resourceUtil}), (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound}))))),
            (get({get({This, currentIntent}), '$class'})):putExtra(get({This, currentIntent}), get({get({This, musicStrings}), 'LEFT_VOLUME'}), get({This, leftVolume})),
            (get({get({This, currentIntent}), '$class'})):putExtra(get({This, currentIntent}), get({get({This, musicStrings}), 'RIGHT_VOLUME'}), get({This, rightVolume})),
            (fun(Target_N68773) -> (get({Target_N68773, '$class'})):startService(Target_N68773, get({This, currentIntent})) end)((get({get({This, resourceUtil}), '$class'})):getContext(get({This, resourceUtil})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, resource}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (get({This, currentSongSound}) =/= undefined) of
                true ->
                put({local, resource}, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound})));
                false -> ok
            end,
            'PreLogUtil':putOE(lists:concat([get({get({This, commonStrings}), 'EXCEPTION_LABEL'}), get({local, resource})]), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end.

% throws Exception
stop(This) ->
        (fun(Target_N69083) -> (get({Target_N69083, '$class'})):stopService(Target_N69083, get({This, currentIntent})) end)((get({get({This, resourceUtil}), '$class'})):getContext(get({This, resourceUtil}))).

pause(Activity, MusicServiceClass) ->
        CommonStateStrings = 'CommonStateStrings':getInstance(),
        MusicPauseIntent = 'Intent':new(Activity, MusicServiceClass),
        (get({MusicPauseIntent, '$class'})):putExtra(MusicPauseIntent, get({CommonStateStrings, 'ON_START_COMMAND'}), 1),
        (get({Activity, '$class'})):startService(Activity, MusicPauseIntent).

resume(Activity, MusicServiceClass) ->
        case (fun(Target_N69442) -> (get({Target_N69442, '$class'})):isServiceRunning(Target_N69442, (get({MusicServiceClass, '$class'})):getName(MusicServiceClass)) end)('AndroidServicesUtil':getInstance()) of
            true ->
            CommonStateStrings = 'CommonStateStrings':getInstance(),
            MusicResumeIntent = 'Intent':new(Activity, MusicServiceClass),
            (get({MusicResumeIntent, '$class'})):putExtra(MusicResumeIntent, get({CommonStateStrings, 'ON_START_COMMAND'}), 2),
            (get({Activity, '$class'})):startService(Activity, MusicResumeIntent);
            false -> ok
        end.

