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
% package views.business.context.modules.storefront.customizer
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.generator.TransformGeneratorUtil
% import org.allbinary.logic.visual.transform.info.TransformInfo
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface

-module('StoreCustomizerComponentUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StoreCustomizerComponentUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'StoreCustomizerComponentUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
generate(This, AbeClientInformation, TransformInfoInterface) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Generating Modified Views For: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "generateModifiedViews()");
            false -> ok
        end,
        CustomizerUtil = 'CustomizerUtil':getInstance(),
        AllCustomizedViews = (get({CustomizerUtil, '$class'})):getTransformInfoObjectConfigGroupComponentNodes(CustomizerUtil, TransformInfoInterface),
        Size = (get({AllCustomizedViews, '$class'})):size(AllCustomizedViews),
        lists:foreach(fun(Index) ->
            NextTransformInfoInterface = (get({AllCustomizedViews, '$class'})):get(AllCustomizedViews, Index),
            AllViewsToBeModified = (get({CustomizerUtil, '$class'})):getTransformInfoObjectConfigComponentNodesToCustomize(CustomizerUtil, TransformInfoInterface, NextTransformInfoInterface),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View or component that was modified by a Customizer: ", (get({NextTransformInfoInterface, '$class'})):getName(NextTransformInfoInterface)]), This, "generateModifiedViews()");
                false -> ok
            end,
            (get({This, '$class'})):generate(This, AbeClientInformation, TransformInfoInterface, AllViewsToBeModified)
        end, lists:seq(0, Size - 1)),
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

% throws Exception
generate(This, AbeClientInformation, TransformInfoInterface, AllViewsToBeModifiedVector) ->
        CustomizerUtil = 'CustomizerUtil':getInstance(),
        Size = (get({AllViewsToBeModifiedVector, '$class'})):size(AllViewsToBeModifiedVector),
        lists:foreach(fun(Index) ->
            NextTransformInfoInterface = (get({AllViewsToBeModifiedVector, '$class'})):get(AllViewsToBeModifiedVector, Index),
            SpecifiedTransformInfoInterface = (get({CustomizerUtil, '$class'})):getTransformInfoInterfaceToCustomize(CustomizerUtil, TransformInfoInterface, NextTransformInfoInterface),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Retrieved: ", (get({SpecifiedTransformInfoInterface, '$class'})):getName(SpecifiedTransformInfoInterface)]), This, "generateModifiedViews()");
                false -> ok
            end,
            (fun(Target_N67490) -> (get({Target_N67490, '$class'})):generate(Target_N67490, AbeClientInformation, NextTransformInfoInterface, SpecifiedTransformInfoInterface) end)('TransformGeneratorUtil':getInstance())
        end, lists:seq(0, Size - 1)).

