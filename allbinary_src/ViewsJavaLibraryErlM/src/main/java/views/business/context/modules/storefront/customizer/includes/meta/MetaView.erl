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
% package views.business.context.modules.storefront.customizer.includes.meta
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.template.customizer.includes.meta.MetasValidation
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('MetaView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, metasValidation}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, metasValidation}, 'MetasValidation':new((fun(Target_N66010) -> (get({Target_N66010, '$class'})):getStoreName(Target_N66010) end)((get({This, '$class'})):getWeblisketSession(This)))).

addDomNodeInterfaces(This) ->
        (get({This, '$class'})):addDomNodeInterface(This, get({This, metasValidation})).

% throws Exception
toXmlNode(This, Document) ->
        try
            (get({get({This, metasValidation}), '$class'})):toXmlNode(get({This, metasValidation}), Document)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XSLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "toXmlNode", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

