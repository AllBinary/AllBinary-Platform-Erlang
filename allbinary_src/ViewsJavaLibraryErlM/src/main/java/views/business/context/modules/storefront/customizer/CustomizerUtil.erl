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
% import org.allbinary.data.tables.transform.info.TransformInfoEntity
% import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfo
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface
% import org.w3c.dom.Document

-module('CustomizerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CustomizerUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'CustomizerUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getTransformInfoInterfaceToCustomize(This, CustomizerTransformInfoInterface, TransformInfoInterface) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({CustomizerTransformInfoInterface, '$class'})):getName(CustomizerTransformInfoInterface)]), This, "getTransformInfoInterfaceToCustomize()");
            false -> ok
        end,
        TransformInfoEntityInterface = 'TransformInfoEntityBuilder':getInstance(),
        ViewName = (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface),
        HttpTransformInfoInterface = CustomizerTransformInfoInterface,
        CustomizedTransformInfoInterface = (get({TransformInfoEntityInterface, '$class'})):get(TransformInfoEntityInterface, ViewName, (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface), (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
        CustomizedTransformInfoInterface.

% throws Exception
getTransformInfoObjectConfigComponentNodesToCustomize(This, CustomizerTransformInfoInterface, TransformInfoInterface) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({CustomizerTransformInfoInterface, '$class'})):getName(CustomizerTransformInfoInterface)]), This, "getTransformInfoObjectConfigComponentNodesToCustomize()");
            false -> ok
        end,
        TransformInfoEntityInterface = 'TransformInfoEntityBuilder':getInstance(),
        ViewName = (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface),
        HttpTransformInfoInterface = CustomizerTransformInfoInterface,
        CustomizedTransformInfoInterface = (get({TransformInfoEntityInterface, '$class'})):get(TransformInfoEntityInterface, ViewName, (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface), (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
        (get({This, '$class'})):getTransformInfoObjectConfigComponentNodes(This, CustomizedTransformInfoInterface).

% throws Exception
getTransformInfoObjectConfigComponentNodes(This, TransformInfoInterface) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "getTransformInfoObjectConfigComponentNodes()");
            false -> ok
        end,
        TransformInfoObjectConfigInterface = (get({TransformInfoInterface, '$class'})):getObjectConfigInterface(TransformInfoInterface),
        (get({TransformInfoObjectConfigInterface, '$class'})):getTransforms(TransformInfoObjectConfigInterface).

% throws Exception
getTransformInfoObjectConfigGroupComponentNodes(This, TransformInfoInterface) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "getTransformInfoObjectConfigComponentNodes()");
            false -> ok
        end,
        TransformInfoObjectConfigInterface = (get({TransformInfoInterface, '$class'})):getObjectConfigInterface(TransformInfoInterface),
        (get({TransformInfoObjectConfigInterface, '$class'})):getGroupTransforms(TransformInfoObjectConfigInterface).

% throws Exception
insert(This, TransformInfoInterface, DomNodeInterface) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "insert()");
            false -> ok
        end,
        TransformInfoEntityInterface = 'TransformInfoEntityBuilder':getInstance(),
        AllViewsToBeModified = (get({This, '$class'})):getTransformInfoObjectConfigGroupComponentNodes(This, TransformInfoInterface),
        Document = 'DomDocumentHelper':create(),
        (get({Document, '$class'})):appendChild(Document, (get({DomNodeInterface, '$class'})):toXmlNode(DomNodeInterface, Document)),
        DocumentString = 'XmlDocumentHelper':toString(Document),
        StringBuffer = 'StringMaker':new(),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Total Views For Modification: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({AllViewsToBeModified, '$class'})):size(AllViewsToBeModified)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " New Xml/Data: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, DocumentString),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "insert()");
            false -> ok
        end,
        (get({TransformInfoInterface, '$class'})):setData(TransformInfoInterface, DocumentString),
        Size = (get({AllViewsToBeModified, '$class'})):size(AllViewsToBeModified),
        lists:foreach(fun(Index) ->
            TransformInfo = (get({AllViewsToBeModified, '$class'})):get(AllViewsToBeModified, Index),
            ViewNameOfViewToBeModified = (get({TransformInfo, '$class'})):getName(TransformInfo),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)),
                (get({StringBuffer, '$class'})):append(StringBuffer, " is modifying view: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, ViewNameOfViewToBeModified),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "insert()");
                false -> ok
            end,
            HttpTransformInfoInterface = TransformInfoInterface,
            SpecifiedTransformInfoInterface = (get({TransformInfoEntityInterface, '$class'})):get(TransformInfoEntityInterface, ViewNameOfViewToBeModified, (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface), (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
            case (SpecifiedTransformInfoInterface =:= undefined) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " is unable to add data to view: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, ViewNameOfViewToBeModified),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " since it does not exist"),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "insert()");
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([(get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface), " is adding data to view: "]), ViewNameOfViewToBeModified]), This, "insert()");
                    false -> ok
                end,
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, ViewNameOfViewToBeModified),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " is changing data in "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70180) -> (get({Target_N70180, '$class'})):toString(Target_N70180) end)((get({SpecifiedTransformInfoInterface, '$class'})):getDataFilePath(SpecifiedTransformInfoInterface))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " to the following data:\n"),
                    (get({StringBuffer, '$class'})):append(StringBuffer, DocumentString),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "insert()");
                    false -> ok
                end,
                (get({This, '$class'})):write(This, SpecifiedTransformInfoInterface, DocumentString)
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
write(This, SpecifiedTransformInfoInterface, DocumentString) when (is_list(DocumentString) orelse DocumentString =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({SpecifiedTransformInfoInterface, '$class'})):getName(SpecifiedTransformInfoInterface)]), This, "write()");
            false -> ok
        end,
        TransformInfoEntityInterface = 'TransformInfoEntityBuilder':getInstance(),
        (get({SpecifiedTransformInfoInterface, '$class'})):setData(SpecifiedTransformInfoInterface, DocumentString),
        (get({TransformInfoEntityInterface, '$class'})):update(TransformInfoEntityInterface, (get({SpecifiedTransformInfoInterface, '$class'})):toHashMap(SpecifiedTransformInfoInterface)).

% throws Exception
getViewDataForComponentsInObjectConfig(This, TransformInfoInterface) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["View Name: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, "getViewDataForComponentsInObjectConfig()");
            false -> ok
        end,
        TransformInfoObjectConfigInterface = (get({TransformInfoInterface, '$class'})):getObjectConfigInterface(TransformInfoInterface),
        AllViewsToBeModified = (get({TransformInfoObjectConfigInterface, '$class'})):getGroupTransforms(TransformInfoObjectConfigInterface),
        TransformInfoEntityInterface = 'TransformInfoEntityBuilder':getInstance(),
        Size = (get({AllViewsToBeModified, '$class'})):size(AllViewsToBeModified),
        lists:foreach(fun(Index) ->
            NextTransformInfoInterface = (get({AllViewsToBeModified, '$class'})):get(AllViewsToBeModified, Index),
            ViewNameOfViewToBeModified = (get({NextTransformInfoInterface, '$class'})):getName(NextTransformInfoInterface),
            HttpTransformInfoInterface = TransformInfoInterface,
            SpecifiedTransformInfoInterface = (get({TransformInfoEntityInterface, '$class'})):get(TransformInfoEntityInterface, ViewNameOfViewToBeModified, (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface), (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
            throw({'$return', (get({SpecifiedTransformInfoInterface, '$class'})):getDataDocument(SpecifiedTransformInfoInterface)})
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', "No Components Specified in ObjectConfig"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

