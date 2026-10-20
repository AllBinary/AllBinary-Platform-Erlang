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
% package views.business.context
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.TransformFactory
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.info.TransformInfo
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.template.TransformTemplateInterface
% import views.business.context.modules.storefront.HttpStoreComponentView
% import views.business.context.modules.storefront.customizer.template.objectConfig.NoTemplateTransformInfoObjectConfig

-module('RootContextView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformTemplateInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "RootContextView()");
            false -> ok
        end.

% throws Exception
view(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (fun(Target_N66563) -> (get({Target_N66563, '$class'})):getName(Target_N66563) end)((get({This, '$class'})):getTransformInfoInterface(This))]), This, "view()");
                false -> ok
            end,
            ViewName = (get({This, '$class'})):getName(This),
            ComponentInterface = (fun(Target_N66645) -> (get({Target_N66645, '$class'})):getInstance(Target_N66645, get({This, abeClientInformation}), ViewName, (get({This, '$class'})):getTransformInfoInterface(This)) end)('TransformFactory':getInstance()),
            (get({ComponentInterface, '$class'})):view(ComponentInterface)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
getName(This) ->
        try
            ObjectConfig = 'NoTemplateTransformInfoObjectConfig':new((get({This, '$class'})):getTransformInfoInterface(This), (fun(Target_N67106) -> (get({Target_N67106, '$class'})):toXmlDoc(Target_N67106) end)((fun(Target_N67113) -> (get({Target_N67113, '$class'})):getObjectConfigInterface(Target_N67113) end)((get({This, '$class'})):getTransformInfoInterface(This)))),
            ComponentsVector = (get({ObjectConfig, '$class'})):getTransforms(ObjectConfig),
            case ((get({ComponentsVector, '$class'})):size(ComponentsVector) =:= 0) of
                true ->
                erlang:error({'Exception', "Template View Not Set - No Components"});
                false -> ok
            end,
            case ((get({ComponentsVector, '$class'})):size(ComponentsVector) > 1) of
                true ->
                erlang:error({'Exception', lists:concat(["To Many Root Template Views: ", (get({ComponentsVector, '$class'})):size(ComponentsVector)])});
                false -> ok
            end,
            TransformInfoInterface = (get({ComponentsVector, '$class'})):get(ComponentsVector, 0),
            ViewName = (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Root Template With View Name: ", ViewName]), This, "getName()");
                false -> ok
            end,
            case (fun(Target_N67665) -> (get({Target_N67665, '$class'})):isEmpty(Target_N67665, ViewName) end)('StringValidationUtil':getInstance()) of
                true ->
                erlang:error({'Exception', "Template View Not Set - No View Name"});
                false -> ok
            end,
            ViewName
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getName()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

