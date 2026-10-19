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
% package org.allbinary.logic.system.os
% import org.allbinary.logic.java.character.CharacterSet
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonSeps

-module('GenericOperatingSystem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OperatingSystemInterface

init_fields(This) ->
    put({This, osName}, undefined),
    put({This, osArch}, undefined),
    put({This, osVersion}, undefined),
    put({This, characterSet}, 'CharacterSet':new()),
    put({This, scalable}, false),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        SystemProperties = 'SystemProperties':getInstance(),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({SystemProperties, '$class'})):getName(SystemProperties)) of
            true ->
            put({This, osName}, EMPTY_STRING);
            false ->
            put({This, osName}, (get({SystemProperties, '$class'})):getName(SystemProperties))
        end,
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({SystemProperties, '$class'})):getArch(SystemProperties)) of
            true ->
            put({This, osArch}, EMPTY_STRING);
            false ->
            put({This, osArch}, (get({SystemProperties, '$class'})):getArch(SystemProperties))
        end,
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({SystemProperties, '$class'})):getVersion(SystemProperties)) of
            true ->
            put({This, osVersion}, EMPTY_STRING);
            false ->
            put({This, osVersion}, (get({SystemProperties, '$class'})):getVersion(SystemProperties))
        end.

getName(This) ->
        get({This, osName}).

getVersion(This) ->
        get({This, osVersion}).

getArch(This) ->
        get({This, osArch}).

getCharacterSet(This) ->
        get({This, characterSet}).

isOverScan(This) ->
        false.

getOverScanXPercent(This) ->
        100.

getOverScanYPercent(This) ->
        100.

isScalable(This) ->
        get({This, scalable}).

isAutoHide(This) ->
        false.

toString(This) ->
        NEW_LINE = get({'CommonSeps':getInstance(), 'NEW_LINE'}),
        OsBuffer = 'StringMaker':new(),
        (get({OsBuffer, '$class'})):append(OsBuffer, "Operating System Info: \n"),
        (get({OsBuffer, '$class'})):append(OsBuffer, (get({This, '$class'})):getName(This)),
        (get({OsBuffer, '$class'})):append(OsBuffer, NEW_LINE),
        (get({OsBuffer, '$class'})):append(OsBuffer, (get({This, '$class'})):getArch(This)),
        (get({OsBuffer, '$class'})):append(OsBuffer, NEW_LINE),
        (get({OsBuffer, '$class'})):append(OsBuffer, (get({This, '$class'})):getVersion(This)),
        (get({OsBuffer, '$class'})):append(OsBuffer, NEW_LINE),
        (get({OsBuffer, '$class'})):append(OsBuffer, (fun(Target_N67268) -> (get({Target_N67268, '$class'})):toString(Target_N67268, (get({This, '$class'})):getCharacterSet(This)) end)('StringUtil':getInstance())),
        (get({OsBuffer, '$class'})):append(OsBuffer, NEW_LINE),
        (get({OsBuffer, '$class'})):toString(OsBuffer).

