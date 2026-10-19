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
% package org.allbinary.logic.system.security.licensing
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('AbeClientLicense').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AbeLicenseInterface

init_fields(This) ->
    put({This, hashtable}, undefined),
    put({This, id}, undefined),
    put({This, servers}, undefined),
    put({This, special}, undefined),
    put({This, licenseType}, undefined),
    ok.


new(Hashtable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Hashtable),
    This.

init(This, Hashtable) ->
    init_fields(This),
        put({This, hashtable}, (fun(Target_N65989) -> (get({Target_N65989, '$class'})):createHashtable(Target_N65989) end)('StdUtil':getInstance())),
        AbeClientInformationData = 'AbeClientInformationData':getInstance(),
        KeyValue = (get({Hashtable, '$class'})):get(Hashtable, get({AbeClientInformationData, 'KEY'})),
        case (KeyValue =/= undefined) of
            true ->
            case allbinary_java:instance_of(KeyValue, 'String') of
                true ->
                (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), get({AbeClientInformationData, 'KEY'}), KeyValue);
                false -> ok
            end;
            false -> ok
        end,
        put({This, id}, (get({Hashtable, '$class'})):get(Hashtable, get({AbeClientInformationData, 'LICENSEID'}))),
        Vector = (get({Hashtable, '$class'})):get(Hashtable, get({AbeClientInformationData, 'LICENSESERVERS'})),
        put({This, servers}, 'BasicArrayListD':new()),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            (get({get({This, servers}), '$class'})):add(get({This, servers}), (get({Vector, '$class'})):get(Vector, Index))
        end, lists:seq(0, Size - 1)),
        StringUtil = 'StringUtil':getInstance(),
        (get({This, '$class'})):setSpecial(This, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({Hashtable, '$class'})):get(Hashtable, get({AbeClientInformationData, 'SPECIAL'})))),
        LicenseTypeString = (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({Hashtable, '$class'})):get(Hashtable, get({AbeClientInformationData, 'LICENSE_TYPE'}))),
        put({This, licenseType}, (fun(Target_N66816) -> (get({Target_N66816, '$class'})):getInstance(Target_N66816, LicenseTypeString) end)('LicenseTypeFactory':getInstance())).

hasRequiredKeys(ResultHashtable) ->
        try
        AbeClientInformationData = 'AbeClientInformationData':getInstance(),
        case ((((get({ResultHashtable, '$class'})):containsKey(ResultHashtable, get({AbeClientInformationData, 'LICENSEID'})) andalso (get({ResultHashtable, '$class'})):containsKey(ResultHashtable, get({AbeClientInformationData, 'LICENSESERVERS'}))) andalso (get({ResultHashtable, '$class'})):containsKey(ResultHashtable, get({AbeClientInformationData, 'KEY'}))) andalso (get({ResultHashtable, '$class'})):containsKey(ResultHashtable, get({AbeClientInformationData, 'LICENSE_TYPE'}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

hasKey(This) ->
        (get({This, '$class'})):isValid(This).

getKey(This, KeyName) when (is_list(KeyName) orelse KeyName =:= undefined) ->
        (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), KeyName).

getLicenseId(This) ->
        get({This, id}).

getServers(This) ->
        get({This, servers}).

isValid(This) ->
        try
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({This, '$class'})):getKey(This, get({'AbeClientInformationData':getInstance(), 'KEY'})))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        BREAK = "<br/>",
        (get({StringBuffer, '$class'})):append(StringBuffer, "License Id: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getLicenseId(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, BREAK),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Is Valid: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isValid(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, BREAK),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Keys: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, hashtable}), '$class'})):toString(get({This, hashtable}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, BREAK),
        ServerVector = (get({This, '$class'})):getServers(This),
        Size = (get({ServerVector, '$class'})):size(ServerVector),
        lists:foreach(fun(Index) ->
            NextServerString = (get({ServerVector, '$class'})):get(ServerVector, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Server: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, NextServerString),
            (get({StringBuffer, '$class'})):append(StringBuffer, BREAK)
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

setSpecial(This, Special) when (is_list(Special) orelse Special =:= undefined) ->
        put({This, special}, Special).

getSpecial(This) ->
        get({This, special}).

getLicenseType(This) ->
        get({This, licenseType}).

