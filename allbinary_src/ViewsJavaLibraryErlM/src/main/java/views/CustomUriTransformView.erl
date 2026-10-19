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
% package views
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.TransformInfoCustomUriTransformer
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.data.TransformDocumentFactory
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CustomUriTransformView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, transformInfoInterface}, undefined),
    put({This, transformDocumentInterface}, undefined),
    put({This, 'NO_TYPE'}, 0),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):setTransformInfoInterface(This, TransformInfoInterface),
        (get({This, '$class'})):setTransformDocumentInterface(This, 'TransformDocumentFactory':getInstance()).

getTypeId(This) ->
        get({This, 'NO_TYPE'}).

getTransformInfoInterface(This) ->
        get({This, transformInfoInterface}).

setTransformInfoInterface(This, TransformInfoInterface) ->
        put({This, transformInfoInterface}, TransformInfoInterface).

getTransformDocumentInterface(This) ->
        get({This, transformDocumentInterface}).

setTransformDocumentInterface(This, TransformDocumentInterface) ->
        put({This, transformDocumentInterface}, TransformDocumentInterface).

toXmlDoc(This) ->
        (get({get({This, transformDocumentInterface}), '$class'})):getDoc(get({This, transformDocumentInterface})).

% throws Exception
getDoc(This) ->
        Document = (fun(Target_N66948) -> (get({Target_N66948, '$class'})):getDataDocument(Target_N66948) end)((get({This, '$class'})):getTransformInfoInterface(This)),
        DataNode = (fun(Target_N66994) -> (get({Target_N66994, '$class'})):importNode(Target_N66994, (get({Document, '$class'})):getFirstChild(Document), true) end)((fun(Target_N67001) -> (get({Target_N67001, '$class'})):getDoc(Target_N67001) end)((get({This, '$class'})):getTransformDocumentInterface(This))),
        case (DataNode =/= undefined) of
            true ->
            (fun(Target_N67087) -> (get({Target_N67087, '$class'})):appendChild(Target_N67087, DataNode) end)((fun(Target_N67094) -> (get({Target_N67094, '$class'})):getBaseNode(Target_N67094) end)((get({This, '$class'})):getTransformDocumentInterface(This)));
            false -> ok
        end,
        (fun(Target_N67132) -> (get({Target_N67132, '$class'})):getDoc(Target_N67132) end)((get({This, '$class'})):getTransformDocumentInterface(This)).

% throws Exception
view(This) ->
        try
            Success = 'XmlDocumentHelper':toString((get({This, '$class'})):getDoc(This)),
            Result = (fun(Target_N67269) -> (get({Target_N67269, '$class'})):translate(Target_N67269, Success) end)('TransformInfoCustomUriTransformer':new(get({This, abeClientInformation}), (get({This, '$class'})):getTransformInfoInterface(This))),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

