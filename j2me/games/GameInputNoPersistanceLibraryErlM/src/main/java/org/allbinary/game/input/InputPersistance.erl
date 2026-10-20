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
% import javax.microedition.rms.RecordEnumeration
% import javax.microedition.rms.RecordStore
% import org.allbinary.game.configuration.persistance.BasicPersitance
% import org.allbinary.game.configuration.persistance.NullRecordComparator
% import org.allbinary.game.configuration.persistance.NullRecordFilter
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.HashtableUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('InputPersistance').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicPersitance', Function, Arguments).

init_fields(This) ->
    put({This, hashtableUtil}, 'HashtableUtil':getInstance()),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'BasicPersitance':'$init'(This, Name),
        init_fields(This).

% throws Exception
loadAll(This, AbeClientInformation) ->
        RecordStore = 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true),
        RecordEnum = (get({RecordStore, '$class'})):enumerateRecords(RecordStore, get({'NullRecordFilter', 'NULL_RECORD_FILTER'}), get({'NullRecordComparator', 'NULL_RECORD_COMPARATOR'}), true),
        put({local, hashtable}, undefined),
        StringBuffer = 'StringMaker':new(),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        put({local, id}, 0),
        (fun Loop() -> case (get({RecordEnum, '$class'})):hasNextElement(RecordEnum) of true ->
            put({local, id}, (get({RecordEnum, '$class'})):nextRecordId(RecordEnum)),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66582) -> (get({Target_N66582, '$class'})):toString(Target_N66582) end)((fun(Target_N66589) -> (get({Target_N66589, '$class'})):appendint(Target_N66589, get({local, id})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, persistanceStrings}), 'LOADING_ID'})))), This, get({get({This, persistanceStrings}), 'LOAD_ALL'})),
            put({local, hashtable}, (fun(Target_N66687) -> (get({Target_N66687, '$class'})):createHashtable(Target_N66687) end)('StdUtil':getInstance())),
            (get({get({This, valueList}), '$class'})):add(get({This, valueList}), get({local, hashtable})),
            (get({get({This, idList}), '$class'})):add(get({This, idList}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, get({local, id}))),
            Loop();
        false -> ok end end)(),
        (get({RecordStore, '$class'})):closeRecordStore(RecordStore).

% throws Exception
save(This, AbeClientInformation, Hashtable) ->
        'PreLogUtil':put((fun(Target_N66930) -> (get({Target_N66930, '$class'})):toString(Target_N66930) end)((fun(Target_N66937) -> (get({Target_N66937, '$class'})):append(Target_N66937, (fun(Target_N66988) -> (get({Target_N66988, '$class'})):toString(Target_N66988, Hashtable) end)('StringUtil':getInstance())) end)((fun(Target_N66944) -> (get({Target_N66944, '$class'})):append(Target_N66944, get({get({This, persistanceStrings}), 'NOT_SAVING'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'SAVE'})),
        RecordStore = 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true),
        put({local, gameActionInput}, undefined),
        put({local, list}, undefined),
        put({local, input}, undefined),
        InputObjectArray = (get({get({This, hashtableUtil}), '$class'})):getKeysAsArray(get({This, hashtableUtil}), Hashtable),
        Size = array:size(InputObjectArray),
        lists:foreach(fun(Index) ->
            put({local, gameActionInput}, array:get(Index, InputObjectArray)),
            put({local, list}, (get({Hashtable, '$class'})):get(Hashtable, array:get(Index, InputObjectArray))),
            lists:foreach(fun(Index2) ->
                put({local, input}, (get({get({local, list}), '$class'})):get(get({local, list}), Index2))
            end, lists:seq(0, (get({get({local, list}), '$class'})):size(get({local, list})) - 1))
        end, lists:seq(0, Size - 1)),
        (get({RecordStore, '$class'})):closeRecordStore(RecordStore).

