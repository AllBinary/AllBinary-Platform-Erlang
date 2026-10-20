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
% package views.business.context.modules.storefront.customizer.bodies.generic.title
% import org.allbinary.business.page.PageData
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.StoreTransformer
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.template.customizer.bodies.title.TitleBodyValidation
% import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil
% import org.apache.commons.lang3.StringEscapeUtils
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('TitleBodyCustomizerView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "None"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, titleBody}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This).

% throws Exception
addDomNodeInterfaces(This) ->
        (get({This, '$class'})):addDomNodeInterface(This, get({This, titleBody})),
        (get({This, '$class'})):addDomNodeInterface(This, This).

% throws Exception
toXmlNode(This, Document) ->
        put({local, pageName}, (fun(Target_N66445) -> (get({Target_N66445, '$class'})):getPageNameHack(Target_N66445, (fun(Target_N66470) -> (get({Target_N66470, '$class'})):getName(Target_N66470) end)((get({This, '$class'})):getTransformInfoInterface(This)), (fun(Target_N66489) -> (get({Target_N66489, '$class'})):getStoreName(Target_N66489) end)((get({This, '$class'})):getWeblisketSession(This))) end)('TransformTemplateCustomizerUtil':getInstance())),
        case (fun(Target_N66529) -> (get({Target_N66529, '$class'})):isEmpty(Target_N66529, get({local, pageName})) end)('StringValidationUtil':getInstance()) of
            true ->
            put({local, pageName}, get({'TitleBodyCustomizerView', 'NAME'}));
            false -> ok
        end,
        'ModDomHelper':createNameValueNodes(Document, get({'PageData':getInstance(), 'NAME'}), get({local, pageName})).

% throws Exception
view(This) ->
        try
            Success = 'XmlDocumentHelper':toString((get({This, '$class'})):getDoc(This)),
            Result = (fun(Target_N66805) -> (get({Target_N66805, '$class'})):translate(Target_N66805, Success) end)('StoreTransformer':new(get({This, abeClientInformation}), (get({This, '$class'})):getTransformInfoInterface(This))),
            'StringEscapeUtils':unescapeHtml3(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

