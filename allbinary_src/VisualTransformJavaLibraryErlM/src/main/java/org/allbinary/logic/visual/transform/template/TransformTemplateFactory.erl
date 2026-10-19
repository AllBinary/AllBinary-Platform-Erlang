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
% package org.allbinary.logic.visual.transform.template
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.data.tables.transform.info.TransformInfoEntity
% import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoObjectFactory

-module('TransformTemplateFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformTemplateFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'TransformTemplateFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, AbeClientInformation, TemplateName, PropertiesHashMap, PageContext) when (is_list(TemplateName) orelse TemplateName =:= undefined) ->
        try
            TransformInfoEntity = 'TransformInfoEntityBuilder':getInstance(),
            TransformInfoInterface = (get({TransformInfoEntity, '$class'})):get(TransformInfoEntity, TemplateName, PropertiesHashMap, PageContext),
            (fun(Target_N66198) -> (get({Target_N66198, '$class'})):getInstance(Target_N66198, AbeClientInformation, TransformInfoInterface) end)('TransformInfoObjectFactory':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed To Get Instance",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([lists:concat([Error, TemplateName]), "->TemplateFactory"]), This, "getInstance(viewName, HashMap, PageContext)", E);
                false -> ok
            end,
            erlang:error(E)
        end.

