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
% package org.allbinary.game.score
% import java.io.ByteArrayInputStream
% import java.io.DataInputStream
% import java.io.EOFException
% import java.io.IOException
% import javax.microedition.rms.RecordComparator
% import javax.microedition.rms.RecordEnumeration
% import javax.microedition.rms.RecordStore
% import javax.microedition.rms.RecordStoreException
% import javax.microedition.rms.RecordStoreNotFoundException
% import org.allbinary.TsUtil
% import org.allbinary.game.GameInfo
% import org.allbinary.game.configuration.persistance.NullRecordComparator
% import org.allbinary.game.configuration.persistance.NullRecordFilter
% import org.allbinary.game.configuration.persistance.NullRecordStore
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.persistance.PlatformRecordIdUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('RecordStoreHighScores').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScores', Function, Arguments).

static_init() ->
    put({?MODULE, hashTable}, (fun(Target_N66287) -> (get({Target_N66287, '$class'})):createHashtable(Target_N66287) end)('StdUtil':getInstance())),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, platformRecordIdUtil}, 'PlatformRecordIdUtil':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, 'RECORD_ID'}, "_HS"),
    put({This, 'MAXHIGHSCORES'}, 100),
    put({This, gameInfo}, undefined),
    put({This, abeClientInformation}, undefined),
    put({This, recordComparatorInterface}, undefined),
    ok.


new(AbeClientInformation, GameInfo, Name, Heading, ColumnTwoHeading, RecordComparatorInterface) when (is_list(Name) orelse Name =:= undefined), (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, GameInfo, Name, Heading, ColumnTwoHeading, RecordComparatorInterface),
    This.

'$init'(This, AbeClientInformation, GameInfo, Name, Heading, ColumnTwoHeading, RecordComparatorInterface) when (is_list(Name) orelse Name =:= undefined), (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined) ->
        'HighScores':'$init'(This, Name, Heading, ColumnTwoHeading),
        init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        put({This, gameInfo}, GameInfo),
        put({This, recordComparatorInterface}, RecordComparatorInterface),
        (get({This, '$class'})):load(This).

getInstance(AbeClientInformation, GameInfo, HighScoreName, Heading, ColumnTwoHeading, RecordComparatorInterface) when (is_list(HighScoreName) orelse HighScoreName =:= undefined), (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined) ->
        try
        HighScoresCanBeNull = (get({get({'RecordStoreHighScores', hashTable}), '$class'})):get(get({'RecordStoreHighScores', hashTable}), HighScoreName),
        case (HighScoresCanBeNull =:= undefined) of
            true ->
            HighScores = 'RecordStoreHighScores':new(AbeClientInformation, GameInfo, HighScoreName, Heading, ColumnTwoHeading, RecordComparatorInterface),
            (get({get({'RecordStoreHighScores', hashTable}), '$class'})):put(get({'RecordStoreHighScores', hashTable}), (get({HighScores, '$class'})):getName(HighScores), HighScores),
            throw({'$return', HighScores});
            false -> ok
        end,
        HighScoresCanBeNull
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getRecordId(This, AbeClientInformation) ->
        (get({get({This, platformRecordIdUtil}), '$class'})):getRecordId(get({This, platformRecordIdUtil}), AbeClientInformation, (fun(Target_N67555) -> (get({Target_N67555, '$class'})):toString(Target_N67555) end)((fun(Target_N67562) -> (get({Target_N67562, '$class'})):append(Target_N67562, get({This, 'RECORD_ID'})) end)((fun(Target_N67569) -> (get({Target_N67569, '$class'})):append(Target_N67569, (get({This, '$class'})):getName(This)) end)((fun(Target_N67576) -> (get({Target_N67576, '$class'})):append(Target_N67576, get({'CommonSeps':getInstance(), 'UNDERSCORE'})) end)('StringMaker':new()))))).

addHighScore(This, NewHighScore) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68008) -> (get({Target_N68008, '$class'})):toString(Target_N68008) end)((fun(Target_N68015) -> (get({Target_N68015, '$class'})):appendlong(Target_N68015, trunc((get({NewHighScore, '$class'})):getScore(NewHighScore))) end)((fun(Target_N68022) -> (get({Target_N68022, '$class'})):append(Target_N68022, "Adding HighScore: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'ADD'})),
            case (get({This, '$class'})):isTooManyHighScores(This) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Removing Lowest Score", This, get({get({This, commonStrings}), 'ADD'})),
                (get({This, '$class'})):removeLowestHighScore(This);
                false -> ok
            end,
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, get({This, abeClientInformation})), true)),
            HighScoreBytes = (get({NewHighScore, '$class'})):getAsBytes(NewHighScore),
            RecordId = (get({get({local, recordStore}), '$class'})):addRecord(get({local, recordStore}), HighScoreBytes, 0, array:size(HighScoreBytes)),
            (get({This, '$class'})):load(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'ADD'}), E)
        after
            try
                case (get({local, recordStore}) =/= undefined) of
                    true ->
                    'PreLogUtil':put("Closing RecordStore", This, get({get({This, commonStrings}), 'ADD'})),
                    (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                    false -> ok
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'ADD'}), E)
            end
        end.

removeLowestHighScore(This) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, get({This, abeClientInformation})), true)),
            RecordEnum = (get({get({local, recordStore}), '$class'})):enumerateRecords(get({local, recordStore}), get({'NullRecordFilter', 'NULL_RECORD_FILTER'}), get({'NullRecordComparator', 'NULL_RECORD_COMPARATOR'}), true),
            ScoreComparator = (get({This, recordComparatorInterface})),
            put({local, bestHighScore}, 'HighScore':new((-1), "none", get({'GameInfo', 'NONE'}), (get({ScoreComparator, '$class'})):getBestScore(ScoreComparator))),
            put({local, recordAsBytes}, undefined),
            put({local, byteArrayInputStream}, undefined),
            put({local, inputStream}, undefined),
            (fun Loop() -> case (get({RecordEnum, '$class'})):hasNextElement(RecordEnum) of true ->
                Id = (get({RecordEnum, '$class'})):nextRecordId(RecordEnum),
                put({local, recordAsBytes}, (get({get({This, tsUtil}), '$class'})):getRecord(get({This, tsUtil}), get({local, recordStore}), Id)),
                case (get({local, recordAsBytes}) =/= undefined) of
                    true ->
                    put({local, byteArrayInputStream}, 'ByteArrayInputStream':new(get({local, recordAsBytes}))),
                    put({local, inputStream}, 'DataInputStream':new(get({local, byteArrayInputStream}))),
                    Name = (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream})),
                    NextScore = (get({get({local, inputStream}), '$class'})):readLong(get({local, inputStream})),
                    NextCurrentHighScore = 'HighScore':new(Id, Name, get({'GameInfo', 'NONE'}), NextScore),
                    case ((get({get({This, recordComparatorInterface}), '$class'})):compare(get({This, recordComparatorInterface}), (get({NextCurrentHighScore, '$class'})):getAsBytes(NextCurrentHighScore), (get({get({local, bestHighScore}), '$class'})):getAsBytes(get({local, bestHighScore}))) =:= get({'RecordComparator', 'FOLLOWS'})) of
                        true ->
                        put({local, bestHighScore}, NextCurrentHighScore);
                        false -> ok
                    end;
                    false -> ok
                end,
                Loop();
            false -> ok end end)(),
            case ((get({get({local, bestHighScore}), '$class'})):getId(get({local, bestHighScore})) =/= (-1)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70013) -> (get({Target_N70013, '$class'})):toString(Target_N70013) end)((fun(Target_N70020) -> (get({Target_N70020, '$class'})):appendlong(Target_N70020, trunc((get({get({local, bestHighScore}), '$class'})):getScore(get({local, bestHighScore})))) end)((fun(Target_N70027) -> (get({Target_N70027, '$class'})):append(Target_N70027, "Removing Lowest HighScore: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'LOAD'})),
                (get({get({local, recordStore}), '$class'})):deleteRecord(get({local, recordStore}), (get({get({local, bestHighScore}), '$class'})):getId(get({local, bestHighScore})));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "removeLowestHighScore", E)
        after
            try
                case (get({local, recordStore}) =/= undefined) of
                    true ->
                    'PreLogUtil':put("Closing RecordStore", This, "removeLowestHighScore"),
                    (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                    false -> ok
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "removeLowestHighScore", E)
            end
        end.

load(This) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, get({This, abeClientInformation})), true)),
            (get({This, '$class'})):setList(This, 'BasicArrayListD':new()),
            RecordEnum = (get({get({local, recordStore}), '$class'})):enumerateRecords(get({local, recordStore}), get({'NullRecordFilter', 'NULL_RECORD_FILTER'}), get({'NullRecordComparator', 'NULL_RECORD_COMPARATOR'}), true),
            put({local, recordAsBytes}, undefined),
            put({local, byteArrayInputStream}, undefined),
            put({local, inputStream}, undefined),
            (fun Loop() -> case (get({RecordEnum, '$class'})):hasNextElement(RecordEnum) of true ->
                Id = (get({RecordEnum, '$class'})):nextRecordId(RecordEnum),
                put({local, recordAsBytes}, (get({get({This, tsUtil}), '$class'})):getRecord(get({This, tsUtil}), get({local, recordStore}), Id)),
                case (get({local, recordAsBytes}) =/= undefined) of
                    true ->
                    put({local, byteArrayInputStream}, 'ByteArrayInputStream':new(get({local, recordAsBytes}))),
                    put({local, inputStream}, 'DataInputStream':new(get({local, byteArrayInputStream}))),
                    try
                        Name = (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream})),
                        Score = (get({get({local, inputStream}), '$class'})):readLong(get({local, inputStream})),
                        NewHighScore = 'HighScore':new(Id, Name, get({'GameInfo', 'NONE'}), Score),
                        List = (get({This, '$class'})):getList(This),
                        Size = (get({List, '$class'})):size(List),
                        put({local, lastIndex}, Size),
                        lists:foreach(fun(Index) ->
                            HighScore = array:get(Index, get({List, objectArray})),
                            case ((get({get({This, recordComparatorInterface}), '$class'})):compare(get({This, recordComparatorInterface}), (get({NewHighScore, '$class'})):getAsBytes(NewHighScore), (get({HighScore, '$class'})):getAsBytes(HighScore)) =:= get({'RecordComparator', 'PRECEDES'})) of
                                true ->
                                put({local, lastIndex}, Index),
                                throw('$break');
                                false -> ok
                            end
                        end, lists:seq(0, Size - 1)),
                        (get({List, '$class'})):addAt(List, get({local, lastIndex}), NewHighScore)
                    catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                        (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "EOF", This, get({get({This, commonStrings}), 'LOAD'}), E),
                        erlang:error(E)
                    end;
                    false -> ok
                end,
                Loop();
            false -> ok end end)()
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "No High Scores", This, get({get({This, commonStrings}), 'LOAD'}), E)
        after
            try
                case (get({local, recordStore}) =/= undefined) of
                    true ->
                    'PreLogUtil':put("Closing RecordStore", This, get({get({This, commonStrings}), 'LOAD'})),
                    (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                    false -> ok
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'LOAD'}), E)
            end
        end.

isTooManyHighScores(This) ->
        try
        case (((get({This, '$class'})):getList(This) =/= undefined) andalso ((fun(Target_N72346) -> (get({Target_N72346, '$class'})):size(Target_N72346) end)((get({This, '$class'})):getList(This)) < get({This, 'MAXHIGHSCORES'}))) of
            true ->
            throw({'$return', false});
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72406) -> (get({Target_N72406, '$class'})):toString(Target_N72406) end)((fun(Target_N72413) -> (get({Target_N72413, '$class'})):appendint(Target_N72413, get({This, 'MAXHIGHSCORES'})) end)((fun(Target_N72420) -> (get({Target_N72420, '$class'})):append(Target_N72420, "HighScores RecordStore Max Reached: ") end)('StringMaker':new()))), This, "isTooManyHighScores"),
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isBestScore(This, NewHighScore) ->
        try
        try
            case (not (get({This, '$class'})):isTooManyHighScores(This)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Slot Available for a High Score", This, "isBestScore"),
                throw({'$return', true});
                false ->
                List = (get({This, '$class'})):getList(This),
                Size = (get({List, '$class'})):size(List),
                lists:foreach(fun(Index) ->
                    HighScore = array:get(Index, get({List, objectArray})),
                    case ((get({get({This, recordComparatorInterface}), '$class'})):compare(get({This, recordComparatorInterface}), (get({NewHighScore, '$class'})):getAsBytes(NewHighScore), (get({HighScore, '$class'})):getAsBytes(HighScore)) =:= get({'RecordComparator', 'FOLLOWS'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Obtained a High Score", This, "isBestScore"),
                        throw({'$return', true});
                        false -> ok
                    end
                end, lists:seq(0, Size - 1))
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Not a High Score", This, "isBestScore"),
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'ADD'}), E),
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'HighScores':toString(This)),
        List = (get({This, '$class'})):getList(This),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            HighScore = array:get(Index, get({List, objectArray})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({HighScore, '$class'})):getScoreString(HighScore)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'COMMA_SEP'}))
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

