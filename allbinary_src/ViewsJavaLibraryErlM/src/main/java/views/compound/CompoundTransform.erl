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
% package views.compound
% import java.io.InputStream
% import javax.xml.transform.URIResolver
% import org.allbinary.data.tree.dom.BasicUriResolver
% import org.allbinary.data.tree.dom.StoreUriResolver
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.AbTransformer
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import views.compound.objectConfig.CompoundContextTransformInfoObjectConfig

-module('CompoundTransform').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbTransformer', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'AbTransformer':init(This, TransformInfoInterface),
        init_fields(This),
        (get({This, '$class'})):setURIResolver(This, 'StoreUriResolver':new((get({This, '$class'})):getTransformInfoInterface(This), (get({This, '$class'})):getURIResolver(This))),
        ObjectConfig = 'CompoundContextTransformInfoObjectConfig':new(get({This, abeClientInformation}), (get({This, '$class'})):getTransformInfoInterface(This), (fun(Target_N66163) -> (get({Target_N66163, '$class'})):toXmlDoc(Target_N66163) end)((fun(Target_N66170) -> (get({Target_N66170, '$class'})):getObjectConfigInterface(Target_N66170) end)((get({This, '$class'})):getTransformInfoInterface(This)))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["\nObjectConfig: \n", (get({ObjectConfig, '$class'})):toString(ObjectConfig)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        TemplateInputStream = (get({ObjectConfig, '$class'})):createInputStream(ObjectConfig),
        (get({This, '$class'})):setInputStream(This, TemplateInputStream).

