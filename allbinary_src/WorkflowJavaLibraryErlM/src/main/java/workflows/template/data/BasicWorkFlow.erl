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
% package workflows.template.data
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import javax.servlet.jsp.tagext.TagSupport
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.control.workflow.WorkFlowData
% import org.allbinary.logic.control.workflow.WorkFlowInterface
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.TransformFactory
% import org.allbinary.string.CommonStrings

-module('BasicWorkFlow').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements WorkFlowInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, validationDomNodeInterface}, undefined),
    put({This, propertiesHashMap}, undefined),
    put({This, pageContext}, undefined),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PropertiesHashMap, PageContext),
    This.

init(This, PropertiesHashMap, PageContext) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'WORKFLOW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties: ", (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)]), This, "BasicWorkFlow()");
            false -> ok
        end,
        put({This, propertiesHashMap}, PropertiesHashMap),
        put({This, pageContext}, PageContext),
        put({This, validationDomNodeInterface}, (fun(Target_N66501) -> (get({Target_N66501, '$class'})):getInstance(Target_N66501, get({This, abeClientInformation}), PropertiesHashMap, PageContext) end)('TransformFactory':getInstance())).

% throws Exception
getName(This) ->
        (fun(Target_N66642) -> (get({Target_N66642, '$class'})):get(Target_N66642, get({'WorkFlowData':getInstance(), 'NAME'})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

getPropertiesHashMap(This) ->
        get({This, propertiesHashMap}).

getPageContext(This) ->
        get({This, pageContext}).

% throws Exception
process(This) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'WORKFLOW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'PROCESS'}));
            false -> ok
        end,
        case (fun(Target_N67073) -> (get({Target_N67073, '$class'})):booleanValue(Target_N67073) end)((get({get({This, validationDomNodeInterface}), '$class'})):isValid(get({This, validationDomNodeInterface}))) of
            true ->
            (fun(Target_N67211) -> (get({Target_N67211, '$class'})):print(Target_N67211, (get({get({This, validationDomNodeInterface}), '$class'})):view(get({This, validationDomNodeInterface}))) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
            throw({'$return', allbinary_java:to_string(get({'TagSupport', 'EVAL_BODY_INCLUDE'}))});
            false ->
            (fun(Target_N67108) -> (get({Target_N67108, '$class'})):print(Target_N67108, (get({get({This, validationDomNodeInterface}), '$class'})):validationInfo(get({This, validationDomNodeInterface}))) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext}))),
            throw({'$return', allbinary_java:to_string(get({'TagSupport', 'SKIP_BODY'}))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

