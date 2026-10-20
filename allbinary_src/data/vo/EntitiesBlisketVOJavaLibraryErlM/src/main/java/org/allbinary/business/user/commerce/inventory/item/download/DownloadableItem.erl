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
% package org.allbinary.business.user.commerce.inventory.item.download
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.data.generator.ProductIdGenerator
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.time.TimeUtil

-module('DownloadableItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, id}, undefined),
    put({This, basicItemId}, undefined),
    put({This, enabled}, undefined),
    put({This, system}, undefined),
    put({This, platform}, undefined),
    put({This, specialName}, undefined),
    put({This, version}, undefined),
    put({This, changes}, undefined),
    put({This, licenseFile}, undefined),
    put({This, file}, undefined),
    put({This, size}, undefined),
    put({This, validTime}, undefined),
    put({This, retries}, undefined),
    ok.


new(Id) when (is_list(Id) orelse Id =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Id),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
    init_fields(This),
        EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        put({This, id}, (fun(Target_N66434) -> (get({Target_N66434, '$class'})):getNext(Target_N66434) end)('ProductIdGenerator':new())),
        put({This, basicItemId}, Id),
        put({This, enabled}, get({'EntryData':getInstance(), 'YES'})),
        put({This, system}, "Java"),
        put({This, platform}, "Android"),
        put({This, specialName}, EMPTY_STRING),
        put({This, version}, EMPTY_STRING),
        put({This, changes}, EMPTY_STRING),
        put({This, licenseFile}, EMPTY_STRING),
        put({This, file}, EMPTY_STRING),
        put({This, size}, allbinary_java:to_string(0)),
        put({This, validTime}, allbinary_java:to_string(0)),
        put({This, retries}, EMPTY_STRING);
'$init'(This, HashMap) ->
    init_fields(This),
        put({This, id}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'ID'}))),
        put({This, basicItemId}, (get({HashMap, '$class'})):get(HashMap, get({'BasicItemData':getInstance(), 'ID'}))),
        put({This, enabled}, (get({HashMap, '$class'})):get(HashMap, get({'EntryData':getInstance(), 'ENABLE'}))),
        put({This, system}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'SYSTEM'}))),
        put({This, platform}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'PLATFORM'}))),
        put({This, specialName}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'SPECIAL_NAME'}))),
        put({This, version}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VERSION'}))),
        put({This, changes}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'CHANGES'}))),
        put({This, licenseFile}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'LICENSE_FILE'}))),
        put({This, file}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'FILE'}))),
        Value = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'SIZE'})),
        case (not (fun(Target_N67654) -> (get({Target_N67654, '$class'})):isEmpty(Target_N67654, Value) end)('StringValidationUtil':getInstance())) of
            true ->
            put({This, size}, allbinary_java:to_string(Value));
            false ->
            put({This, size}, 0)
        end,
        ValidTime = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VALID_TIME'})),
        case (not (fun(Target_N67872) -> (get({Target_N67872, '$class'})):isEmpty(Target_N67872, ValidTime) end)('StringValidationUtil':getInstance())) of
            true ->
            put({This, validTime}, allbinary_java:to_string(ValidTime));
            false ->
            TotalYears = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VALID_TIME_YEARS'})),
            TotalMonths = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VALID_TIME_MONTHS'})),
            TotalDays = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VALID_TIME_DAYS'})),
            TotalHours = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VALID_TIME_HOURS'})),
            TotalMinutes = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VALID_TIME_MINUTES'})),
            TotalSeconds = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'VALID_TIME_SECONDS'})),
            TotalTime = (fun(Target_N68368) -> (get({Target_N68368, '$class'})):getTotalTime(Target_N68368, TotalYears, TotalMonths, TotalDays, TotalHours, TotalMinutes, TotalSeconds) end)('TimeUtil':getInstance()),
            put({This, validTime}, TotalTime)
        end,
        put({This, retries}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'RETRIES'}))).


toVector(This) ->
        Calendar = 'Calendar':getInstance(),
        Time = (fun(Target_N68718) -> (get({Target_N68718, '$class'})):toString(Target_N68718) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar)),
        Values = 'BasicArrayListD':new(),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getId(This)),
        (get({Values, '$class'})):add(Values, get({This, basicItemId})),
        (get({Values, '$class'})):add(Values, get({This, enabled})),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getSpecialName(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getVersion(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getChanges(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getSystem(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getPlatform(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getLicenseFile(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getFile(This)),
        (get({Values, '$class'})):add(Values, (fun(Target_N69169) -> (get({Target_N69169, '$class'})):toString(Target_N69169) end)((get({This, '$class'})):getSize(This))),
        (get({Values, '$class'})):add(Values, (fun(Target_N69211) -> (get({Target_N69211, '$class'})):toString(Target_N69211) end)((get({This, '$class'})):getValidTime(This))),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getRetries(This)),
        (get({Values, '$class'})):add(Values, Time),
        (get({Values, '$class'})):add(Values, Time),
        Values.

toHashMap(This) ->
        Values = (fun(Target_N69382) -> (get({Target_N69382, '$class'})):createHashMap(Target_N69382) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'ID'}), (get({This, '$class'})):getId(This)),
        (get({Values, '$class'})):put(Values, get({'BasicItemData':getInstance(), 'ID'}), get({This, basicItemId})),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'ENABLE'}), get({This, enabled})),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'SYSTEM'}), (get({This, '$class'})):getSystem(This)),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'PLATFORM'}), (get({This, '$class'})):getPlatform(This)),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'SPECIAL_NAME'}), (get({This, '$class'})):getSpecialName(This)),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'VERSION'}), (get({This, '$class'})):getVersion(This)),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'CHANGES'}), (get({This, '$class'})):getChanges(This)),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'LICENSE_FILE'}), (get({This, '$class'})):getLicenseFile(This)),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'FILE'}), (get({This, '$class'})):getFile(This)),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'SIZE'}), (fun(Target_N69974) -> (get({Target_N69974, '$class'})):toString(Target_N69974) end)((get({This, '$class'})):getSize(This))),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'VALID_TIME'}), (fun(Target_N70032) -> (get({Target_N70032, '$class'})):toString(Target_N70032) end)((get({This, '$class'})):getValidTime(This))),
        (get({Values, '$class'})):put(Values, get({'DownloadItemData', 'RETRIES'}), (get({This, '$class'})):getRetries(This)),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N70171) -> (get({Target_N70171, '$class'})):toString(Target_N70171) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

getId(This) ->
        get({This, id}).

getSystem(This) ->
        get({This, system}).

getPlatform(This) ->
        get({This, platform}).

getSpecialName(This) ->
        get({This, specialName}).

getVersion(This) ->
        get({This, version}).

getChanges(This) ->
        get({This, changes}).

getLicenseFile(This) ->
        get({This, licenseFile}).

getFile(This) ->
        get({This, file}).

getSize(This) ->
        get({This, size}).

getValidTime(This) ->
        get({This, validTime}).

getRetries(This) ->
        get({This, retries}).

