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
% import javax.microedition.rms.RecordStore
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.persistance.PlatformRecordIdUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicPersitance').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, persistanceStrings}, 'PersistanceStrings':getInstance()),
    put({This, platformRecordIdUtil}, 'PlatformRecordIdUtil':getInstance()),
    put({This, recordId}, undefined),
    put({This, valueList}, 'BasicArrayListD':new()),
    put({This, idList}, 'BasicArrayListD':new()),
    ok.


new(RecordId) when (is_list(RecordId) orelse RecordId =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RecordId),
    This.

'$init'(This, RecordId) when (is_list(RecordId) orelse RecordId =:= undefined) ->
    init_fields(This),
        put({This, recordId}, RecordId).

% throws Exception
deleteRecoreStore(This, AbeClientInformation) ->
        'RecordStore':deleteRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation)).

% throws Exception
deleteAll(This, AbeClientInformation) ->
        Size = (get({get({This, idList}), '$class'})):size(get({This, idList})),
        lists:foreach(fun(Index) ->
            Integer = array:get(Index, get({get({This, idList}), objectArray})),
            (get({This, '$class'})):delete(This, AbeClientInformation, (get({Integer, '$class'})):intValue(Integer))
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):clear(This).

% throws Exception
delete(This, AbeClientInformation, DeleteId) when is_integer(DeleteId) ->
        put({local, recordStore}, get({'NullRecordStore', 'NULL_RECORD_STORE'})),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66874) -> (get({Target_N66874, '$class'})):toString(Target_N66874) end)((fun(Target_N66881) -> (get({Target_N66881, '$class'})):appendint(Target_N66881, DeleteId) end)((fun(Target_N66888) -> (get({Target_N66888, '$class'})):append(Target_N66888, get({get({This, persistanceStrings}), 'DELETING_WITH_ID'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), delete})),
            put({local, recordStore}, 'RecordStore':openRecordStore((get({This, '$class'})):getRecordId(This, AbeClientInformation), true)),
            (get({get({local, recordStore}), '$class'})):deleteRecord(get({local, recordStore}), DeleteId)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            case (get({local, recordStore}) =/= undefined) of
                true ->
                'PreLogUtil':put(get({get({This, persistanceStrings}), 'CLOSING_RECORDSTORE'}), This, get({get({This, commonStrings}), delete})),
                (get({get({local, recordStore}), '$class'})):closeRecordStore(get({local, recordStore}));
                false -> ok
            end
        end.

getRecordId(This, AbeClientInformation) ->
        (get({get({This, platformRecordIdUtil}), '$class'})):getRecordId(get({This, platformRecordIdUtil}), AbeClientInformation, get({This, recordId})).

getList(This) ->
        get({This, valueList}).

getIds(This) ->
        get({This, idList}).

clear(This) ->
        (get({get({This, valueList}), '$class'})):clear(get({This, valueList})),
        (get({get({This, idList}), '$class'})):clear(get({This, idList})).

