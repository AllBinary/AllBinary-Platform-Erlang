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
% package views.admin.customizers
% import java.util.Arrays
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.sort.StringComparator
% import org.allbinary.logic.visual.transform.info.CustomizerTransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.template.customizer.TransformTemplateCustomizerData
% import org.allbinary.logic.visual.transform.template.customizer.TransformTemplateCustomizersData
% import org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData
% import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData
% import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('CustomizersView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, customizersVector}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, customizersVector}, (fun(Target_N66506) -> (get({Target_N66506, '$class'})):getNames(Target_N66506, (fun(Target_N66531) -> (get({Target_N66531, '$class'})):getStoreName(Target_N66531) end)((get({This, '$class'})):getWeblisketSession(This))) end)('TransformInfoEntityBuilder':getInstance())).

toXmlNode(This, Document) ->
        try
            Node = (get({Document, '$class'})):createElement(Document, get({'TransformTemplateCustomizersData', 'NAME'})),
            UnsortedCustomizerViewVector = 'BasicArrayListD':new(),
            Size = (get({get({This, customizersVector}), '$class'})):size(get({This, customizersVector})),
            lists:foreach(fun(Index) ->
                put({local, viewName}, (get({get({This, customizersVector}), '$class'})):get(get({This, customizersVector}), Index)),
                case ((((allbinary_java:index_of(get({local, viewName}), get({'CustomizerTransformInfoData', 'NAME'})) > 0) andalso (allbinary_java:index_of(get({local, viewName}), get({get({'CustomizersView', 'GLOBALS2'}), 'EDIT'})) > 0)) andalso (allbinary_java:index_of(get({local, viewName}), get({'BodyData':getInstance(), 'VIEWNAMEKEY'})) > 0)) andalso (allbinary_java:index_of(get({local, viewName}), get({'TitleData':getInstance(), 'VIEWNAMEKEY'})) > 0)) of
                    true ->
                    (get({UnsortedCustomizerViewVector, '$class'})):add(UnsortedCustomizerViewVector, get({local, viewName}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            ObjectArray = (get({UnsortedCustomizerViewVector, '$class'})):toArray(UnsortedCustomizerViewVector),
            'Arrays':sort(ObjectArray, 'StringComparator':new()),
            lists:foreach(fun(Index) ->
                put({local, viewName}, array:get(Index, ObjectArray)),
                ViewNameNode = 'ModDomHelper':createNameValueNodes(Document, get({'TransformTemplateCustomizerData', 'NAME'}), get({local, viewName}), (fun(Target_N67446) -> (get({Target_N67446, '$class'})):getPageNameHack(Target_N67446, get({local, viewName}), (fun(Target_N67479) -> (get({Target_N67479, '$class'})):getStoreName(Target_N67479) end)((get({This, '$class'})):getWeblisketSession(This))) end)('TransformTemplateCustomizerUtil':getInstance())),
                (get({Node, '$class'})):appendChild(Node, ViewNameNode)
            end, lists:seq(0, array:size(ObjectArray) - 1)),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XSLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "toXmlNode", E);
                false -> ok
            end,
            undefined
        end.

addDomNodeInterfaces(This) ->
        (get({This, '$class'})):addDomNodeInterface(This, This).

% throws Exception
view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

