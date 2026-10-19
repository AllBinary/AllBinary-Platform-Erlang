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
% package org.allbinary.game.input
% import java.io.ByteArrayInputStream
% import java.io.ByteArrayOutputStream
% import java.io.DataInputStream
% import java.io.DataOutputStream
% import javax.microedition.rms.RecordEnumeration
% import javax.microedition.rms.RecordStore
% import org.allbinary.TsUtil
% import org.allbinary.game.configuration.persistance.BasicPersitance
% import org.allbinary.game.configuration.persistance.NullRecordComparator
% import org.allbinary.game.configuration.persistance.NullRecordFilter
% import org.allbinary.game.configuration.persistance.NullRecordStore
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.HashtableUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('InputPersistance').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicPersitance', Function, Arguments).

init_fields(This) ->
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, hashtableUtil}, 'HashtableUtil':getInstance()),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'BasicPersitance':init(This, Name),
        init_fields(This).

% throws Exception
loadAll(This, AbeClientInformation) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
            RecordEnum = (get({get({local, recordStore}), '$class'})):enumerateRecords(get({local, recordStore}), get({'NullRecordFilter', 'NULL_RECORD_FILTER'}), get({'NullRecordComparator', 'NULL_RECORD_COMPARATOR'}), true),
            put({local, gameActionInputId}, 0),
            put({local, inputId}, 0),
            put({local, gameActionInput}, undefined),
            put({local, input}, undefined),
            put({local, hashtable}, undefined),
            GameKeyFactory = 'GameKeyMappingFactory':getInstance(),
            StringBuffer = 'StringMaker':new(),
            InputFactory = 'InputFactory':getInstance(),
            SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
            StdUtil = 'StdUtil':getInstance(),
            put({local, recordAsBytes}, undefined),
            put({local, byteArrayInputStream}, undefined),
            put({local, inputStream}, undefined),
            (fun Loop() -> case (get({RecordEnum, '$class'})):hasNextElement(RecordEnum) of true ->
                Id = (get({RecordEnum, '$class'})):nextRecordId(RecordEnum),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67269) -> (get({Target_N67269, '$class'})):toString(Target_N67269) end)((fun(Target_N67276) -> (get({Target_N67276, '$class'})):appendint(Target_N67276, Id) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'LOADING_ID'})))), This, get({get({This, persistanceStrings}), 'LOAD_ALL'})),
                put({local, recordAsBytes}, (get({get({This, tsUtil}), '$class'})):getRecord(get({This, tsUtil}), get({local, recordStore}), Id)),
                case (get({local, recordAsBytes}) =/= undefined) of
                    true ->
                    put({local, byteArrayInputStream}, 'ByteArrayInputStream':new(get({local, recordAsBytes}))),
                    put({local, inputStream}, 'DataInputStream':new(get({local, byteArrayInputStream}))),
                    put({local, hashtable}, (get({StdUtil, '$class'})):createHashtable(StdUtil)),
                    put({local, value}, 0),
                    (fun Loop() -> case ((get({get({local, inputStream}), '$class'})):available(get({local, inputStream})) > 0) of true ->
                        GameActionInputIdAsString = (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream})),
                        put({local, value}, list_to_integer(GameActionInputIdAsString)),
                        put({local, gameActionInputId}, get({local, value})),
                        (get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream})),
                        put({local, value}, list_to_integer((get({get({local, inputStream}), '$class'})):readUTF(get({local, inputStream})))),
                        put({local, inputId}, get({local, value})),
                        put({local, gameActionInput}, (get({GameKeyFactory, '$class'})):getGameKey(GameKeyFactory, get({local, gameActionInputId}))),
                        put({local, input}, (get({InputFactory, '$class'})):getInstanceById(InputFactory, get({local, inputId}))),
                        case ((get({local, input}) =:= get({InputFactory, 'NO_INPUT'})) orelse (get({local, gameActionInput}) =:= undefined)) of
                            true ->
                            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                            case (get({local, input}) =:= get({InputFactory, 'NO_INPUT'})) of
                                true ->
                                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'ERROR_LOADING_ID'})),
                                (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({local, inputId})),
                                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'GAME_ACTION_INPUT'})),
                                (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({local, gameActionInputId})),
                                'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, persistanceStrings}), 'LOAD_ALL'}));
                                false -> ok
                            end,
                            case (get({local, gameActionInput}) =:= undefined) of
                                true ->
                                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'ERROR_LOADING'})),
                                (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({local, gameActionInputId})),
                                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'ID'})),
                                (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({local, inputId})),
                                'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, persistanceStrings}), 'LOAD_ALL'}));
                                false -> ok
                            end;
                            false ->
                            ok
                        end,
                        (get({get({local, hashtable}), '$class'})):put(get({local, hashtable}), get({local, input}), get({local, gameActionInput})),
                        Loop();
                    false -> ok end end)(),
                    (get({get({This, valueList}), '$class'})):add(get({This, valueList}), get({local, hashtable})),
                    (get({get({This, idList}), '$class'})):add(get({This, idList}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, Id));
                    false ->
                    ok
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
            StringBuffer = 'StringMaker':new(),
            'PreLogUtil':put((fun(Target_N69104) -> (get({Target_N69104, '$class'})):toString(Target_N69104) end)((fun(Target_N69111) -> (get({Target_N69111, '$class'})):append(Target_N69111, (fun(Target_N69158) -> (get({Target_N69158, '$class'})):toString(Target_N69158, Hashtable) end)('StringUtil':getInstance())) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'SAVING'})))), This, get({get({This, commonStrings}), 'SAVE'})),
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
            ByteArrayOutputStream = 'ByteArrayOutputStream':new(),
            OutputStream = 'DataOutputStream':new(ByteArrayOutputStream),
            put({local, gameActionInput}, undefined),
            put({local, list}, undefined),
            put({local, input}, undefined),
            put({local, savedGameBytes}, undefined),
            CommonSeps = 'CommonSeps':getInstance(),
            SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
            InputObjectArray = (get({get({This, hashtableUtil}), '$class'})):getKeysAsArray(get({This, hashtableUtil}), Hashtable),
            Size = array:size(InputObjectArray),
            lists:foreach(fun(Index) ->
                put({local, gameActionInput}, array:get(Index, InputObjectArray)),
                put({local, list}, (get({Hashtable, '$class'})):get(Hashtable, array:get(Index, InputObjectArray))),
                lists:foreach(fun(Index2) ->
                    GameActionInputIdAsString = (fun(Target_N69863) -> (get({Target_N69863, '$class'})):toString(Target_N69863) end)((get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, (get({get({local, gameActionInput}), '$class'})):getId(get({local, gameActionInput})))),
                    (get({OutputStream, '$class'})):writeUTF(OutputStream, GameActionInputIdAsString),
                    (get({OutputStream, '$class'})):writeUTF(OutputStream, get({CommonSeps, 'EQUALS'})),
                    put({local, input}, array:get(Index2, get({get({local, list}), objectArray}))),
                    InputIdAsString = (fun(Target_N70075) -> (get({Target_N70075, '$class'})):toString(Target_N70075) end)((get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, (get({get({local, input}), '$class'})):getId(get({local, input})))),
                    (get({OutputStream, '$class'})):writeUTF(OutputStream, InputIdAsString)
                end, lists:seq(0, (get({get({local, list}), '$class'})):size(get({local, list})) - 1))
            end, lists:seq(0, Size - 1)),
            put({local, savedGameBytes}, (get({ByteArrayOutputStream, '$class'})):toByteArray(ByteArrayOutputStream)),
            (get({get({local, recordStore}), '$class'})):addRecord(get({local, recordStore}), get({local, savedGameBytes}), 0, array:size(get({local, savedGameBytes})))
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

