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
% package org.allbinary.game.configuration.persistance
% import java.io.ByteArrayInputStream
% import java.io.ByteArrayOutputStream
% import java.io.DataInputStream
% import java.io.DataOutputStream
% import javax.microedition.rms.RecordEnumeration
% import javax.microedition.rms.RecordStore
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.HashtableUtil

-module('KeyValuePersistance').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicPersitance', Function, Arguments).

init_fields(This) ->
    put({This, tsUtil}, 'TsUtil':getInstance()),
    ok.


new(RecordId) when (is_list(RecordId) orelse RecordId =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RecordId),
    This.

init(This, RecordId) when (is_list(RecordId) orelse RecordId =:= undefined) ->
        'BasicPersitance':init(This, RecordId),
        init_fields(This).

% throws Exception
loadAll(This, AbeClientInformation) ->
        (get({This, '$class'})):loadAllSize(This, AbeClientInformation, 1).

% throws Exception
loadAllSize(This, AbeClientInformation, Size) when is_integer(Size) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
            RecordEnum = (get({get({local, recordStore}), '$class'})):enumerateRecords(get({local, recordStore}), get({'NullRecordFilter', 'NULL_RECORD_FILTER'}), get({'NullRecordComparator', 'NULL_RECORD_COMPARATOR'}), true),
            put({local, hashtable}, undefined),
            put({local, name}, undefined),
            put({local, value}, undefined),
            SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
            StringBuffer = 'StringMaker':new(),
            put({local, recordAsBytes}, undefined),
            put({local, byteArrayInputStream}, undefined),
            put({local, inputStream}, undefined),
            (fun Loop() -> case (get({RecordEnum, '$class'})):hasNextElement(RecordEnum) of true ->
                Id = (get({RecordEnum, '$class'})):nextRecordId(RecordEnum),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66923) -> (get({Target_N66923, '$class'})):toString(Target_N66923) end)((fun(Target_N66930) -> (get({Target_N66930, '$class'})):appendint(Target_N66930, Id) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'LOADING_ID'})))), This, get({get({This, persistanceStrings}), 'LOAD_ALL'})),
                put({local, recordAsBytes}, (get({get({This, tsUtil}), '$class'})):getRecord(get({This, tsUtil}), get({local, recordStore}), Id)),
                case (get({local, recordAsBytes}) =/= undefined) of
                    true ->
                    put({local, byteArrayInputStream}, 'ByteArrayInputStream':new(get({local, recordAsBytes}))),
                    put({local, inputStream}, 'DataInputStream':new(get({local, byteArrayInputStream}))),
                    put({local, hashtable}, 'ABHashtable':new()),
                    lists:foreach(fun(Index) ->
                        put({local, name}, (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream}))),
                        (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream})),
                        put({local, value}, (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream}))),
                        (get({get({local, hashtable}), '$class'})):put(get({local, hashtable}), get({local, name}), get({local, value}))
                    end, lists:seq(0, Size - 1)),
                    (get({get({This, valueList}), '$class'})):add(get({This, valueList}), get({local, hashtable})),
                    (get({get({This, idList}), '$class'})):add(get({This, idList}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, Id));
                    false -> ok
                end,
                Loop();
            false -> ok end end)()
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            case (get({local, recordStore}) =/= undefined) of
                true ->
                'PreLogUtil':put(get({get({This, persistanceStrings}), 'CLOSING_RECORDSTORE'}), This, get({get({This, persistanceStrings}), 'LOAD_ALL'})),
                (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                false -> ok
            end
        end.

% throws Exception
save(This, AbeClientInformation, Hashtable) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67842) -> (get({Target_N67842, '$class'})):toString(Target_N67842) end)((fun(Target_N67849) -> (get({Target_N67849, '$class'})):append(Target_N67849, (fun(Target_N67900) -> (get({Target_N67900, '$class'})):toString(Target_N67900, Hashtable) end)('StringUtil':getInstance())) end)((fun(Target_N67856) -> (get({Target_N67856, '$class'})):append(Target_N67856, get({get({This, persistanceStrings}), 'SAVING'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'SAVE'})),
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
            ByteArrayOutputStream = 'ByteArrayOutputStream':new(),
            OutputStream = 'DataOutputStream':new(ByteArrayOutputStream),
            put({local, value}, undefined),
            CommonSeps = 'CommonSeps':getInstance(),
            ObjectArray = (fun(Target_N68223) -> (get({Target_N68223, '$class'})):getKeysAsArray(Target_N68223, Hashtable) end)('HashtableUtil':getInstance()),
            put({local, anyType}, undefined),
            Size = array:size(ObjectArray),
            lists:foreach(fun(Index) ->
                (get({OutputStream, '$class'})):writeUTF(OutputStream, array:get(Index, ObjectArray)),
                (get({OutputStream, '$class'})):writeUTF(OutputStream, get({CommonSeps, 'EQUALS'})),
                put({local, anyType}, array:get(Index, ObjectArray)),
                put({local, value}, (get({Hashtable, '$class'})):get(Hashtable, get({local, anyType}))),
                (get({OutputStream, '$class'})):writeUTF(OutputStream, get({local, value}))
            end, lists:seq(0, Size - 1)),
            TsUtil = 'TsUtil':getInstance(),
            SavedGameBytes = (get({TsUtil, '$class'})):getByteArray(TsUtil, (get({ByteArrayOutputStream, '$class'})):toString(ByteArrayOutputStream)),
            (get({get({local, recordStore}), '$class'})):addRecord(get({local, recordStore}), SavedGameBytes, 0, array:size(SavedGameBytes))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            case (get({local, recordStore}) =/= undefined) of
                true ->
                'PreLogUtil':put(get({get({This, persistanceStrings}), 'CLOSING_RECORDSTORE'}), This, get({get({This, commonStrings}), 'SAVE'})),
                (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                false -> ok
            end
        end.

get(This, Index) when is_integer(Index) ->
        Hashtable = array:get(Index, get({get({This, valueList}), objectArray})),
        Hashtable.

