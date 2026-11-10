% Generated Code Do Not Modify
% package org.allbinary.media.audio.music
% import org.allbinary.thread.ARunnable
% import javax.microedition.media.Player
% import javax.microedition.media.PlayerListener
% import org.allbinary.AvianUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.audio.NoSound
% import org.allbinary.media.audio.PlayerStateUtil
% import org.allbinary.media.audio.Sound
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('MusicManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    put({This, playerStateUtil}, 'PlayerStateUtil':getInstance()),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(0)),
    put({This, playerListener}, 'MusicManagerPlayerListener':new(This)),
    put({This, 'PLAY'}, "Play "),
    put({This, 'SONG'}, " for: "),
    put({This, 'NEXT_SONG'}, lists:concat([get({'CommonLabels':getInstance(), 'NEXT'}), " Song: "])),
    put({This, 'STOPPING'}, "Stopping Current Song: "),
    put({This, 'ENDING'}, "Ending Current Song: "),
    put({This, 'WAITING_FOR_MEDIA_TO_END'}, "Waiting for media to end"),
    put({This, 'ALREADY_PLAYING'}, "Already Playing: "),
    put({This, 'ALREADY_ENDED'}, "Last Song already ended: "),
    put({This, songList}, undefined),
    put({This, currentSongSound}, 'NoSound':getInstance()),
    put({This, nextSongSound}, 'NoSound':getInstance()),
    put({This, reset}, false),
    put({This, noDuration}, false),
    put({This, stopped}, true),
    ok.


new(MusicServiceClass, SongList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MusicServiceClass, SongList),
    This.

'$init'(This, MusicServiceClass, SongList) ->
    init_fields(This),
        put({This, songList}, SongList).

startNewSong(This) ->
        case (get({This, nextSongSound}) =:= 'NoSound':getInstance()) of
            true ->
            RandomSongSound = (get({get({This, basicArrayListUtil}), '$class'})):getRandom(get({This, basicArrayListUtil}), get({This, songList})),
            (get({This, '$class'})):nextSong(This, RandomSongSound, 0, 0);
            false -> ok
        end,
        (get({This, '$class'})):process(This).

nextSong(This, NextSongSound, LeftVolume, RightVolume) when is_integer(LeftVolume), is_integer(RightVolume) ->
        'PreLogUtil':put((fun(Target_N67734) -> (get({Target_N67734, '$class'})):toString(Target_N67734) end)((fun(Target_N67741) -> (get({Target_N67741, '$class'})):append(Target_N67741, (get({NextSongSound, '$class'})):getResource(NextSongSound)) end)((fun(Target_N67748) -> (get({Target_N67748, '$class'})):append(Target_N67748, get({This, 'NEXT_SONG'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
        put({This, nextSongSound}, NextSongSound),
        (get({This, '$class'})):reset(This),
        put({This, stopped}, false).

reset(This) ->
        put({This, reset}, true).

process(This) ->
        try
        try
            case get({This, stopped}) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            case ((get({get({This, songList}), '$class'})):size(get({This, songList})) =:= 0) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            case ((((get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) andalso (not get({This, noDuration})))) orelse get({This, reset})) of
                true ->
                put({This, reset}, false),
                put({This, noDuration}, false),
                EndingCurrentSongSound = get({This, currentSongSound}),
                NextSongSound = get({This, nextSongSound}),
                put({This, nextSongSound}, 'NoSound':getInstance()),
                case (NextSongSound =:= 'NoSound':getInstance()) of
                    true ->
                    put({This, currentSongSound}, (fun(Target_N68465) -> (get({Target_N68465, '$class'})):getRandom(Target_N68465, get({This, songList})) end)('BasicArrayListUtil':getInstance()));
                    false ->
                    put({This, currentSongSound}, NextSongSound)
                end,
                StartingCurrentSongSound = get({This, currentSongSound}),
                Duration = trunc((get({get({This, currentSongSound}), '$class'})):getDuration(get({This, currentSongSound}))),
                put({get({This, timeDelayHelper}), delay}, Duration),
                case (Duration =< 0) of
                    true ->
                    NO_DURATION_FOR = "No Duration for: ",
                    'PreLogUtil':put((fun(Target_N68754) -> (get({Target_N68754, '$class'})):toString(Target_N68754) end)((fun(Target_N68761) -> (get({Target_N68761, '$class'})):append(Target_N68761, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound}))) end)((fun(Target_N68768) -> (get({Target_N68768, '$class'})):append(Target_N68768, NO_DURATION_FOR) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
                    (fun(Target_N68855) -> (get({Target_N68855, '$class'})):addPlayerListener(Target_N68855, get({This, playerListener})) end)((get({get({This, currentSongSound}), '$class'})):getPlayerP(get({This, currentSongSound}))),
                    put({This, noDuration}, true);
                    false -> ok
                end,
                case (EndingCurrentSongSound =/= 'NoSound':getInstance()) of
                    true ->
                    case ((EndingCurrentSongSound =:= StartingCurrentSongSound) andalso ((fun(Target_N69190) -> (get({Target_N69190, '$class'})):getState(Target_N69190) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)) =:= get({'Player', 'STARTED'}))) of
                        true ->
                        'PreLogUtil':put((fun(Target_N69795) -> (get({Target_N69795, '$class'})):toString(Target_N69795) end)((fun(Target_N69802) -> (get({Target_N69802, '$class'})):append(Target_N69802, (get({EndingCurrentSongSound, '$class'})):getResource(EndingCurrentSongSound)) end)((fun(Target_N69809) -> (get({Target_N69809, '$class'})):append(Target_N69809, get({This, 'ALREADY_PLAYING'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
                        'PreLogUtil':put((fun(Target_N69909) -> (get({Target_N69909, '$class'})):toString(Target_N69909) end)((fun(Target_N69916) -> (get({Target_N69916, '$class'})):appendlong(Target_N69916, Duration) end)((fun(Target_N69923) -> (get({Target_N69923, '$class'})):append(Target_N69923, get({This, 'SONG'})) end)((fun(Target_N69930) -> (get({Target_N69930, '$class'})):append(Target_N69930, (get({EndingCurrentSongSound, '$class'})):getResource(EndingCurrentSongSound)) end)((fun(Target_N69937) -> (get({Target_N69937, '$class'})):append(Target_N69937, get({This, 'STOPPING'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
                        (fun(Target_N70051) -> (get({Target_N70051, '$class'})):stop(Target_N70051) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)),
                        (get({This, '$class'})):waitForStateChange(This, EndingCurrentSongSound, StartingCurrentSongSound);
                        false ->
                        case ((fun(Target_N69244) -> (get({Target_N69244, '$class'})):getState(Target_N69244) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)) =:= get({'Player', 'STARTED'})) of
                            true ->
                            'PreLogUtil':put((fun(Target_N69564) -> (get({Target_N69564, '$class'})):toString(Target_N69564) end)((fun(Target_N69571) -> (get({Target_N69571, '$class'})):appendlong(Target_N69571, Duration) end)((fun(Target_N69578) -> (get({Target_N69578, '$class'})):append(Target_N69578, get({This, 'SONG'})) end)((fun(Target_N69585) -> (get({Target_N69585, '$class'})):append(Target_N69585, (get({EndingCurrentSongSound, '$class'})):getResource(EndingCurrentSongSound)) end)((fun(Target_N69592) -> (get({Target_N69592, '$class'})):append(Target_N69592, get({This, 'STOPPING'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
                            (fun(Target_N69702) -> (get({Target_N69702, '$class'})):stop(Target_N69702) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)),
                            (get({This, '$class'})):waitForStateChange(This, EndingCurrentSongSound, StartingCurrentSongSound);
                            false ->
                            'PreLogUtil':put((fun(Target_N69310) -> (get({Target_N69310, '$class'})):toString(Target_N69310) end)((fun(Target_N69317) -> (get({Target_N69317, '$class'})):append(Target_N69317, (get({StartingCurrentSongSound, '$class'})):getResource(StartingCurrentSongSound)) end)((fun(Target_N69324) -> (get({Target_N69324, '$class'})):append(Target_N69324, get({This, 'PLAY'})) end)((fun(Target_N69331) -> (get({Target_N69331, '$class'})):append(Target_N69331, get({This, 'ALREADY_ENDED'})) end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'PROCESS'})),
                            case 'AvianUtil':isAvian() of
                                true ->
                                (fun(Target_N69453) -> (get({Target_N69453, '$class'})):stop(Target_N69453) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)),
                                (fun(Target_N69481) -> (get({Target_N69481, '$class'})):stop(Target_N69481) end)((get({StartingCurrentSongSound, '$class'})):getPlayerP(StartingCurrentSongSound));
                                false -> ok
                            end,
                            (fun(Target_N69512) -> (get({Target_N69512, '$class'})):start(Target_N69512) end)((get({StartingCurrentSongSound, '$class'})):getPlayerP(StartingCurrentSongSound))
                        end
                    end;
                    false ->
                    'PreLogUtil':put((fun(Target_N68978) -> (get({Target_N68978, '$class'})):toString(Target_N68978) end)((fun(Target_N68985) -> (get({Target_N68985, '$class'})):appendlong(Target_N68985, Duration) end)((fun(Target_N68992) -> (get({Target_N68992, '$class'})):append(Target_N68992, get({This, 'SONG'})) end)((fun(Target_N68999) -> (get({Target_N68999, '$class'})):append(Target_N68999, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound}))) end)((fun(Target_N69006) -> (get({Target_N69006, '$class'})):append(Target_N69006, get({This, 'PLAY'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
                    (fun(Target_N69119) -> (get({Target_N69119, '$class'})):start(Target_N69119) end)((get({get({This, currentSongSound}), '$class'})):getPlayerP(get({This, currentSongSound})))
                end;
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, resource}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (get({This, currentSongSound}) =/= 'NoSound':getInstance()) of
                true ->
                put({local, resource}, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound})));
                false -> ok
            end,
            'PreLogUtil':putOE(lists:concat([get({get({This, commonStrings}), 'EXCEPTION_LABEL'}), get({local, resource})]), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
waitForStateChange(This, EndingCurrentSongSound, StartingCurrentSongSound) ->
        (fun Loop() -> case ((fun(Target_N70498) -> (get({Target_N70498, '$class'})):getState(Target_N70498) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)) =:= get({'Player', 'STARTED'})) of true ->
            'PreLogUtil':put(get({This, 'WAITING_FOR_MEDIA_TO_END'}), This, get({get({This, commonStrings}), 'PROCESS'})),
            timer:sleep(100),
            Loop();
        false -> ok end end)(),
        'PreLogUtil':put((fun(Target_N70560) -> (get({Target_N70560, '$class'})):toString(Target_N70560) end)((fun(Target_N70567) -> (get({Target_N70567, '$class'})):append(Target_N70567, (get({StartingCurrentSongSound, '$class'})):getResource(StartingCurrentSongSound)) end)((fun(Target_N70574) -> (get({Target_N70574, '$class'})):append(Target_N70574, get({This, 'PLAY'})) end)((fun(Target_N70581) -> (get({Target_N70581, '$class'})):append(Target_N70581, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N70588) -> (get({Target_N70588, '$class'})):append(Target_N70588, (get({get({This, playerStateUtil}), '$class'})):convert(get({This, playerStateUtil}), (fun(Target_N70629) -> (get({Target_N70629, '$class'})):getState(Target_N70629) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)))) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
        (fun(Target_N70744) -> (get({Target_N70744, '$class'})):start(Target_N70744) end)((get({StartingCurrentSongSound, '$class'})):getPlayerP(StartingCurrentSongSound)).

% throws Exception
stop(This) ->
        try
            CurrentSongSound = get({This, currentSongSound}),
            case (CurrentSongSound =/= 'NoSound':getInstance()) of
                true ->
                put({This, stopped}, true),
                'PreLogUtil':put((fun(Target_N70994) -> (get({Target_N70994, '$class'})):toString(Target_N70994) end)((fun(Target_N71001) -> (get({Target_N71001, '$class'})):append(Target_N71001, (get({CurrentSongSound, '$class'})):getResource(CurrentSongSound)) end)((fun(Target_N71008) -> (get({Target_N71008, '$class'})):append(Target_N71008, get({This, 'ENDING'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
                (fun(Target_N71095) -> (get({Target_N71095, '$class'})):stop(Target_N71095) end)((get({CurrentSongSound, '$class'})):getPlayerP(CurrentSongSound));
                false -> ok
            end,
            (get({get({This, timeDelayHelper}), '$class'})):setStartTime(get({This, timeDelayHelper}), 0),
            'PreLogUtil':put((fun(Target_N71173) -> (get({Target_N71173, '$class'})):toString(Target_N71173) end)((fun(Target_N71180) -> (get({Target_N71180, '$class'})):append(Target_N71180, (fun(Target_N71231) -> (get({Target_N71231, '$class'})):toString(Target_N71231, CurrentSongSound) end)('StringUtil':getInstance())) end)((fun(Target_N71187) -> (get({Target_N71187, '$class'})):append(Target_N71187, get({get({This, commonStrings}), 'END'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'END'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, resource}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (get({This, currentSongSound}) =/= 'NoSound':getInstance()) of
                true ->
                put({local, resource}, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound})));
                false -> ok
            end,
            'PreLogUtil':putOE(lists:concat([get({get({This, commonStrings}), 'EXCEPTION_LABEL'}), get({local, resource})]), This, get({get({This, commonStrings}), 'END'}), E)
        end.
% Java nested class MusicManagerPlayerListener: move it to its own module 'MusicManagerPlayerListener'

