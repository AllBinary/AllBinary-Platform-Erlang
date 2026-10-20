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
% package org.allbinary.logic.communication.http.request
% import java.util.HashMap
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.tokens.Tokenizer
% import org.allbinary.logic.visual.dhtml.html.name.HtmlNameMathData
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('NameSpaceRequestParam').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, nameSpaceVector}, undefined),
    put({This, nameSpacePropertiesHashMap}, undefined),
    put({This, value}, undefined),
    ok.


new(NameSpace, Value) when (is_list(NameSpace) orelse NameSpace =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, NameSpace, Value),
    This.

'$init'(This, NameSpace, Value) when (is_list(NameSpace) orelse NameSpace =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
    init_fields(This),
        put({This, nameSpaceVector}, 'BasicArrayListD':new()),
        put({This, nameSpacePropertiesHashMap}, (fun(Target_N66035) -> (get({Target_N66035, '$class'})):createHashMap(Target_N66035) end)('StdUtil':getInstance())),
        put({This, value}, Value),
        BeginIndex = allbinary_java:index_of(NameSpace, get({'NameSpaceRequestParamData', 'NAME'})),
        case (BeginIndex < 0) of
            true ->
            erlang:error({'Exception', "Not a NameSpaceRequest"});
            false -> ok
        end,
        Packages = string:slice(NameSpace, ((BeginIndex + (get({get({'NameSpaceRequestParamData', 'NAME'}), '$class'})):length(get({'NameSpaceRequestParamData', 'NAME'}))) + (get({get({'NameSpaceRequestParamData', 'SEP'}), '$class'})):length(get({'NameSpaceRequestParamData', 'SEP'})))),
        SepTokenizer = 'Tokenizer':new(get({'NameSpaceRequestParamData', 'SEP'})),
        NameSpaceWithPropertiesVector = (get({SepTokenizer, '$class'})):getTokensFromString(SepTokenizer, Packages, 'BasicArrayListD':new()),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nSep Tokens: ", (get({NameSpaceWithPropertiesVector, '$class'})):toString(NameSpaceWithPropertiesVector)]), This, "NameSpaceRequestParam()");
            false -> ok
        end,
        NameSpaceAndPropertiesTokenizer = 'Tokenizer':new(get({'NameSpaceRequestParamData', 'PROPERTIES'})),
        put({local, packageIndex}, 0),
        List = 'BasicArrayListD':new(),
        put({local, index}, 0),
        Size = (get({NameSpaceWithPropertiesVector, '$class'})):size(NameSpaceWithPropertiesVector),
        (fun Loop() -> case (get({local, index}) < Size) of true ->
            NameSpaceWithProperties = (get({NameSpaceWithPropertiesVector, '$class'})):get(NameSpaceWithPropertiesVector, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
            (get({List, '$class'})):clear(List),
            NameSpaceAndPropertiesVector = (get({NameSpaceAndPropertiesTokenizer, '$class'})):getTokensFromString(NameSpaceAndPropertiesTokenizer, NameSpaceWithProperties, List),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nPackageName and PackageName Properties Tokens: ", (get({NameSpaceAndPropertiesVector, '$class'})):toString(NameSpaceAndPropertiesVector)]), This, "NameSpaceRequestParam()");
                false -> ok
            end,
            case ((get({NameSpaceAndPropertiesVector, '$class'})):size(NameSpaceAndPropertiesVector) > 0) of
                true ->
                PackageName = (get({NameSpaceAndPropertiesVector, '$class'})):get(NameSpaceAndPropertiesVector, 0),
                case (PackageName =:= undefined) of
                    true ->
                    erlang:error({'Exception', "Package Name Is Null"});
                    false -> ok
                end,
                (get({get({This, nameSpaceVector}), '$class'})):add(get({This, nameSpaceVector}), PackageName),
                case ((get({NameSpaceAndPropertiesVector, '$class'})):size(NameSpaceAndPropertiesVector) > 1) of
                    true ->
                    Properties = (get({NameSpaceAndPropertiesVector, '$class'})):get(NameSpaceAndPropertiesVector, 1),
                    PackagePropertiesHashMap = (get({This, '$class'})):generatePackagePropertiesHashMap(This, Properties),
                    (get({get({This, nameSpacePropertiesHashMap}), '$class'})):put(get({This, nameSpacePropertiesHashMap}), allbinary_java:to_string(get({local, packageIndex})), PackagePropertiesHashMap);
                    false -> ok
                end,
                put({local, packageIndex}, get({local, packageIndex}) + 1);
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["NameSpace: ", (get({get({This, nameSpaceVector}), '$class'})):toString(get({This, nameSpaceVector}))]), This, "NameSpaceRequestParam()");
            false -> ok
        end.

getPackages(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["NameSpace: ", (get({get({This, nameSpaceVector}), '$class'})):toString(get({This, nameSpaceVector}))]), This, "getPackages()");
            false -> ok
        end,
        get({This, nameSpaceVector}).

getPackageProperties(This, PackageIndex) when is_integer(PackageIndex) ->
        put({local, packagePropertiesHashMap}, (get({get({This, nameSpacePropertiesHashMap}), '$class'})):get(get({This, nameSpacePropertiesHashMap}), allbinary_java:to_string(PackageIndex))),
        case (get({local, packagePropertiesHashMap}) =:= undefined) of
            true ->
            put({local, packagePropertiesHashMap}, (fun(Target_N68415) -> (get({Target_N68415, '$class'})):createHashMap(Target_N68415) end)('StdUtil':getInstance()));
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Package Properties: ", (get({get({local, packagePropertiesHashMap}), '$class'})):toString(get({local, packagePropertiesHashMap}))]), This, "getPackagesProperties()");
            false -> ok
        end,
        get({local, packagePropertiesHashMap}).

getValue(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nValue: ", get({This, value})]), This, "getValue()");
            false -> ok
        end,
        get({This, value}).

% throws Exception
generatePackagePropertiesHashMap(This, Properties) when (is_list(Properties) orelse Properties =:= undefined) ->
        PropertiesTokenizer = 'Tokenizer':new(get({'NameSpaceRequestParamData', 'PROPERTIESSEPARATOR'})),
        PackagePropertiesHashMap = (fun(Target_N69075) -> (get({Target_N69075, '$class'})):createHashMap(Target_N69075) end)('StdUtil':getInstance()),
        PropertyVector = (get({PropertiesTokenizer, '$class'})):getTokensFromString(PropertiesTokenizer, Properties, 'BasicArrayListD':new()),
        List = 'BasicArrayListD':new(),
        PropertyTokenizer = 'Tokenizer':new(get({'HtmlNameMathData':getInstance(), 'EQUALS'})),
        Index = 0,
        Size = (get({PropertyVector, '$class'})):size(PropertyVector),
        (fun Loop() -> case (Index < Size) of true ->
            Property = (get({PropertyVector, '$class'})):get(PropertyVector, Index),
            (get({List, '$class'})):clear(List),
            PropertyNameValueVector = (get({PropertyTokenizer, '$class'})):getTokensFromString(PropertyTokenizer, Property, List),
            put({local, index2}, 0),
            (fun Loop() -> case (get({local, index2}) < (get({PropertyNameValueVector, '$class'})):size(PropertyNameValueVector)) of true ->
                PropertyName = (get({PropertyNameValueVector, '$class'})):get(PropertyNameValueVector, allbinary_java:first(get({local, index2}), put({local, index2}, get({local, index2}) + 1))),
                case ((get({PropertyNameValueVector, '$class'})):size(PropertyNameValueVector) > 1) of
                    true ->
                    PropertyValue = (get({PropertyNameValueVector, '$class'})):get(PropertyNameValueVector, allbinary_java:first(get({local, index2}), put({local, index2}, get({local, index2}) + 1))),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["\nProperty Name: ", PropertyName]), "\nProperty Value: "]), PropertyValue]), This, "generatePackagePropertiesHashMap()");
                        false -> ok
                    end,
                    (get({PackagePropertiesHashMap, '$class'})):put(PackagePropertiesHashMap, PropertyName, PropertyValue);
                    false ->
                    (get({PackagePropertiesHashMap, '$class'})):put(PackagePropertiesHashMap, PropertyName, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
                end,
                Loop();
            false -> ok end end)(),
            Loop();
        false -> ok end end)(),
        PackagePropertiesHashMap.

