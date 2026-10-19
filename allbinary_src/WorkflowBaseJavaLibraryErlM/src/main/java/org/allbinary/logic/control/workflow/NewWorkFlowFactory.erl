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
% package org.allbinary.logic.control.workflow
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.string.CommonStrings

-module('NewWorkFlowFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'NewWorkFlowFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'NewWorkFlowFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception, LicensingException
getInstance(This, AbeClientInformation, HashMap, PageContext) ->
        try
            ClassName = (get({HashMap, '$class'})):get(HashMap, get({'DynamicObjectData', 'NAME'})),
            Params = array:new(2, {default, undefined}),
            Classes = array:new(2, {default, undefined}),
            array:set(0, get({HashMap, '$class'}), Classes),
            array:set(1, (fun(Target_N66328) -> (get({Target_N66328, '$class'})):getClass(Target_N66328, AbeClientInformation, "javax.servlet.jsp.PageContext") end)('AbeFactory':getInstance()), Classes),
            array:set(0, HashMap, Params),
            array:set(1, PageContext, Params),
            AnyType = (fun(Target_N66481) -> (get({Target_N66481, '$class'})):getInstance(Target_N66481, AbeClientInformation, ClassName, Classes, Params) end)('AbeFactory':getInstance()),
            'WorkFlowWrapper':new(AnyType)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), This, "getInstance(HashMap)", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception, LicensingException
getInstance(This, AbeClientInformation, ClassName) when (is_list(ClassName) orelse ClassName =:= undefined) ->
        try
        try
            StringUtil = 'StringUtil':getInstance(),
            case ((ClassName =/= undefined) andalso ((get({ClassName, '$class'})):compareTo(ClassName, get({StringUtil, 'EMPTY_STRING'})) =/= 0)) of
                true ->
                AnyType = (fun(Target_N67547) -> (get({Target_N67547, '$class'})):getInstance(Target_N67547, AbeClientInformation, ClassName, undefined, undefined) end)('AbeFactory':getInstance()),
                throw({'$return', 'WorkFlowWrapper':new(AnyType)});
                false ->
                erlang:error({'Exception', "No WorkFlow ClassName"})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), This, get({get({local, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

