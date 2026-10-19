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
% package admin.taghelpers
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.string.CommonStrings

-module('HelperFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws LicensingException
getInstance(AbeClientInformation, FactoryName, ClassName, HashMap, HttpServletRequest) when (is_list(FactoryName) orelse FactoryName =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            Params = array:new(2, {default, undefined}),
            Classes = array:new(2, {default, undefined}),
            AbeFactory = 'AbeFactory':getInstance(),
            array:set(0, get({HashMap, '$class'}), Classes),
            array:set(1, (get({AbeFactory, '$class'})):getClass(AbeFactory, AbeClientInformation, "javax.servlet.http.HttpServletRequest"), Classes),
            array:set(0, HashMap, Params),
            array:set(1, HttpServletRequest, Params),
            AnyType = (get({AbeFactory, '$class'})):getInstance(AbeFactory, AbeClientInformation, ClassName, Classes, Params),
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, error}, lists:concat([lists:concat([lists:concat(["Failed To Get Instance Args: HashMap=", (get({HashMap, '$class'})):toString(HashMap)]), " HttpServletRequest="]), HttpServletRequest])),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, get({local, error}), lists:concat([FactoryName, "->HelperFactory"]), "getInstance(String, String, HashMap, PageContext)", E);
                false -> ok
            end,
            erlang:error(E)
        end;
% throws LicensingException
getInstance(AbeClientInformation, FactoryName, ClassName, HashMap, PageContext) when (is_list(FactoryName) orelse FactoryName =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            Params = array:new(2, {default, undefined}),
            Classes = array:new(2, {default, undefined}),
            AbeFactory = 'AbeFactory':getInstance(),
            array:set(0, get({HashMap, '$class'}), Classes),
            array:set(1, (get({AbeFactory, '$class'})):getClass(AbeFactory, AbeClientInformation, "javax.servlet.jsp.PageContext"), Classes),
            array:set(0, HashMap, Params),
            array:set(1, PageContext, Params),
            AnyType = (get({AbeFactory, '$class'})):getInstance(AbeFactory, AbeClientInformation, ClassName, Classes, Params),
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                Error = lists:concat([lists:concat([lists:concat(["Failed To Get Instance Args: HashMap=", (get({HashMap, '$class'})):toString(HashMap)]), " PageContext="]), PageContext]),
                (get({LogUtil, '$class'})):put(LogUtil, Error, lists:concat([FactoryName, "->HelperFactory"]), "getInstance(String, String, HashMap, PageContext)", E);
                false -> ok
            end,
            erlang:error(E)
        end.


% throws LicensingException
getInstance(AbeClientInformation, FactoryName, ClassName, HashMap, SpecialhashMap, PageContext) when (is_list(FactoryName) orelse FactoryName =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            Params = array:new(3, {default, undefined}),
            Classes = array:new(3, {default, undefined}),
            AbeFactory = 'AbeFactory':getInstance(),
            array:set(0, get({HashMap, '$class'}), Classes),
            array:set(1, get({SpecialhashMap, '$class'}), Classes),
            array:set(2, (get({AbeFactory, '$class'})):getClass(AbeFactory, AbeClientInformation, "javax.servlet.jsp.PageContext"), Classes),
            array:set(0, HashMap, Params),
            array:set(1, SpecialhashMap, Params),
            array:set(2, PageContext, Params),
            AnyType = (get({AbeFactory, '$class'})):getInstance(AbeFactory, AbeClientInformation, ClassName, Classes, Params),
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                Error = lists:concat([lists:concat([lists:concat(["Failed To Get Instance Args: HashMap=", (get({HashMap, '$class'})):toString(HashMap)]), " PageContext="]), PageContext]),
                (get({LogUtil, '$class'})):put(LogUtil, Error, lists:concat([FactoryName, "->HelperFactory"]), "getInstance(String, String, HashMap, PageContext)", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws LicensingException
getInstance(AbeClientInformation, FactoryName, ClassName) when (is_list(FactoryName) orelse FactoryName =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            AnyType = (fun(Target_N70102) -> (get({Target_N70102, '$class'})):getInstance(Target_N70102, AbeClientInformation, ClassName) end)('AbeFactory':getInstance()),
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({LogUtil, '$class'})):put(LogUtil, get({get({local, commonStrings}), 'EXCEPTION'}), lists:concat([FactoryName, "->HelperFactory"]), "getInstance(String, String, HashMap, PageContext)", E);
                false -> ok
            end,
            erlang:error(E)
        end.

