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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.BasicTransformer
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.data.TransformHttpRequestDocumentFactory
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('HttpComponentView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoHttpComposite', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, domNodeInterfaceVector}, undefined),
    put({This, transformDocumentInterface}, undefined),
    put({This, 'NO_TYPE'}, 0),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'TransformInfoHttpComposite':init(This, TransformInfoInterface),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        put({This, domNodeInterfaceVector}, 'BasicArrayListD':new()),
        (get({This, '$class'})):setTransformDocumentInterface(This, 'TransformHttpRequestDocumentFactory':getInstance((get({This, '$class'})):getPageContext(This), (get({This, '$class'})):getWeblisketSession(This))).

getTypeId(This) ->
        get({This, 'NO_TYPE'}).

getTransformDocumentInterface(This) ->
        get({This, transformDocumentInterface}).

setTransformDocumentInterface(This, TransformDocumentInterface) ->
        put({This, transformDocumentInterface}, TransformDocumentInterface).

addDomNodeInterface(This, DomNodeInterface) ->
        (get({get({This, domNodeInterfaceVector}), '$class'})):add(get({This, domNodeInterfaceVector}), DomNodeInterface).

% throws Exception
toXmlDoc(This) ->
        try
            Size = (get({get({This, domNodeInterfaceVector}), '$class'})):size(get({This, domNodeInterfaceVector})),
            lists:foreach(fun(Index) ->
                DomNodeInterface = (get({get({This, domNodeInterfaceVector}), '$class'})):get(get({This, domNodeInterfaceVector}), Index),
                (fun(Target_N67125) -> (get({Target_N67125, '$class'})):appendChild(Target_N67125, (get({DomNodeInterface, '$class'})):toXmlNode(DomNodeInterface, (get({get({This, transformDocumentInterface}), '$class'})):getDoc(get({This, transformDocumentInterface})))) end)((get({get({This, transformDocumentInterface}), '$class'})):getBaseNode(get({This, transformDocumentInterface})))
            end, lists:seq(0, Size - 1)),
            (fun(Target_N67263) -> (get({Target_N67263, '$class'})):getDoc(Target_N67263) end)((get({This, '$class'})):getTransformDocumentInterface(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "toXmlDoc()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
getDoc(This) ->
        Document = (fun(Target_N67615) -> (get({Target_N67615, '$class'})):getDataDocument(Target_N67615) end)((get({This, '$class'})):getTransformInfoInterface(This)),
        Node = 'DomNodeHelper':getFirstChildElement(Document),
        case (Node =/= undefined) of
            true ->
            DataNode = (fun(Target_N67739) -> (get({Target_N67739, '$class'})):importNode(Target_N67739, Node, true) end)((fun(Target_N67746) -> (get({Target_N67746, '$class'})):getDoc(Target_N67746) end)((get({This, '$class'})):getTransformDocumentInterface(This))),
            case (DataNode =/= undefined) of
                true ->
                (fun(Target_N67824) -> (get({Target_N67824, '$class'})):appendChild(Target_N67824, DataNode) end)((fun(Target_N67831) -> (get({Target_N67831, '$class'})):getBaseNode(Target_N67831) end)((get({This, '$class'})):getTransformDocumentInterface(This)));
                false -> ok
            end;
            false -> ok
        end,
        (fun(Target_N67872) -> (get({Target_N67872, '$class'})):getDoc(Target_N67872) end)((get({This, '$class'})):getTransformDocumentInterface(This)).

% throws Exception
view(This) ->
        try
            (get({This, '$class'})):toXmlDoc(This),
            Success = 'XmlDocumentHelper':toString((get({This, '$class'})):getDoc(This)),
            Result = (fun(Target_N68024) -> (get({Target_N68024, '$class'})):translate(Target_N68024, Success) end)('BasicTransformer':new(get({This, abeClientInformation}), (get({This, '$class'})):getTransformInfoInterface(This))),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

