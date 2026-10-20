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
% package org.allbinary.game.input.mapping
% import java.util.Enumeration
% import org.allbinary.game.configuration.persistance.GamePersistanceStrings
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputPersistance
% import org.allbinary.game.input.mapping.event.InputMappingEvent
% import org.allbinary.game.input.mapping.event.InputMappingEventListenerInterface
% import org.allbinary.game.input.mapping.event.NullInputMappingEventListener
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.EnumerationUtil

-module('PersistentInputMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    put({This, inputMapping}, 'InputToGameKeyMapping':new()),
    put({This, inputMappingEventListenerInterface}, get({'NullInputMappingEventListener', 'NULL_INPUT_MAPPING_EVENT_LISTENER'})),
    put({This, inputPersistance}, undefined),
    put({This, inputMappingEvent}, 'InputMappingEvent':new(This)),
    ok.


getNullInstance() ->
        case (get({'PersistentInputMapping', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'PersistentInputMapping', instance}, 'PersistentInputMapping':new(get({'GamePersistanceStrings':getInstance(), 'SAVED_INPUT_CONFIGURATION_RECORD_ID'})));
            false -> ok
        end,
        get({'PersistentInputMapping', instance}).

new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, inputPersistance}, 'InputPersistance':new(Name)).

getTotalMapped(This) ->
        (fun(Target_N66708) -> (get({Target_N66708, '$class'})):size(Target_N66708) end)((fun(Target_N66715) -> (get({Target_N66715, '$class'})):getHashtable(Target_N66715) end)((get({This, '$class'})):getInputMapping(This))).

isDefaultNew(This) ->
        false.

getDefault(This) ->
        'InputToGameKeyMapping':getNullInstance().

% throws Exception
setDefault(This, AbeClientInformation) ->
        (fun(Target_N66849) -> (get({Target_N66849, '$class'})):removeAll(Target_N66849) end)((get({This, '$class'})):getInputMapping(This)),
        (fun(Target_N66872) -> (get({Target_N66872, '$class'})):addMapping(Target_N66872, (get({This, '$class'})):getDefault(This)) end)((get({This, '$class'})):getInputMapping(This)),
        (get({This, '$class'})):save(This, AbeClientInformation).

% throws Exception
update(This, AbeClientInformation) ->
        (get({get({This, inputPersistance}), '$class'})):deleteAll(get({This, inputPersistance}), AbeClientInformation),
        (get({This, '$class'})):save(This, AbeClientInformation).

% throws Exception
save(This, AbeClientInformation) ->
        (get({get({This, inputPersistance}), '$class'})):save(get({This, inputPersistance}), AbeClientInformation, (fun(Target_N67205) -> (get({Target_N67205, '$class'})):getHashtable(Target_N67205) end)((get({This, '$class'})):getInputMapping(This))),
        (get({get({This, inputMappingEvent}), '$class'})):setInputToGameKeyMapping(get({This, inputMappingEvent}), (get({This, '$class'})):getInputMapping(This)),
        case ((get({This, '$class'})):getInputMappingEventListenerInterface(This) =/= undefined) of
            true ->
            (fun(Target_N67298) -> (get({Target_N67298, '$class'})):onInputMappingEvent(Target_N67298, get({This, inputMappingEvent})) end)((get({This, '$class'})):getInputMappingEventListenerInterface(This));
            false -> ok
        end.

% throws Exception
init(This, AbeClientInformation) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'INIT'})),
        try
            (get({get({This, inputPersistance}), '$class'})):loadAll(get({This, inputPersistance}), AbeClientInformation)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E),
            (get({get({This, inputPersistance}), '$class'})):deleteRecoreStore(get({This, inputPersistance}), AbeClientInformation),
            (get({This, '$class'})):setDefault(This, AbeClientInformation),
            (get({get({This, inputPersistance}), '$class'})):loadAll(get({This, inputPersistance}), AbeClientInformation)
        end,
        List = (get({get({This, inputPersistance}), '$class'})):getList(get({This, inputPersistance})),
        put({local, totalMappedTo}, 0),
        Size = (get({List, '$class'})):size(List),
        put({local, hashtable}, undefined),
        put({local, enumeration}, undefined),
        put({local, mappedToInput}, undefined),
        put({local, gameActionInput}, undefined),
        lists:foreach(fun(Index) ->
            put({local, hashtable}, array:get(Index, get({List, objectArray}))),
            put({local, enumeration}, (get({get({local, hashtable}), '$class'})):keys(get({local, hashtable}))),
            (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), get({local, enumeration})) of true ->
                put({local, mappedToInput}, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), get({local, enumeration}))),
                put({local, gameActionInput}, (get({get({local, hashtable}), '$class'})):get(get({local, hashtable}), get({local, mappedToInput}))),
                put({local, totalMappedTo}, get({local, totalMappedTo}) + 1),
                (fun(Target_N68256) -> (get({Target_N68256, '$class'})):add(Target_N68256, get({local, gameActionInput}), get({local, mappedToInput})) end)((get({This, '$class'})):getInputMapping(This)),
                Loop();
            false -> ok end end)()
        end, lists:seq(0, Size - 1)),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "End - Total Loaded Keys Mapped: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getTotalMapped(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " to: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, totalMappedTo})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'INIT'})).

setInputMappingEventListenerInterface(This, InputMappingEventListenerInterface) ->
        put({This, inputMappingEventListenerInterface}, InputMappingEventListenerInterface).

getInputMappingEventListenerInterface(This) ->
        get({This, inputMappingEventListenerInterface}).

getInputMapping(This) ->
        get({This, inputMapping}).

% throws Exception
isDelete(This, Input) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
isSystemInput(This, Input) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

