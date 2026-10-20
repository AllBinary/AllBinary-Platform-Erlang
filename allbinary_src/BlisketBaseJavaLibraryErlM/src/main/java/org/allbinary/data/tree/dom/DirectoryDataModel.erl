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
% package org.allbinary.data.tree.dom
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.data.TransformDocumentFactory
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('DirectoryDataModel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface
% implements TransformInterface

init_fields(This) ->
    put({This, fileBasicArrayList}, undefined),
    put({This, transformDocumentInterface}, undefined),
    put({This, 'NO_TYPE'}, 0),
    ok.


new(File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, File),
    This.

'$init'(This, File) ->
    init_fields(This),
        put({This, fileBasicArrayList}, (fun(Target_N66042) -> (get({Target_N66042, '$class'})):search(Target_N66042, File) end)('Directory':getInstance())),
        put({This, transformDocumentInterface}, 'TransformDocumentFactory':getInstance()).

getTypeId(This) ->
        get({This, 'NO_TYPE'}).

% throws Exception
getTransformInfoInterface(This) ->
        undefined.

setTransformDocumentInterface(This, TransformDocumentInterface) ->
        put({This, transformDocumentInterface}, TransformDocumentInterface).

getTransformDocumentInterface(This) ->
        get({This, transformDocumentInterface}).

% throws Exception
toXmlNode(This, Document) ->
        DirNode = (get({Document, '$class'})):createElement(Document, "dir"),
        Size = (get({get({This, fileBasicArrayList}), '$class'})):size(get({This, fileBasicArrayList})),
        put({local, nextFile}, undefined),
        put({local, fileNode}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextFile}, (get({get({This, fileBasicArrayList}), '$class'})):get(get({This, fileBasicArrayList}), Index)),
            put({local, fileNode}, (fun(Target_N66666) -> (get({Target_N66666, '$class'})):toXmlNode(Target_N66666, Document) end)('FileDomDataModel':new(get({local, nextFile})))),
            (get({DirNode, '$class'})):appendChild(DirNode, get({local, fileNode}))
        end, lists:seq(0, Size - 1)),
        DirNode.

% throws Exception
toXmlDoc(This) ->
        (fun(Target_N66894) -> (get({Target_N66894, '$class'})):getDoc(Target_N66894) end)((get({This, '$class'})):getTransformDocumentInterface(This)).

% throws Exception
view(This) ->
        Node = (get({This, '$class'})):toXmlNode(This, (fun(Target_N66978) -> (get({Target_N66978, '$class'})):getDoc(Target_N66978) end)((get({This, '$class'})):getTransformDocumentInterface(This))),
        (fun(Target_N67018) -> (get({Target_N67018, '$class'})):appendChild(Target_N67018, Node) end)((fun(Target_N67025) -> (get({Target_N67025, '$class'})):getBaseNode(Target_N67025) end)((get({This, '$class'})):getTransformDocumentInterface(This))),
        'XmlDocumentHelper':toString((fun(Target_N67077) -> (get({Target_N67077, '$class'})):getDoc(Target_N67077) end)((get({This, '$class'})):getTransformDocumentInterface(This))).

