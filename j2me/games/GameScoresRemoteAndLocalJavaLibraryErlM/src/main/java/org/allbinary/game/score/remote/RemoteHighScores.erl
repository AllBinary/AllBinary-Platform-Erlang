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
% package org.allbinary.game.score.remote
% import java.util.Enumeration
% import org.allbinary.util.BasicArrayList
% import org.allbinary.game.GameInfo
% import org.allbinary.game.score.HighScore
% import org.allbinary.game.score.HighScores
% import org.allbinary.game.score.RemoteErrorHighScoresSingletonFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.SoftwareInformation
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.EnumerationUtil

-module('RemoteHighScores').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScores', Function, Arguments).

static_init() ->
    put({?MODULE, hashTable}, (fun(Target_N66142) -> (get({Target_N66142, '$class'})):createHashtable(Target_N66142) end)('StdUtil':getInstance())),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    put({This, abeClientInformation}, undefined),
    put({This, softwareInformation}, undefined),
    put({This, ascending}, undefined),
    put({This, 'ASCENDING'}, "ASCENDING"),
    ok.


new(AbeClientInformation, SoftwareInformation, GameInfo, Heading, ColumnTwoHeading, Ascending, Preload) when (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined), is_boolean(Preload) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, SoftwareInformation, GameInfo, Heading, ColumnTwoHeading, Ascending, Preload),
    This.

init(This, AbeClientInformation, SoftwareInformation, GameInfo, Heading, ColumnTwoHeading, Ascending, Preload) when (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined), is_boolean(Preload) ->
        'HighScores':init(This, (get({GameInfo, '$class'})):toString(GameInfo), Heading, ColumnTwoHeading),
        init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        put({This, softwareInformation}, SoftwareInformation),
        (get({This, '$class'})):setAscending(This, Ascending),
        case Preload of
            true ->
            (fun(Target_N66485) -> (get({Target_N66485, '$class'})):process(Target_N66485, This, get({This, abeClientInformation}), GameInfo) end)('RemoteHighScoresProcessorFactory':getInstance());
            false -> ok
        end.

getInstance(AbeClientInformation, SoftwareInformation, GameInfo, Heading, ColumnTwoHeading, IsAscending) when (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined) ->
        'RemoteHighScores':getInstancePreload(AbeClientInformation, SoftwareInformation, GameInfo, Heading, ColumnTwoHeading, IsAscending, true).

getInstancePreload(AbeClientInformation, SoftwareInformation, GameInfo, Heading, ColumnTwoHeading, IsAscending, Preload) when (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined), is_boolean(Preload) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            put({local, highScores}, (get({get({'RemoteHighScores', hashTable}), '$class'})):get(get({'RemoteHighScores', hashTable}), GameInfo)),
            case (get({local, highScores}) =:= undefined) of
                true ->
                put({local, highScores}, 'RemoteHighScores':new(AbeClientInformation, SoftwareInformation, GameInfo, Heading, ColumnTwoHeading, IsAscending, Preload)),
                (get({get({'RemoteHighScores', hashTable}), '$class'})):put(get({'RemoteHighScores', hashTable}), GameInfo, get({local, highScores}));
                false -> ok
            end,
            get({local, highScores})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), 'RemoteErrorHighScoresSingletonFactory':getInstance(), get({CommonStrings, 'GET_INSTANCE'}), E),
            'RemoteErrorHighScoresSingletonFactory':getInstance()
        end.

addHighScore(This, NewHighScore) ->
        (fun(Target_N67695) -> (get({Target_N67695, '$class'})):process(Target_N67695, This, get({This, abeClientInformation}), NewHighScore) end)('RemoteHighScoresSubmissionProcessorFactory':getInstance()).

update(This, Hashtable) ->
        (fun(Target_N67804) -> (get({Target_N67804, '$class'})):clear(Target_N67804) end)((get({This, '$class'})):getList(This)),
        Vector = (get({Hashtable, '$class'})):get(Hashtable, get({'RemoteHighScoresData':getInstance(), 'HIGH_SCORES'})),
        case (Vector =/= undefined) of
            true ->
            Size = (get({Vector, '$class'})):size(Vector),
            lists:foreach(fun(Index) ->
                HighScoreVector = (get({Vector, '$class'})):get(Vector, Index),
                DisplayName = (get({HighScoreVector, '$class'})):get(HighScoreVector, 0),
                Score = (get({HighScoreVector, '$class'})):get(HighScoreVector, 1),
                LongScore = list_to_integer(Score),
                HighScore = 'HighScore':new((-1), DisplayName, undefined, LongScore),
                (fun(Target_N68747) -> (get({Target_N68747, '$class'})):add(Target_N68747, HighScore) end)((get({This, '$class'})):getList(This))
            end, lists:seq(0, Size - 1));
            false ->
            NEXT_ELEMENT = (fun(Target_N67967) -> (get({Target_N67967, '$class'})):toString(Target_N67967) end)((fun(Target_N67974) -> (get({Target_N67974, '$class'})):append(Target_N67974, "Element: ") end)((fun(Target_N67981) -> (get({Target_N67981, '$class'})):append(Target_N67981, get({'CommonLabels':getInstance(), 'NEXT'})) end)('StringMaker':new()))),
            CommonStrings = 'CommonStrings':getInstance(),
            Enumeration = (get({Hashtable, '$class'})):elements(Hashtable),
            put({local, nextElement}, undefined),
            (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
                put({local, nextElement}, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([NEXT_ELEMENT, get({local, nextElement})]), This, get({CommonStrings, 'PROCESS'})),
                Loop();
            false -> ok end end)()
        end.

setAscending(This, Ascending) ->
        put({This, ascending}, Ascending).

getAscending(This) ->
        get({This, ascending}).

getSoftwareInformation(This) ->
        get({This, softwareInformation}).

