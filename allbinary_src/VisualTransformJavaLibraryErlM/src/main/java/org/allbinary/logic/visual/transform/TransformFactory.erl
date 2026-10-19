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
% package org.allbinary.logic.visual.transform
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.data.tables.transform.info.TransformInfoEntity
% import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpFactory
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoObjectFactory
% import org.allbinary.string.CommonStrings

-module('TransformFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


getInstance() ->
        get({'TransformFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, AbeClientInformation, ViewName, OwnerTransformInfoInterface) when (is_list(ViewName) orelse ViewName =:= undefined) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Creating Transform: ", ViewName]), This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            OwnerTransformInfoHttpInterface = OwnerTransformInfoInterface,
            TransformInfoEntity = 'TransformInfoEntityBuilder':getInstance(),
            TransformInfoInterface = (get({TransformInfoEntity, '$class'})):get(TransformInfoEntity, ViewName, (get({OwnerTransformInfoHttpInterface, '$class'})):getPropertiesHashMap(OwnerTransformInfoHttpInterface), (get({OwnerTransformInfoHttpInterface, '$class'})):getPageContext(OwnerTransformInfoHttpInterface)),
            case (TransformInfoInterface =:= undefined) of
                true ->
                erlang:error({'Exception', lists:concat(["No Such View In DB: ", ViewName])});
                false -> ok
            end,
            (get({TransformInfoInterface, '$class'})):setChild(TransformInfoInterface),
            AnyType = (fun(Target_N66797) -> (get({Target_N66797, '$class'})):getInstance(Target_N66797, AbeClientInformation, TransformInfoInterface) end)('TransformInfoObjectFactory':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Created Transform: ", ViewName]), This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end;
% throws Exception
getInstance(This, AbeClientInformation, PropertiesHashMap, PageContext) ->
        try
            TransformInfoData = 'TransformInfoData':getInstance(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Creating Transform: ", (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({TransformInfoData, 'NAME'}))]), This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            TransformInfoEntity = 'TransformInfoEntityBuilder':getInstance(),
            put({local, transformInfoInterface}, (get({TransformInfoEntity, '$class'})):get(TransformInfoEntity, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({TransformInfoData, 'NAME'})), PropertiesHashMap, PageContext)),
            case (get({local, transformInfoInterface}) =/= undefined) of
                true ->
                (get({get({local, transformInfoInterface}), '$class'})):override(get({local, transformInfoInterface}), PropertiesHashMap);
                false ->
                put({local, transformInfoInterface}, 'TransformInfoHttpFactory':getInstance(PropertiesHashMap, PageContext))
            end,
            AnyType = (fun(Target_N68169) -> (get({Target_N68169, '$class'})):getInstance(Target_N68169, AbeClientInformation, get({local, transformInfoInterface})) end)('TransformInfoObjectFactory':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Created Transform: ", (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({TransformInfoData, 'NAME'}))]), This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Failed To Get Instance: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'TransformInfoData':getInstance(), 'NAME'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, "->TransformFactory"),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.


% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Creating Transform: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "getInstance(TransformInfoInterface)");
                false -> ok
            end,
            AnyType = (fun(Target_N69363) -> (get({Target_N69363, '$class'})):getInstance(Target_N69363, AbeClientInformation, TransformInfoInterface) end)('TransformInfoObjectFactory':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Created Transform: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "getInstance(TransformInfoInterface)");
                false -> ok
            end,
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(TransformInfoInterface)", E);
                false -> ok
            end,
            erlang:error(E)
        end.

