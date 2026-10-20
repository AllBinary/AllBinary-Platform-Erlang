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
    put({This, playerListener}, 'MusicManagerPlayerListener':new()),
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
        'PreLogUtil':put((fun(Target_N67602) -> (get({Target_N67602, '$class'})):toString(Target_N67602) end)((fun(Target_N67609) -> (get({Target_N67609, '$class'})):append(Target_N67609, (get({NextSongSound, '$class'})):getResource(NextSongSound)) end)((fun(Target_N67616) -> (get({Target_N67616, '$class'})):append(Target_N67616, get({This, 'NEXT_SONG'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
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
                    put({This, currentSongSound}, (fun(Target_N68333) -> (get({Target_N68333, '$class'})):getRandom(Target_N68333, get({This, songList})) end)('BasicArrayListUtil':getInstance()));
                    false ->
                    put({This, currentSongSound}, NextSongSound)
                end,
                StartingCurrentSongSound = get({This, currentSongSound}),
                Duration = trunc((get({get({This, currentSongSound}), '$class'})):getDuration(get({This, currentSongSound}))),
                put({get({This, timeDelayHelper}), delay}, Duration),
                case (Duration =< 0) of
                    true ->
                    NO_DURATION_FOR = "No Duration for: ",
                    'PreLogUtil':put((fun(Target_N68622) -> (get({Target_N68622, '$class'})):toString(Target_N68622) end)((fun(Target_N68629) -> (get({Target_N68629, '$class'})):append(Target_N68629, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound}))) end)((fun(Target_N68636) -> (get({Target_N68636, '$class'})):append(Target_N68636, NO_DURATION_FOR) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
                    (fun(Target_N68723) -> (get({Target_N68723, '$class'})):addPlayerListener(Target_N68723, get({This, playerListener})) end)((get({get({This, currentSongSound}), '$class'})):getPlayerP(get({This, currentSongSound}))),
                    put({This, noDuration}, true);
                    false -> ok
                end,
                case (EndingCurrentSongSound =/= 'NoSound':getInstance()) of
                    true ->
                    case ((EndingCurrentSongSound =:= StartingCurrentSongSound) andalso ((fun(Target_N69058) -> (get({Target_N69058, '$class'})):getState(Target_N69058) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)) =:= get({'Player', 'STARTED'}))) of
                        true ->
                        'PreLogUtil':put((fun(Target_N69663) -> (get({Target_N69663, '$class'})):toString(Target_N69663) end)((fun(Target_N69670) -> (get({Target_N69670, '$class'})):append(Target_N69670, (get({EndingCurrentSongSound, '$class'})):getResource(EndingCurrentSongSound)) end)((fun(Target_N69677) -> (get({Target_N69677, '$class'})):append(Target_N69677, get({This, 'ALREADY_PLAYING'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
                        'PreLogUtil':put((fun(Target_N69777) -> (get({Target_N69777, '$class'})):toString(Target_N69777) end)((fun(Target_N69784) -> (get({Target_N69784, '$class'})):appendlong(Target_N69784, Duration) end)((fun(Target_N69791) -> (get({Target_N69791, '$class'})):append(Target_N69791, get({This, 'SONG'})) end)((fun(Target_N69798) -> (get({Target_N69798, '$class'})):append(Target_N69798, (get({EndingCurrentSongSound, '$class'})):getResource(EndingCurrentSongSound)) end)((fun(Target_N69805) -> (get({Target_N69805, '$class'})):append(Target_N69805, get({This, 'STOPPING'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
                        (fun(Target_N69919) -> (get({Target_N69919, '$class'})):stop(Target_N69919) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)),
                        (get({This, '$class'})):waitForStateChange(This, EndingCurrentSongSound, StartingCurrentSongSound);
                        false ->
                        case ((fun(Target_N69112) -> (get({Target_N69112, '$class'})):getState(Target_N69112) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)) =:= get({'Player', 'STARTED'})) of
                            true ->
                            'PreLogUtil':put((fun(Target_N69432) -> (get({Target_N69432, '$class'})):toString(Target_N69432) end)((fun(Target_N69439) -> (get({Target_N69439, '$class'})):appendlong(Target_N69439, Duration) end)((fun(Target_N69446) -> (get({Target_N69446, '$class'})):append(Target_N69446, get({This, 'SONG'})) end)((fun(Target_N69453) -> (get({Target_N69453, '$class'})):append(Target_N69453, (get({EndingCurrentSongSound, '$class'})):getResource(EndingCurrentSongSound)) end)((fun(Target_N69460) -> (get({Target_N69460, '$class'})):append(Target_N69460, get({This, 'STOPPING'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
                            (fun(Target_N69570) -> (get({Target_N69570, '$class'})):stop(Target_N69570) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)),
                            (get({This, '$class'})):waitForStateChange(This, EndingCurrentSongSound, StartingCurrentSongSound);
                            false ->
                            'PreLogUtil':put((fun(Target_N69178) -> (get({Target_N69178, '$class'})):toString(Target_N69178) end)((fun(Target_N69185) -> (get({Target_N69185, '$class'})):append(Target_N69185, (get({StartingCurrentSongSound, '$class'})):getResource(StartingCurrentSongSound)) end)((fun(Target_N69192) -> (get({Target_N69192, '$class'})):append(Target_N69192, get({This, 'PLAY'})) end)((fun(Target_N69199) -> (get({Target_N69199, '$class'})):append(Target_N69199, get({This, 'ALREADY_ENDED'})) end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'PROCESS'})),
                            case 'AvianUtil':isAvian() of
                                true ->
                                (fun(Target_N69321) -> (get({Target_N69321, '$class'})):stop(Target_N69321) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)),
                                (fun(Target_N69349) -> (get({Target_N69349, '$class'})):stop(Target_N69349) end)((get({StartingCurrentSongSound, '$class'})):getPlayerP(StartingCurrentSongSound));
                                false -> ok
                            end,
                            (fun(Target_N69380) -> (get({Target_N69380, '$class'})):start(Target_N69380) end)((get({StartingCurrentSongSound, '$class'})):getPlayerP(StartingCurrentSongSound))
                        end
                    end;
                    false ->
                    'PreLogUtil':put((fun(Target_N68846) -> (get({Target_N68846, '$class'})):toString(Target_N68846) end)((fun(Target_N68853) -> (get({Target_N68853, '$class'})):appendlong(Target_N68853, Duration) end)((fun(Target_N68860) -> (get({Target_N68860, '$class'})):append(Target_N68860, get({This, 'SONG'})) end)((fun(Target_N68867) -> (get({Target_N68867, '$class'})):append(Target_N68867, (get({get({This, currentSongSound}), '$class'})):getResource(get({This, currentSongSound}))) end)((fun(Target_N68874) -> (get({Target_N68874, '$class'})):append(Target_N68874, get({This, 'PLAY'})) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
                    (fun(Target_N68987) -> (get({Target_N68987, '$class'})):start(Target_N68987) end)((get({get({This, currentSongSound}), '$class'})):getPlayerP(get({This, currentSongSound})))
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
        (fun Loop() -> case ((fun(Target_N70366) -> (get({Target_N70366, '$class'})):getState(Target_N70366) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)) =:= get({'Player', 'STARTED'})) of true ->
            'PreLogUtil':put(get({This, 'WAITING_FOR_MEDIA_TO_END'}), This, get({get({This, commonStrings}), 'PROCESS'})),
            timer:sleep(100),
            Loop();
        false -> ok end end)(),
        'PreLogUtil':put((fun(Target_N70428) -> (get({Target_N70428, '$class'})):toString(Target_N70428) end)((fun(Target_N70435) -> (get({Target_N70435, '$class'})):append(Target_N70435, (get({StartingCurrentSongSound, '$class'})):getResource(StartingCurrentSongSound)) end)((fun(Target_N70442) -> (get({Target_N70442, '$class'})):append(Target_N70442, get({This, 'PLAY'})) end)((fun(Target_N70449) -> (get({Target_N70449, '$class'})):append(Target_N70449, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N70456) -> (get({Target_N70456, '$class'})):append(Target_N70456, (get({get({This, playerStateUtil}), '$class'})):convert(get({This, playerStateUtil}), (fun(Target_N70497) -> (get({Target_N70497, '$class'})):getState(Target_N70497) end)((get({EndingCurrentSongSound, '$class'})):getPlayerP(EndingCurrentSongSound)))) end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'PROCESS'})),
        (fun(Target_N70612) -> (get({Target_N70612, '$class'})):start(Target_N70612) end)((get({StartingCurrentSongSound, '$class'})):getPlayerP(StartingCurrentSongSound)).

% throws Exception
stop(This) ->
        try
            CurrentSongSound = get({This, currentSongSound}),
            case (CurrentSongSound =/= 'NoSound':getInstance()) of
                true ->
                put({This, stopped}, true),
                'PreLogUtil':put((fun(Target_N70862) -> (get({Target_N70862, '$class'})):toString(Target_N70862) end)((fun(Target_N70869) -> (get({Target_N70869, '$class'})):append(Target_N70869, (get({CurrentSongSound, '$class'})):getResource(CurrentSongSound)) end)((fun(Target_N70876) -> (get({Target_N70876, '$class'})):append(Target_N70876, get({This, 'ENDING'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
                (fun(Target_N70963) -> (get({Target_N70963, '$class'})):stop(Target_N70963) end)((get({CurrentSongSound, '$class'})):getPlayerP(CurrentSongSound));
                false -> ok
            end,
            (get({get({This, timeDelayHelper}), '$class'})):setStartTime(get({This, timeDelayHelper}), 0),
            'PreLogUtil':put((fun(Target_N71041) -> (get({Target_N71041, '$class'})):toString(Target_N71041) end)((fun(Target_N71048) -> (get({Target_N71048, '$class'})):append(Target_N71048, (fun(Target_N71099) -> (get({Target_N71099, '$class'})):toString(Target_N71099, CurrentSongSound) end)('StringUtil':getInstance())) end)((fun(Target_N71055) -> (get({Target_N71055, '$class'})):append(Target_N71055, get({get({This, commonStrings}), 'END'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'END'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, resource}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (CurrentSongSound =/= 'NoSound':getInstance()) of
                true ->
                put({local, resource}, (get({CurrentSongSound, '$class'})):getResource(CurrentSongSound));
                false -> ok
            end,
            'PreLogUtil':putOE(lists:concat([get({get({This, commonStrings}), 'EXCEPTION_LABEL'}), get({local, resource})]), This, get({get({This, commonStrings}), 'END'}), E)
        end.
% Java nested class MusicManagerPlayerListener: move it to its own module 'MusicManagerPlayerListener'

