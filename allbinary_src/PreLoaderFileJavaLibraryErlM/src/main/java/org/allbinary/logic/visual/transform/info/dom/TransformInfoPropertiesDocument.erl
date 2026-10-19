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
% package org.allbinary.logic.visual.transform.info.dom
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentFileHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoProperties
% import org.allbinary.logic.visual.transform.info.TransformInfoPropertiesFactory
% import org.allbinary.logic.visual.transform.info.TransformInfosData
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('TransformInfoPropertiesDocument').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, document}, undefined),
    ok.


new(FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FilePath),
    This.

init(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
    init_fields(This),
        XmlFile = 'AbFile':createAbFile(FilePath),
        put({This, document}, 'DomDocumentFileHelper':createDocument(XmlFile)).

toTransformInfoPropertiesHashMap(This) ->
        try
            TransformInfoPropertiesHashMap = (fun(Target_N66384) -> (get({Target_N66384, '$class'})):createHashMap(Target_N66384) end)('StdUtil':getInstance()),
            TransformInfosNode = (fun(Target_N66442) -> (get({Target_N66442, '$class'})):item(Target_N66442, 0) end)((get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TransformInfosData':getInstance(), 'NAME'}))),
            TransformInfosChildNodeList = (get({TransformInfosNode, '$class'})):getChildNodes(TransformInfosNode),
            TransformInfoNodeVector = 'DomSearchHelper':getAllNodes(get({'TransformInfoData':getInstance(), 'NAME'}), TransformInfosChildNodeList),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Size: ", (get({TransformInfoNodeVector, '$class'})):size(TransformInfoNodeVector)]), This, "toTransformInfoPropertiesHashMap()");
                false -> ok
            end,
            Size = (get({TransformInfoNodeVector, '$class'})):size(TransformInfoNodeVector),
            put({local, node}, undefined),
            put({local, transformInfoProperties}, undefined),
            lists:foreach(fun(Index) ->
                put({local, node}, (get({TransformInfoNodeVector, '$class'})):get(TransformInfoNodeVector, Index)),
                put({local, transformInfoProperties}, (fun(Target_N67069) -> (get({Target_N67069, '$class'})):getInstance(Target_N67069, get({local, node})) end)('TransformInfoPropertiesFactory':getInstance())),
                (get({TransformInfoPropertiesHashMap, '$class'})):put(TransformInfoPropertiesHashMap, (get({get({local, transformInfoProperties}), '$class'})):getName(get({local, transformInfoProperties})), get({local, transformInfoProperties}))
            end, lists:seq(0, Size - 1)),
            TransformInfoPropertiesHashMap
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "toTransformInfoPropertiesHashMap()", E);
                false -> ok
            end,
            undefined
        end.

