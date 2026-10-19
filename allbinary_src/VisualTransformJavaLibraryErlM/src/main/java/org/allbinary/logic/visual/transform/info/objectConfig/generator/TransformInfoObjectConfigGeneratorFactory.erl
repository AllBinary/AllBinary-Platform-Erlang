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
% package org.allbinary.logic.visual.transform.info.objectConfig.generator
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.InputOutputTypeData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings

-module('TransformInfoObjectConfigGeneratorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TransformInfoObjectConfigGeneratorFactoryInterface

static_init() ->
    put({?MODULE, instance}, 'TransformInfoObjectConfigGeneratorFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'TransformInfoObjectConfigGeneratorFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, TransformInfoInterface) ->
        try
        Type = (fun(Target_N65942) -> (get({Target_N65942, '$class'})):getOutputTypeName(Target_N65942) end)((get({TransformInfoInterface, '$class'})):getObjectConfigInterface(TransformInfoInterface)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Generating Instance for type: ", Type]), This, get({CommonStrings, 'GET_INSTANCE'}));
            false -> ok
        end,
        case (((Type =:= undefined) orelse ((get({Type, '$class'})):compareTo(Type, get({'InputOutputTypeData':getInstance(), 'RESPONSE'})) =:= 0)) orelse (get({TransformInfoInterface, '$class'})):isChild(TransformInfoInterface)) of
            true ->
            throw({'$return', 'BasicGenerator':new()});
            false ->
            case ((get({Type, '$class'})):compareTo(Type, get({'InputOutputTypeData':getInstance(), 'FILE'})) =:= 0) of
            true ->
            throw({'$return', 'StoreFileGenerator':new(TransformInfoInterface)});
            false ->
            erlang:error({'Exception', "No Such TransformInfoObjectConfigGenerator Type"})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

