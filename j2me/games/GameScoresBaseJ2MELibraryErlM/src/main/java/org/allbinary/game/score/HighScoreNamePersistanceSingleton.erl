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
% import java.io.ByteArrayOutputStream
% import java.io.DataInputStream
% import java.io.DataOutputStream
% import javax.microedition.rms.RecordEnumeration
% import javax.microedition.rms.RecordStore
% import javax.microedition.rms.RecordStoreException
% import org.allbinary.TsUtil
% import org.allbinary.game.GameInfo
% import org.allbinary.game.configuration.persistance.NullRecordComparator
% import org.allbinary.game.configuration.persistance.NullRecordFilter
% import org.allbinary.game.configuration.persistance.NullRecordStore
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.java.exception.ExceptionUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.persistance.PlatformRecordIdUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('HighScoreNamePersistanceSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'HighScoreNamePersistanceSingleton':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, platformRecordIdUtil}, 'PlatformRecordIdUtil':getInstance()),
    put({This, 'RECORD_ID'}, "_SN"),
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, nameBasicArrayList}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'HighScoreNamePersistanceSingleton', 'SINGLETON'}).

clear(This) ->
        put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

% throws Exception
deleteAll(This, AbeClientInformation, GameInfo) ->
        Size = (get({get({This, nameBasicArrayList}), '$class'})):size(get({This, nameBasicArrayList})),
        lists:foreach(fun(Index) ->
            Integer = array:get(Index, get({get({This, nameBasicArrayList}), objectArray})),
            (get({This, '$class'})):delete(This, AbeClientInformation, GameInfo, (get({Integer, '$class'})):intValue(Integer))
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):clear(This).

getRecordId(This, AbeClientInformation) ->
        (get({get({This, platformRecordIdUtil}), '$class'})):getRecordId(get({This, platformRecordIdUtil}), AbeClientInformation, get({This, 'RECORD_ID'})).

% throws Exception
delete(This, AbeClientInformation, GameInfo, DeleteId) when is_integer(DeleteId) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67366) -> (get({Target_N67366, '$class'})):toString(Target_N67366) end)((fun(Target_N67373) -> (get({Target_N67373, '$class'})):appendint(Target_N67373, DeleteId) end)((fun(Target_N67380) -> (get({Target_N67380, '$class'})):append(Target_N67380, "Deleting: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), delete})),
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
            (get({get({local, recordStore}), '$class'})):deleteRecord(get({local, recordStore}), DeleteId)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            case (get({local, recordStore}) =/= undefined) of
                true ->
                'PreLogUtil':put("Closing RecordStore", This, get({get({This, commonStrings}), delete})),
                (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                false -> ok
            end
        end.

getIds(This) ->
        get({This, nameBasicArrayList}).

load(This, AbeClientInformation, GameInfo) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            case (get({This, name}) =:= get({'StringUtil':getInstance(), 'EMPTY_STRING'})) of
                true ->
                LOADING_ID = "Loading id: ",
                put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
                RecordEnum = (get({get({local, recordStore}), '$class'})):enumerateRecords(get({local, recordStore}), get({'NullRecordFilter', 'NULL_RECORD_FILTER'}), get({'NullRecordComparator', 'NULL_RECORD_COMPARATOR'}), true),
                SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
                put({local, recordAsBytes}, undefined),
                put({local, byteArrayInputStream}, undefined),
                put({local, inputStream}, undefined),
                (fun Loop() -> case (get({RecordEnum, '$class'})):hasNextElement(RecordEnum) of true ->
                    Id = (get({RecordEnum, '$class'})):nextRecordId(RecordEnum),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68453) -> (get({Target_N68453, '$class'})):toString(Target_N68453) end)((fun(Target_N68460) -> (get({Target_N68460, '$class'})):appendint(Target_N68460, Id) end)((fun(Target_N68467) -> (get({Target_N68467, '$class'})):append(Target_N68467, LOADING_ID) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'LOAD'})),
                    put({local, recordAsBytes}, (get({get({This, tsUtil}), '$class'})):getRecord(get({This, tsUtil}), get({local, recordStore}), Id)),
                    put({local, byteArrayInputStream}, 'ByteArrayInputStream':new(get({local, recordAsBytes}))),
                    put({local, inputStream}, 'DataInputStream':new(get({local, byteArrayInputStream}))),
                    (fun Loop() -> case ((get({get({local, inputStream}), '$class'})):available(get({local, inputStream})) > 0) of true ->
                        put({This, name}, (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream}))),
                        Loop();
                    false -> ok end end)(),
                    (get({get({This, nameBasicArrayList}), '$class'})):add(get({This, nameBasicArrayList}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, Id)),
                    Loop();
                false -> ok end end)();
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({This, '$class'})):save(This, AbeClientInformation, GameInfo, get({This, name})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68906) -> (get({Target_N68906, '$class'})):toString(Target_N68906) end)((fun(Target_N68913) -> (get({Target_N68913, '$class'})):append(Target_N68913, (fun(Target_N68964) -> (get({Target_N68964, '$class'})):getStackTrace(Target_N68964, E) end)('ExceptionUtil':getInstance())) end)((fun(Target_N68920) -> (get({Target_N68920, '$class'})):append(Target_N68920, get({get({This, commonStrings}), 'EXCEPTION_LABEL'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'LOAD'}))
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
        end,
        get({This, name}).

save(This, AbeClientInformation, GameInfo, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69439) -> (get({Target_N69439, '$class'})):toString(Target_N69439) end)((fun(Target_N69446) -> (get({Target_N69446, '$class'})):append(Target_N69446, Name) end)((fun(Target_N69453) -> (get({Target_N69453, '$class'})):append(Target_N69453, "Saving: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'SAVE'})),
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
            ByteArrayOutputStream = 'ByteArrayOutputStream':new(),
            OutputStream = 'DataOutputStream':new(ByteArrayOutputStream),
            (get({OutputStream, '$class'})):writeUTF(OutputStream, Name),
            SavedGameBytes = (get({ByteArrayOutputStream, '$class'})):toByteArray(ByteArrayOutputStream),
            (get({get({local, recordStore}), '$class'})):addRecord(get({local, recordStore}), SavedGameBytes, 0, array:size(SavedGameBytes)),
            put({This, name}, Name)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'SAVE'}), E)
        after
            try
                case (get({local, recordStore}) =/= undefined) of
                    true ->
                    'PreLogUtil':put("Closing RecordStore", This, get({get({This, commonStrings}), 'SAVE'})),
                    (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                    false -> ok
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'SAVE'}), E)
            end
        end.

