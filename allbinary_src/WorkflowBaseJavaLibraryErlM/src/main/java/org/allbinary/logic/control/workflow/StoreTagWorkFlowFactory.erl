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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.string.CommonStrings

-module('StoreTagWorkFlowFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StoreTagWorkFlowFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'StoreTagWorkFlowFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception, LicensingException
getInstance(This, AbeClientInformation, PropertiesHashMap, PageContext) ->
        try
            put({local, workFlowClassName}, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'DynamicObjectData', 'NAME'}))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Creating WorkFlow: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({local, workFlowClassName})),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "->"),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), atom_to_list(get({get({'StoreTagWorkFlowFactory', instance}), '$class'}))),
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({local, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            Params = array:new(2, {default, undefined}),
            Classes = array:new(2, {default, undefined}),
            array:set(0, get({PropertiesHashMap, '$class'}), Classes),
            array:set(1, (fun(Target_N66767) -> (get({Target_N66767, '$class'})):getClass(Target_N66767, AbeClientInformation, "javax.servlet.jsp.PageContext") end)('AbeFactory':getInstance()), Classes),
            array:set(0, PropertiesHashMap, Params),
            array:set(1, PageContext, Params),
            (fun(Target_N66908) -> (get({Target_N66908, '$class'})):getInstance(Target_N66908, AbeClientInformation, get({local, workFlowClassName}), Classes, Params) end)('AbeFactory':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                put({local, workFlowClassName}, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'DynamicObjectData', 'NAME'}))),
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Error Creating WorkFlow: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({local, workFlowClassName})),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "->"),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), atom_to_list(get({get({'StoreTagWorkFlowFactory', instance}), '$class'}))),
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({local, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

