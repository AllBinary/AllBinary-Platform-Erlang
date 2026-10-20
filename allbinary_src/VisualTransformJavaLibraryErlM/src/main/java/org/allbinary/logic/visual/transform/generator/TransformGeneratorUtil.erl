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
% package org.allbinary.logic.visual.transform.generator
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.InputOutputTypeData
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.TransformFactory
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoDomNode
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.generator.StoreFileGenerator

-module('TransformGeneratorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformGeneratorUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'TransformGeneratorUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
generate(This, AbeClientInformation, TransformInfoInterface, OwnerTransformInfoInterface) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Generating View: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "generate()");
                false -> ok
            end,
            ComponentInterface = (fun(Target_N66369) -> (get({Target_N66369, '$class'})):getInstance(Target_N66369, AbeClientInformation, (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface), OwnerTransformInfoInterface) end)('TransformFactory':getInstance()),
            Result = (get({ComponentInterface, '$class'})):view(ComponentInterface),
            HttpTransformInfoInterface = (get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface),
            InputOutputTypeData = 'InputOutputTypeData':getInstance(),
            case (allbinary_java:index_of(Result, "<HTML>") >= 0) of
                true ->
                (fun(Target_N66698) -> (get({Target_N66698, '$class'})):put(Target_N66698, get({InputOutputTypeData, 'NAME'}), get({InputOutputTypeData, 'DEFAULT'})) end)((get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface));
                false ->
                (fun(Target_N66628) -> (get({Target_N66628, '$class'})):put(Target_N66628, get({InputOutputTypeData, 'NAME'}), get({InputOutputTypeData, 'DEFAULT_FRAGMENT'})) end)((get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface))
            end,
            (fun(Target_N66764) -> (get({Target_N66764, '$class'})):process(Target_N66764, Result) end)('StoreFileGenerator':new((get({ComponentInterface, '$class'})):getTransformInfoInterface(ComponentInterface)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate a view", This, "generate()", E);
                false -> ok
            end,
            erlang:error(E)
        end;
% throws Exception
generate(This, AbeClientInformation, TransformInfoDomNode, OwnerTransformInfoInterface) ->
        (get({This, '$class'})):generate(This, AbeClientInformation, (get({TransformInfoDomNode, '$class'})):getTransformInfoInterface(TransformInfoDomNode), OwnerTransformInfoInterface).


